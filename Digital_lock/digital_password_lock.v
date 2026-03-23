// ============================================================================
// Digital Password Lock 
// ============================================================================
//
// HOW IT WORKS:
//   1. Enter password using switches
//   2. Entered password is compared to stored password
//   3. If the password is wrong 3 times, red blinks indicating system lock
//   3. Green LED glows if password matches, otherwise red LED glows


`timescale 1ns/1ps
/* verilator lint_off DECLFILENAME */
/* verilator lint_off UNUSEDPARAM */
// ============================================================================
// Password Comparator
// ============================================================================
module password_core (
    input wire [3:0] entered_pw,
    output wire match
);

    parameter stored_pw = 4'b1011;

    assign match = (entered_pw == stored_pw);

endmodule


// ============================================================================
// 4-bit Register
// Stores the switch value when load is asserted
// ============================================================================
module register4 (
    input             clk,
    input             rst_n,
    input             load,
    input      [3:0]  d,
    output reg [3:0]  q
);

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            q <= 4'b0000;
        else if (load)
            q <= d;
    end

endmodule


// ============================================================================
// Top Module with FSM
// States:
//   IDLE: waiting
//   CHECK: compare entered password
//   ACCESS_OK: green LED on
//   ACCESS_FAIL: red LED on
// ============================================================================

module digital_password_lock #(
    parameter CLK_FREQ = 50_000_000
    
)(
    input  wire       clk,
    input  wire       rst_n,
    input  wire       btn,
    input  wire [3:0] pw_switch,
    output wire       green_led,
    output wire       red_led,
    output wire [2:0] state_out     // for waveform viewing
);

    // ------------------------------------------------------------------------
    // Internal signals
    // ------------------------------------------------------------------------
    wire btn_pressed;
    wire match;
    wire [3:0] entered_pw;
   
    reg [2:0] state, next_state;
    
    //failed attempts
    reg[1:0] fail_count;
    
    //blink
    reg[23:0] blink_counter;
    reg blink;


    localparam IDLE        = 3'b000;
    localparam LOAD        = 3'b001;
    localparam CHECK       = 3'b010;
    localparam ACCESS_OK   = 3'b011;
    localparam ACCESS_FAIL = 3'b100;
    localparam LOCKED      = 3'b101;

    // ------------------------------------------------------------------------
    // Debounce
    // ------------------------------------------------------------------------
    
    debounce #(
        .CLK_FREQ(CLK_FREQ)
    ) debounce_inst (
        .clk(clk),
        .rst_n(rst_n),
        .btn_raw(btn),
        .btn_pressed(btn_pressed)
    );

    // ------------------------------------------------------------------------
    // Register
    // Capture password when debounced button is pressed
    // ------------------------------------------------------------------------
    
    register4 pw_register (
        .clk(clk),
        .rst_n(rst_n),
        .load(btn_pressed),
        .d(pw_switch),
        .q(entered_pw)
    );

    // ------------------------------------------------------------------------
    // Comparator
    // ------------------------------------------------------------------------
    password_core core (
        .entered_pw(entered_pw),
        .match(match)
    );

    // ------------------------------------------------------------------------
    // FSM state register
    // ------------------------------------------------------------------------
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            state <= IDLE;
        else
            state <= next_state;
    end
    
    // ------------------------------------------------------------------------
    // Fail counter
    // ------------------------------------------------------------------------
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            fail_count <= 0;

        else if (state == ACCESS_OK)
            fail_count <= 0;

        else if (state == CHECK && !match)
            fail_count <= fail_count + 1;
    end

    // ------------------------------------------------------------------------
    // Blink generator
    // ------------------------------------------------------------------------
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            blink_counter <= 0;
            blink <= 0;
        end
        else begin
            blink_counter <= blink_counter + 1;
            blink <= blink_counter[10];
        end
    end

    // ------------------------------------------------------------------------
    // FSM next-state logic
    // ------------------------------------------------------------------------
    always @(*) begin
        next_state = state;

        case (state)
            IDLE: begin
                if (btn_pressed)
                    next_state = LOAD;
            end
            
            LOAD: begin
                    next_state = CHECK;
            end

            CHECK: begin
                if (match)
                    next_state = ACCESS_OK;
                else if (fail_count == 2)
                    next_state = LOCKED;
                else
                    next_state = ACCESS_FAIL;
            end

            ACCESS_OK: begin
                if (btn_pressed)
                    next_state = LOAD;
            end

            ACCESS_FAIL: begin
                if (btn_pressed)
                    next_state = LOAD;
            end
            
            LOCKED: begin
            	next_state = LOCKED;
            end
            
            default: begin
            next_state = IDLE;
            end
        endcase
    end

    // ------------------------------------------------------------------------
    // Outputs
    // ------------------------------------------------------------------------
    assign green_led = (state == ACCESS_OK);
    assign red_led   = 
    	(state == ACCESS_FAIL) ? 1'b1:
    	(state == LOCKED)      ? blink :
				 0;    				
    	
    assign state_out = state;
    
endmodule
