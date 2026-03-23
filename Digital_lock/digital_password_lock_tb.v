// ============================================================================
// Digital Password LockTestbench
// ============================================================================
//
// HOW TO RUN THIS TESTBENCH:
//   $ iverilog -o sim.vvp -I../lib fortune_teller.v fortune_teller_tb.v ../lib/*.v
//   $ vvp sim.vvp
//   $ gtkwave filename.vcd   (optional: view waveforms)
//
// ============================================================================

`timescale 1ns/1ps
/* verilator lint_off UNUSEDSIGNAL */


module digital_password_lock_tb;

    reg clk;
    reg rst_n;
    reg btn;
    reg [3:0] pw_switch;

    wire green_led;
    wire red_led;
    wire [2:0] state_out;

    // ASCII messages for GTKWave
    reg [8*40-1:0] message;
    reg [8*24-1:0] state_name;

    // ------------------------------------------------------------------------
    // DUT
    // ------------------------------------------------------------------------
    digital_password_lock #(
        .CLK_FREQ(1_000_000)
    ) dut (
        .clk(clk),
        .rst_n(rst_n),
        .btn(btn),
        .pw_switch(pw_switch),
        .green_led(green_led),
        .red_led(red_led),
        .state_out(state_out)
    );

    // ------------------------------------------------------------------------
    // Clock generation: 1 MHz clock
    // ------------------------------------------------------------------------
    always #500 clk = ~clk;

    // ------------------------------------------------------------------------
    // Decode state for GTKWave ASCII viewing
    // ------------------------------------------------------------------------
    always @(*) begin
        case (state_out)
            3'b000: state_name = "IDLE";
            3'b001: state_name = "LOAD";
            3'b010: state_name = "CHECK";
            3'b011: state_name = "ACCESS_GRANTED";
            3'b100: state_name = "ACCESS_DENIED";
            3'b101: state_name = "LOCKED";
            default: state_name ="UNKNOWN";
        endcase
    end

    // ------------------------------------------------------------------------
    // Button press task
    // ------------------------------------------------------------------------
    task press_button;
    begin
        btn = 1;
        #15000000;
        btn = 0;
    end
    endtask

    // ------------------------------------------------------------------------
    // Simulation
    // ------------------------------------------------------------------------
    initial begin
        $dumpfile("password_lock_tb.vcd");
        $dumpvars(0, digital_password_lock_tb);

        clk       = 0;
        rst_n     = 0;
        btn       = 0;
        pw_switch = 4'b0000;
        message   = "SYSTEM RESET";

        #3000;
        rst_n   = 1;
        message = "USER ENTERS PASSWORD";

        $display("\nUser enters password...");
        #3000000;

        // ------------------------------------------------------------
        // Attempt 1 Wrong password attempt
        // ------------------------------------------------------------
        
        pw_switch = 4'b0000;
        press_button();

        message = "CHECKING PASSWORD";
         $display("\nChecking Password..");
         
         #20000000;
         
         if(state_out == 3'b100) begin
         	message = "WRONG PASSWORD";
                $display("\nAttempt 1: Wrong Password");
         end
        
        #50000000;
	
	// ------------------------------------------------------------
        // Attempt 2 Wrong password attempt
        // ------------------------------------------------------------
        message = "USER ENTERS PASSWORD AGAIN";
        $display("\nUser enters password again...");
        
        pw_switch = 4'b0011;
        press_button();
	#50000000;
        message = "CHECKING PASSWORD";
         $display("\nChecking Password..");
         
         #50000000;
        
          if(state_out == 3'b100) begin
         	message = "WRONG PASSWORD";
                $display("\nAttempt 2: Wrong Password");
          end
        #4000000;
        
        // ------------------------------------------------------------
        // Attempt 3 Wrong password attempt to locked
        // ------------------------------------------------------------
        message = "USER ENTERS PASSWORD AGAIN";
        $display("\nUser enters password again...");

        pw_switch = 4'b0101;
        press_button();
        
        message = "CHECKING PASSWORD";
        $display("\nChecking Password..");
        
         #50000000;
        
         if(state_out == 3'b101)begin
         	message = "SYSTEM LOCKED- RED LED BLINKING";
        	$display("\nAttempt 3 : System is Locked, Red LED Blinking_-_-_-");
         end
        
        // observe blinking
        #100000000;
        
        // ------------------------------------------------------------
        // System Reset
        // ------------------------------------------------------------
        message = "SYSTEM RESET";
        $display("\nSystem Reseting...");
   	
   	rst_n = 0;
   	#5000;
   	rst_n= 1;
   	
        #20000000;
        
        // ------------------------------------------------------------
        // Correct Password
        // ------------------------------------------------------------
        message = "USER ENTERS PASSWORD AGAIN";
        $display("\nUser enters password again...");
        
        #3000000;

        pw_switch = 4'b1011;
        press_button();

        message = "CHECKING PASSWORD";
         $display("\nChecking Password...");
        
        #20000000;
        
        if (state_out == 3'b011) begin
            message = "ACCESS GRANTED";
            $display("\n ACCESS GRANTED!");
            $display("\n WELCOME");
        end
        else begin
            message = "ERROR";
            $display("ERROR: Expected green LED");
        end

        #3000000;
        
        message = "SIMULATION DONE";
        $display("\nSimulation finished.\n");
        $finish;
    end

endmodule
