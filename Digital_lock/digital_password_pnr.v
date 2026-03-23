module digital_password_lock (btn,
    clk,
    green_led,
    red_led,
    rst_n,
    pw_switch,
    state_out);
 input btn;
 input clk;
 output green_led;
 output red_led;
 input rst_n;
 input [3:0] pw_switch;
 output [2:0] state_out;

 wire _00_;
 wire _01_;
 wire _02_;
 wire _03_;
 wire _04_;
 wire _05_;
 wire _06_;
 wire _07_;
 wire _08_;
 wire _09_;
 wire _10_;
 wire _11_;
 wire _12_;
 wire _13_;
 wire _14_;
 wire _15_;
 wire _16_;
 wire _17_;
 wire _18_;
 wire _19_;
 wire _20_;
 wire _21_;
 wire _22_;
 wire _23_;
 wire _24_;
 wire _25_;
 wire _26_;
 wire _27_;
 wire _28_;
 wire _29_;
 wire _30_;
 wire _31_;
 wire blink;
 wire btn_pressed;
 wire match;
 wire \debounce_inst/_000_ ;
 wire \debounce_inst/_002_ ;
 wire \debounce_inst/_003_ ;
 wire \debounce_inst/_004_ ;
 wire \debounce_inst/_005_ ;
 wire \debounce_inst/_006_ ;
 wire \debounce_inst/_007_ ;
 wire \debounce_inst/_008_ ;
 wire \debounce_inst/_009_ ;
 wire \debounce_inst/_010_ ;
 wire \debounce_inst/_011_ ;
 wire \debounce_inst/_012_ ;
 wire \debounce_inst/_013_ ;
 wire \debounce_inst/_014_ ;
 wire \debounce_inst/_015_ ;
 wire \debounce_inst/_016_ ;
 wire \debounce_inst/_017_ ;
 wire \debounce_inst/_018_ ;
 wire \debounce_inst/_019_ ;
 wire \debounce_inst/_020_ ;
 wire \debounce_inst/_021_ ;
 wire \debounce_inst/_022_ ;
 wire \debounce_inst/_023_ ;
 wire \debounce_inst/_024_ ;
 wire \debounce_inst/_025_ ;
 wire \debounce_inst/_026_ ;
 wire \debounce_inst/_027_ ;
 wire \debounce_inst/_028_ ;
 wire \debounce_inst/_029_ ;
 wire \debounce_inst/_030_ ;
 wire \debounce_inst/_031_ ;
 wire \debounce_inst/_032_ ;
 wire \debounce_inst/_033_ ;
 wire \debounce_inst/_034_ ;
 wire \debounce_inst/_035_ ;
 wire \debounce_inst/_036_ ;
 wire \debounce_inst/_037_ ;
 wire \debounce_inst/btn_prev ;
 wire \debounce_inst/btn_stable ;
 wire \debounce_inst/btn_sync ;
 wire \pw_register/_00_ ;
 wire \pw_register/_01_ ;
 wire \pw_register/_02_ ;
 wire \pw_register/_03_ ;
 wire clknet_0_clk;
 wire clknet_2_0__leaf_clk;
 wire clknet_2_1__leaf_clk;
 wire clknet_2_2__leaf_clk;
 wire clknet_2_3__leaf_clk;
 wire [0:0] _32_;
 wire [10:0] _33_;
 wire [23:0] blink_counter;
 wire [18:0] \debounce_inst/_001_ ;
 wire [18:0] \debounce_inst/counter ;
 wire [3:0] entered_pw;
 wire [1:0] fail_count;
 wire [2:0] state;

 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_0_0 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_0_1 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_0_2 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_0_3 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_10_22 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_10_23 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_11_24 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_11_25 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_12_26 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_12_27 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_13_28 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_13_29 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_14_30 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_14_31 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_15_32 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_15_33 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_16_34 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_16_35 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_17_36 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_17_37 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_18_38 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_18_39 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_19_40 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_19_41 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_1_4 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_1_5 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_20_42 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_20_43 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_20_44 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_20_45 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_2_6 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_2_7 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_3_8 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_3_9 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_4_10 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_4_11 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_5_12 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_5_13 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_6_14 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_6_15 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_7_16 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_7_17 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_8_18 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_8_19 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_9_20 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_9_21 ();
 sky130_fd_sc_hd__clkinv_1 _34_ (.A(blink_counter[0]),
    .Y(_32_[0]));
 sky130_fd_sc_hd__lpflow_isobufsrc_1 _35_ (.A(state[0]),
    .SLEEP(blink),
    .X(_05_));
 sky130_fd_sc_hd__nor3b_1 _36_ (.A(state[1]),
    .B(_05_),
    .C_N(state[2]),
    .Y(red_led));
 sky130_fd_sc_hd__nand2_1 _37_ (.A(blink_counter[0]),
    .B(blink_counter[1]),
    .Y(_06_));
 sky130_fd_sc_hd__xor2_1 _38_ (.A(blink_counter[0]),
    .B(blink_counter[1]),
    .X(_33_[1]));
 sky130_fd_sc_hd__xnor2_1 _39_ (.A(blink_counter[2]),
    .B(_06_),
    .Y(_33_[2]));
 sky130_fd_sc_hd__and4_1 _40_ (.A(blink_counter[0]),
    .B(blink_counter[1]),
    .C(blink_counter[2]),
    .D(blink_counter[3]),
    .X(_07_));
 sky130_fd_sc_hd__a31oi_1 _41_ (.A1(blink_counter[0]),
    .A2(blink_counter[1]),
    .A3(blink_counter[2]),
    .B1(blink_counter[3]),
    .Y(_08_));
 sky130_fd_sc_hd__nor2_1 _42_ (.A(_07_),
    .B(_08_),
    .Y(_33_[3]));
 sky130_fd_sc_hd__nand2_1 _43_ (.A(blink_counter[4]),
    .B(_07_),
    .Y(_09_));
 sky130_fd_sc_hd__xor2_1 _44_ (.A(blink_counter[4]),
    .B(_07_),
    .X(_33_[4]));
 sky130_fd_sc_hd__xnor2_1 _45_ (.A(blink_counter[5]),
    .B(_09_),
    .Y(_33_[5]));
 sky130_fd_sc_hd__and4_1 _46_ (.A(blink_counter[4]),
    .B(blink_counter[5]),
    .C(blink_counter[6]),
    .D(_07_),
    .X(_10_));
 sky130_fd_sc_hd__a31oi_1 _47_ (.A1(blink_counter[4]),
    .A2(blink_counter[5]),
    .A3(_07_),
    .B1(blink_counter[6]),
    .Y(_11_));
 sky130_fd_sc_hd__nor2_1 _48_ (.A(_10_),
    .B(_11_),
    .Y(_33_[6]));
 sky130_fd_sc_hd__nand2_1 _49_ (.A(blink_counter[7]),
    .B(_10_),
    .Y(_12_));
 sky130_fd_sc_hd__xor2_1 _50_ (.A(blink_counter[7]),
    .B(_10_),
    .X(_33_[7]));
 sky130_fd_sc_hd__xnor2_1 _51_ (.A(blink_counter[8]),
    .B(_12_),
    .Y(_33_[8]));
 sky130_fd_sc_hd__nand4_1 _52_ (.A(blink_counter[7]),
    .B(blink_counter[8]),
    .C(blink_counter[9]),
    .D(_10_),
    .Y(_13_));
 sky130_fd_sc_hd__a31oi_1 _53_ (.A1(blink_counter[7]),
    .A2(blink_counter[8]),
    .A3(_10_),
    .B1(blink_counter[9]),
    .Y(_14_));
 sky130_fd_sc_hd__lpflow_isobufsrc_1 _54_ (.A(_13_),
    .SLEEP(_14_),
    .X(_33_[9]));
 sky130_fd_sc_hd__xnor2_1 _55_ (.A(blink_counter[10]),
    .B(_13_),
    .Y(_33_[10]));
 sky130_fd_sc_hd__and3b_1 _56_ (.A_N(state[2]),
    .B(state[1]),
    .C(state[0]),
    .X(green_led));
 sky130_fd_sc_hd__clkinv_1 _57_ (.A(green_led),
    .Y(_15_));
 sky130_fd_sc_hd__nor3b_1 _58_ (.A(state[2]),
    .B(state[0]),
    .C_N(state[1]),
    .Y(_16_));
 sky130_fd_sc_hd__nor4b_1 _59_ (.A(state[2]),
    .B(state[0]),
    .C(match),
    .D_N(state[1]),
    .Y(_17_));
 sky130_fd_sc_hd__nor2_1 _60_ (.A(fail_count[0]),
    .B(_17_),
    .Y(_18_));
 sky130_fd_sc_hd__nand2_1 _61_ (.A(fail_count[0]),
    .B(_17_),
    .Y(_19_));
 sky130_fd_sc_hd__nor3b_1 _62_ (.A(green_led),
    .B(_18_),
    .C_N(_19_),
    .Y(_00_));
 sky130_fd_sc_hd__xor2_1 _63_ (.A(fail_count[1]),
    .B(_19_),
    .X(_20_));
 sky130_fd_sc_hd__nor2_1 _64_ (.A(green_led),
    .B(_20_),
    .Y(_01_));
 sky130_fd_sc_hd__nor2_1 _65_ (.A(state[1]),
    .B(state[0]),
    .Y(_21_));
 sky130_fd_sc_hd__nor2_1 _66_ (.A(green_led),
    .B(_21_),
    .Y(_22_));
 sky130_fd_sc_hd__nor2_1 _67_ (.A(btn_pressed),
    .B(_22_),
    .Y(_23_));
 sky130_fd_sc_hd__lpflow_isobufsrc_1 _68_ (.A(fail_count[1]),
    .SLEEP(fail_count[0]),
    .X(_24_));
 sky130_fd_sc_hd__o21ai_0 _69_ (.A1(match),
    .A2(_24_),
    .B1(_16_),
    .Y(_25_));
 sky130_fd_sc_hd__nand3b_1 _70_ (.A_N(state[1]),
    .B(state[0]),
    .C(state[2]),
    .Y(_26_));
 sky130_fd_sc_hd__and3_1 _71_ (.A(_22_),
    .B(_25_),
    .C(_26_),
    .X(_27_));
 sky130_fd_sc_hd__o22ai_1 _72_ (.A1(btn_pressed),
    .A2(_15_),
    .B1(_23_),
    .B2(_27_),
    .Y(_02_));
 sky130_fd_sc_hd__nand2_1 _73_ (.A(match),
    .B(_16_),
    .Y(_28_));
 sky130_fd_sc_hd__nand2_1 _74_ (.A(state[1]),
    .B(btn_pressed),
    .Y(_29_));
 sky130_fd_sc_hd__nand2_1 _75_ (.A(state[0]),
    .B(_29_),
    .Y(_30_));
 sky130_fd_sc_hd__o21ai_0 _76_ (.A1(state[2]),
    .A2(_30_),
    .B1(_28_),
    .Y(_03_));
 sky130_fd_sc_hd__nand2b_1 _77_ (.A_N(_17_),
    .B(_26_),
    .Y(_31_));
 sky130_fd_sc_hd__a21o_1 _78_ (.A1(state[2]),
    .A2(_23_),
    .B1(_31_),
    .X(_04_));
 sky130_fd_sc_hd__dfrtp_1 _79_ (.CLK(clknet_2_0__leaf_clk),
    .D(_00_),
    .RESET_B(rst_n),
    .Q(fail_count[0]));
 sky130_fd_sc_hd__dfrtp_1 _80_ (.CLK(clknet_2_0__leaf_clk),
    .D(_01_),
    .RESET_B(rst_n),
    .Q(fail_count[1]));
 sky130_fd_sc_hd__dfrtp_1 _81_ (.CLK(clknet_2_0__leaf_clk),
    .D(_02_),
    .RESET_B(rst_n),
    .Q(state[0]));
 sky130_fd_sc_hd__dfrtp_1 _82_ (.CLK(clknet_2_2__leaf_clk),
    .D(_03_),
    .RESET_B(rst_n),
    .Q(state[1]));
 sky130_fd_sc_hd__dfrtp_1 _83_ (.CLK(clknet_2_0__leaf_clk),
    .D(_04_),
    .RESET_B(rst_n),
    .Q(state[2]));
 sky130_fd_sc_hd__dfrtp_1 _84_ (.CLK(clknet_2_1__leaf_clk),
    .D(_32_[0]),
    .RESET_B(rst_n),
    .Q(blink_counter[0]));
 sky130_fd_sc_hd__dfrtp_1 _85_ (.CLK(clknet_2_1__leaf_clk),
    .D(_33_[1]),
    .RESET_B(rst_n),
    .Q(blink_counter[1]));
 sky130_fd_sc_hd__dfrtp_1 _86_ (.CLK(clknet_2_1__leaf_clk),
    .D(_33_[2]),
    .RESET_B(rst_n),
    .Q(blink_counter[2]));
 sky130_fd_sc_hd__dfrtp_1 _87_ (.CLK(clknet_2_1__leaf_clk),
    .D(_33_[3]),
    .RESET_B(rst_n),
    .Q(blink_counter[3]));
 sky130_fd_sc_hd__dfrtp_1 _88_ (.CLK(clknet_2_0__leaf_clk),
    .D(_33_[4]),
    .RESET_B(rst_n),
    .Q(blink_counter[4]));
 sky130_fd_sc_hd__dfrtp_1 _89_ (.CLK(clknet_2_0__leaf_clk),
    .D(_33_[5]),
    .RESET_B(rst_n),
    .Q(blink_counter[5]));
 sky130_fd_sc_hd__dfrtp_1 _90_ (.CLK(clknet_2_0__leaf_clk),
    .D(_33_[6]),
    .RESET_B(rst_n),
    .Q(blink_counter[6]));
 sky130_fd_sc_hd__dfrtp_1 _91_ (.CLK(clknet_2_0__leaf_clk),
    .D(_33_[7]),
    .RESET_B(rst_n),
    .Q(blink_counter[7]));
 sky130_fd_sc_hd__dfrtp_1 _92_ (.CLK(clknet_2_0__leaf_clk),
    .D(_33_[8]),
    .RESET_B(rst_n),
    .Q(blink_counter[8]));
 sky130_fd_sc_hd__dfrtp_1 _93_ (.CLK(clknet_2_0__leaf_clk),
    .D(_33_[9]),
    .RESET_B(rst_n),
    .Q(blink_counter[9]));
 sky130_fd_sc_hd__dfrtp_1 _94_ (.CLK(clknet_2_0__leaf_clk),
    .D(_33_[10]),
    .RESET_B(rst_n),
    .Q(blink_counter[10]));
 sky130_fd_sc_hd__dfrtp_1 _95_ (.CLK(clknet_2_0__leaf_clk),
    .D(blink_counter[10]),
    .RESET_B(rst_n),
    .Q(blink));
 sky130_fd_sc_hd__clkbuf_4 clkbuf_0_clk (.A(clk),
    .X(clknet_0_clk));
 sky130_fd_sc_hd__clkbuf_4 clkbuf_2_0__f_clk (.A(clknet_0_clk),
    .X(clknet_2_0__leaf_clk));
 sky130_fd_sc_hd__clkbuf_4 clkbuf_2_1__f_clk (.A(clknet_0_clk),
    .X(clknet_2_1__leaf_clk));
 sky130_fd_sc_hd__clkbuf_4 clkbuf_2_2__f_clk (.A(clknet_0_clk),
    .X(clknet_2_2__leaf_clk));
 sky130_fd_sc_hd__clkbuf_4 clkbuf_2_3__f_clk (.A(clknet_0_clk),
    .X(clknet_2_3__leaf_clk));
 sky130_fd_sc_hd__and4b_1 \core/_0_  (.A_N(entered_pw[2]),
    .B(entered_pw[3]),
    .C(entered_pw[0]),
    .D(entered_pw[1]),
    .X(match));
 sky130_fd_sc_hd__lpflow_isobufsrc_1 \debounce_inst/_038_  (.A(\debounce_inst/btn_stable ),
    .SLEEP(\debounce_inst/btn_prev ),
    .X(\debounce_inst/_000_ ));
 sky130_fd_sc_hd__o31ai_1 \debounce_inst/_039_  (.A1(\debounce_inst/counter [5]),
    .A2(\debounce_inst/counter [7]),
    .A3(\debounce_inst/counter [6]),
    .B1(\debounce_inst/counter [8]),
    .Y(\debounce_inst/_003_ ));
 sky130_fd_sc_hd__nor4_1 \debounce_inst/_040_  (.A(\debounce_inst/counter [9]),
    .B(\debounce_inst/counter [11]),
    .C(\debounce_inst/counter [10]),
    .D(\debounce_inst/counter [12]),
    .Y(\debounce_inst/_004_ ));
 sky130_fd_sc_hd__a21boi_0 \debounce_inst/_041_  (.A1(\debounce_inst/_003_ ),
    .A2(\debounce_inst/_004_ ),
    .B1_N(\debounce_inst/counter [13]),
    .Y(\debounce_inst/_005_ ));
 sky130_fd_sc_hd__and2_0 \debounce_inst/_042_  (.A(\debounce_inst/counter [15]),
    .B(\debounce_inst/counter [16]),
    .X(\debounce_inst/_006_ ));
 sky130_fd_sc_hd__and3_1 \debounce_inst/_043_  (.A(\debounce_inst/counter [15]),
    .B(\debounce_inst/counter [17]),
    .C(\debounce_inst/counter [16]),
    .X(\debounce_inst/_007_ ));
 sky130_fd_sc_hd__o211ai_1 \debounce_inst/_044_  (.A1(\debounce_inst/counter [14]),
    .A2(\debounce_inst/_005_ ),
    .B1(\debounce_inst/_007_ ),
    .C1(\debounce_inst/counter [18]),
    .Y(\debounce_inst/_008_ ));
 sky130_fd_sc_hd__xor2_1 \debounce_inst/_045_  (.A(\debounce_inst/btn_stable ),
    .B(\debounce_inst/btn_sync ),
    .X(\debounce_inst/_009_ ));
 sky130_fd_sc_hd__nand2_1 \debounce_inst/_046_  (.A(\debounce_inst/_008_ ),
    .B(\debounce_inst/_009_ ),
    .Y(\debounce_inst/_010_ ));
 sky130_fd_sc_hd__nor2_1 \debounce_inst/_047_  (.A(\debounce_inst/counter [0]),
    .B(\debounce_inst/_010_ ),
    .Y(\debounce_inst/_001_ [0]));
 sky130_fd_sc_hd__xnor2_1 \debounce_inst/_048_  (.A(\debounce_inst/counter [0]),
    .B(\debounce_inst/counter [1]),
    .Y(\debounce_inst/_011_ ));
 sky130_fd_sc_hd__nor2_1 \debounce_inst/_049_  (.A(\debounce_inst/_010_ ),
    .B(\debounce_inst/_011_ ),
    .Y(\debounce_inst/_001_ [1]));
 sky130_fd_sc_hd__a21oi_1 \debounce_inst/_050_  (.A1(\debounce_inst/counter [0]),
    .A2(\debounce_inst/counter [1]),
    .B1(\debounce_inst/counter [2]),
    .Y(\debounce_inst/_012_ ));
 sky130_fd_sc_hd__and3_1 \debounce_inst/_051_  (.A(\debounce_inst/counter [2]),
    .B(\debounce_inst/counter [0]),
    .C(\debounce_inst/counter [1]),
    .X(\debounce_inst/_013_ ));
 sky130_fd_sc_hd__nor3_1 \debounce_inst/_052_  (.A(\debounce_inst/_010_ ),
    .B(\debounce_inst/_012_ ),
    .C(\debounce_inst/_013_ ),
    .Y(\debounce_inst/_001_ [2]));
 sky130_fd_sc_hd__nor2_1 \debounce_inst/_053_  (.A(\debounce_inst/counter [3]),
    .B(\debounce_inst/_013_ ),
    .Y(\debounce_inst/_014_ ));
 sky130_fd_sc_hd__and4_1 \debounce_inst/_054_  (.A(\debounce_inst/counter [3]),
    .B(\debounce_inst/counter [2]),
    .C(\debounce_inst/counter [0]),
    .D(\debounce_inst/counter [1]),
    .X(\debounce_inst/_015_ ));
 sky130_fd_sc_hd__nor3_1 \debounce_inst/_055_  (.A(\debounce_inst/_010_ ),
    .B(\debounce_inst/_014_ ),
    .C(\debounce_inst/_015_ ),
    .Y(\debounce_inst/_001_ [3]));
 sky130_fd_sc_hd__nor2_1 \debounce_inst/_056_  (.A(\debounce_inst/counter [4]),
    .B(\debounce_inst/_015_ ),
    .Y(\debounce_inst/_016_ ));
 sky130_fd_sc_hd__and2_0 \debounce_inst/_057_  (.A(\debounce_inst/counter [4]),
    .B(\debounce_inst/_015_ ),
    .X(\debounce_inst/_017_ ));
 sky130_fd_sc_hd__nor3_1 \debounce_inst/_058_  (.A(\debounce_inst/_010_ ),
    .B(\debounce_inst/_016_ ),
    .C(\debounce_inst/_017_ ),
    .Y(\debounce_inst/_001_ [4]));
 sky130_fd_sc_hd__xnor2_1 \debounce_inst/_059_  (.A(\debounce_inst/counter [5]),
    .B(\debounce_inst/_017_ ),
    .Y(\debounce_inst/_018_ ));
 sky130_fd_sc_hd__nor2_1 \debounce_inst/_060_  (.A(\debounce_inst/_010_ ),
    .B(\debounce_inst/_018_ ),
    .Y(\debounce_inst/_001_ [5]));
 sky130_fd_sc_hd__a21oi_1 \debounce_inst/_061_  (.A1(\debounce_inst/counter [5]),
    .A2(\debounce_inst/_017_ ),
    .B1(\debounce_inst/counter [6]),
    .Y(\debounce_inst/_019_ ));
 sky130_fd_sc_hd__and4_1 \debounce_inst/_062_  (.A(\debounce_inst/counter [4]),
    .B(\debounce_inst/counter [5]),
    .C(\debounce_inst/counter [6]),
    .D(\debounce_inst/_015_ ),
    .X(\debounce_inst/_020_ ));
 sky130_fd_sc_hd__nor3_1 \debounce_inst/_063_  (.A(\debounce_inst/_010_ ),
    .B(\debounce_inst/_019_ ),
    .C(\debounce_inst/_020_ ),
    .Y(\debounce_inst/_001_ [6]));
 sky130_fd_sc_hd__and2_0 \debounce_inst/_064_  (.A(\debounce_inst/counter [7]),
    .B(\debounce_inst/_020_ ),
    .X(\debounce_inst/_021_ ));
 sky130_fd_sc_hd__nor2_1 \debounce_inst/_065_  (.A(\debounce_inst/_010_ ),
    .B(\debounce_inst/_021_ ),
    .Y(\debounce_inst/_022_ ));
 sky130_fd_sc_hd__o21a_1 \debounce_inst/_066_  (.A1(\debounce_inst/counter [7]),
    .A2(\debounce_inst/_020_ ),
    .B1(\debounce_inst/_022_ ),
    .X(\debounce_inst/_001_ [7]));
 sky130_fd_sc_hd__nor2_1 \debounce_inst/_067_  (.A(\debounce_inst/counter [8]),
    .B(\debounce_inst/_021_ ),
    .Y(\debounce_inst/_023_ ));
 sky130_fd_sc_hd__a211oi_1 \debounce_inst/_068_  (.A1(\debounce_inst/counter [8]),
    .A2(\debounce_inst/_021_ ),
    .B1(\debounce_inst/_023_ ),
    .C1(\debounce_inst/_010_ ),
    .Y(\debounce_inst/_001_ [8]));
 sky130_fd_sc_hd__a21oi_1 \debounce_inst/_069_  (.A1(\debounce_inst/counter [8]),
    .A2(\debounce_inst/_021_ ),
    .B1(\debounce_inst/counter [9]),
    .Y(\debounce_inst/_024_ ));
 sky130_fd_sc_hd__and4_1 \debounce_inst/_070_  (.A(\debounce_inst/counter [7]),
    .B(\debounce_inst/counter [9]),
    .C(\debounce_inst/counter [8]),
    .D(\debounce_inst/_020_ ),
    .X(\debounce_inst/_025_ ));
 sky130_fd_sc_hd__nor3_1 \debounce_inst/_071_  (.A(\debounce_inst/_010_ ),
    .B(\debounce_inst/_024_ ),
    .C(\debounce_inst/_025_ ),
    .Y(\debounce_inst/_001_ [9]));
 sky130_fd_sc_hd__and2_0 \debounce_inst/_072_  (.A(\debounce_inst/counter [10]),
    .B(\debounce_inst/_025_ ),
    .X(\debounce_inst/_026_ ));
 sky130_fd_sc_hd__nor2_1 \debounce_inst/_073_  (.A(\debounce_inst/counter [10]),
    .B(\debounce_inst/_025_ ),
    .Y(\debounce_inst/_027_ ));
 sky130_fd_sc_hd__nor3_1 \debounce_inst/_074_  (.A(\debounce_inst/_010_ ),
    .B(\debounce_inst/_026_ ),
    .C(\debounce_inst/_027_ ),
    .Y(\debounce_inst/_001_ [10]));
 sky130_fd_sc_hd__a21oi_1 \debounce_inst/_075_  (.A1(\debounce_inst/counter [11]),
    .A2(\debounce_inst/_026_ ),
    .B1(\debounce_inst/_010_ ),
    .Y(\debounce_inst/_028_ ));
 sky130_fd_sc_hd__o21a_1 \debounce_inst/_076_  (.A1(\debounce_inst/counter [11]),
    .A2(\debounce_inst/_026_ ),
    .B1(\debounce_inst/_028_ ),
    .X(\debounce_inst/_001_ [11]));
 sky130_fd_sc_hd__and4_1 \debounce_inst/_077_  (.A(\debounce_inst/counter [11]),
    .B(\debounce_inst/counter [10]),
    .C(\debounce_inst/counter [12]),
    .D(\debounce_inst/_025_ ),
    .X(\debounce_inst/_029_ ));
 sky130_fd_sc_hd__a21oi_1 \debounce_inst/_078_  (.A1(\debounce_inst/counter [11]),
    .A2(\debounce_inst/_026_ ),
    .B1(\debounce_inst/counter [12]),
    .Y(\debounce_inst/_030_ ));
 sky130_fd_sc_hd__nor3_1 \debounce_inst/_079_  (.A(\debounce_inst/_010_ ),
    .B(\debounce_inst/_029_ ),
    .C(\debounce_inst/_030_ ),
    .Y(\debounce_inst/_001_ [12]));
 sky130_fd_sc_hd__a21oi_1 \debounce_inst/_080_  (.A1(\debounce_inst/counter [13]),
    .A2(\debounce_inst/_029_ ),
    .B1(\debounce_inst/_010_ ),
    .Y(\debounce_inst/_031_ ));
 sky130_fd_sc_hd__o21a_1 \debounce_inst/_081_  (.A1(\debounce_inst/counter [13]),
    .A2(\debounce_inst/_029_ ),
    .B1(\debounce_inst/_031_ ),
    .X(\debounce_inst/_001_ [13]));
 sky130_fd_sc_hd__and3_1 \debounce_inst/_082_  (.A(\debounce_inst/counter [13]),
    .B(\debounce_inst/counter [14]),
    .C(\debounce_inst/_029_ ),
    .X(\debounce_inst/_032_ ));
 sky130_fd_sc_hd__a21oi_1 \debounce_inst/_083_  (.A1(\debounce_inst/counter [13]),
    .A2(\debounce_inst/_029_ ),
    .B1(\debounce_inst/counter [14]),
    .Y(\debounce_inst/_033_ ));
 sky130_fd_sc_hd__nor3_1 \debounce_inst/_084_  (.A(\debounce_inst/_010_ ),
    .B(\debounce_inst/_032_ ),
    .C(\debounce_inst/_033_ ),
    .Y(\debounce_inst/_001_ [14]));
 sky130_fd_sc_hd__a41oi_1 \debounce_inst/_085_  (.A1(\debounce_inst/counter [13]),
    .A2(\debounce_inst/counter [14]),
    .A3(\debounce_inst/counter [15]),
    .A4(\debounce_inst/_029_ ),
    .B1(\debounce_inst/_010_ ),
    .Y(\debounce_inst/_034_ ));
 sky130_fd_sc_hd__o21a_1 \debounce_inst/_086_  (.A1(\debounce_inst/counter [15]),
    .A2(\debounce_inst/_032_ ),
    .B1(\debounce_inst/_034_ ),
    .X(\debounce_inst/_001_ [15]));
 sky130_fd_sc_hd__a41oi_1 \debounce_inst/_087_  (.A1(\debounce_inst/counter [13]),
    .A2(\debounce_inst/counter [14]),
    .A3(\debounce_inst/counter [15]),
    .A4(\debounce_inst/_029_ ),
    .B1(\debounce_inst/counter [16]),
    .Y(\debounce_inst/_035_ ));
 sky130_fd_sc_hd__a211oi_1 \debounce_inst/_088_  (.A1(\debounce_inst/_006_ ),
    .A2(\debounce_inst/_032_ ),
    .B1(\debounce_inst/_035_ ),
    .C1(\debounce_inst/_010_ ),
    .Y(\debounce_inst/_001_ [16]));
 sky130_fd_sc_hd__a41oi_1 \debounce_inst/_089_  (.A1(\debounce_inst/counter [13]),
    .A2(\debounce_inst/counter [14]),
    .A3(\debounce_inst/_006_ ),
    .A4(\debounce_inst/_029_ ),
    .B1(\debounce_inst/counter [17]),
    .Y(\debounce_inst/_036_ ));
 sky130_fd_sc_hd__a211oi_1 \debounce_inst/_090_  (.A1(\debounce_inst/_007_ ),
    .A2(\debounce_inst/_032_ ),
    .B1(\debounce_inst/_036_ ),
    .C1(\debounce_inst/_010_ ),
    .Y(\debounce_inst/_001_ [17]));
 sky130_fd_sc_hd__a41oi_1 \debounce_inst/_091_  (.A1(\debounce_inst/counter [13]),
    .A2(\debounce_inst/counter [14]),
    .A3(\debounce_inst/_007_ ),
    .A4(\debounce_inst/_029_ ),
    .B1(\debounce_inst/counter [18]),
    .Y(\debounce_inst/_037_ ));
 sky130_fd_sc_hd__nor2_1 \debounce_inst/_092_  (.A(\debounce_inst/_010_ ),
    .B(\debounce_inst/_037_ ),
    .Y(\debounce_inst/_001_ [18]));
 sky130_fd_sc_hd__mux2_1 \debounce_inst/_093_  (.A0(\debounce_inst/btn_sync ),
    .A1(\debounce_inst/btn_stable ),
    .S(\debounce_inst/_008_ ),
    .X(\debounce_inst/_002_ ));
 sky130_fd_sc_hd__dfrtp_1 \debounce_inst/_094_  (.CLK(clknet_2_2__leaf_clk),
    .D(\debounce_inst/_000_ ),
    .RESET_B(rst_n),
    .Q(btn_pressed));
 sky130_fd_sc_hd__dfrtp_1 \debounce_inst/_095_  (.CLK(clknet_2_1__leaf_clk),
    .D(\debounce_inst/_001_ [0]),
    .RESET_B(rst_n),
    .Q(\debounce_inst/counter [0]));
 sky130_fd_sc_hd__dfrtp_1 \debounce_inst/_096_  (.CLK(clknet_2_1__leaf_clk),
    .D(\debounce_inst/_001_ [1]),
    .RESET_B(rst_n),
    .Q(\debounce_inst/counter [1]));
 sky130_fd_sc_hd__dfrtp_1 \debounce_inst/_097_  (.CLK(clknet_2_1__leaf_clk),
    .D(\debounce_inst/_001_ [2]),
    .RESET_B(rst_n),
    .Q(\debounce_inst/counter [2]));
 sky130_fd_sc_hd__dfrtp_1 \debounce_inst/_098_  (.CLK(clknet_2_1__leaf_clk),
    .D(\debounce_inst/_001_ [3]),
    .RESET_B(rst_n),
    .Q(\debounce_inst/counter [3]));
 sky130_fd_sc_hd__dfrtp_1 \debounce_inst/_099_  (.CLK(clknet_2_1__leaf_clk),
    .D(\debounce_inst/_001_ [4]),
    .RESET_B(rst_n),
    .Q(\debounce_inst/counter [4]));
 sky130_fd_sc_hd__dfrtp_1 \debounce_inst/_100_  (.CLK(clknet_2_1__leaf_clk),
    .D(\debounce_inst/_001_ [5]),
    .RESET_B(rst_n),
    .Q(\debounce_inst/counter [5]));
 sky130_fd_sc_hd__dfrtp_1 \debounce_inst/_101_  (.CLK(clknet_2_3__leaf_clk),
    .D(\debounce_inst/_001_ [6]),
    .RESET_B(rst_n),
    .Q(\debounce_inst/counter [6]));
 sky130_fd_sc_hd__dfrtp_1 \debounce_inst/_102_  (.CLK(clknet_2_3__leaf_clk),
    .D(\debounce_inst/_001_ [7]),
    .RESET_B(rst_n),
    .Q(\debounce_inst/counter [7]));
 sky130_fd_sc_hd__dfrtp_1 \debounce_inst/_103_  (.CLK(clknet_2_3__leaf_clk),
    .D(\debounce_inst/_001_ [8]),
    .RESET_B(rst_n),
    .Q(\debounce_inst/counter [8]));
 sky130_fd_sc_hd__dfrtp_1 \debounce_inst/_104_  (.CLK(clknet_2_3__leaf_clk),
    .D(\debounce_inst/_001_ [9]),
    .RESET_B(rst_n),
    .Q(\debounce_inst/counter [9]));
 sky130_fd_sc_hd__dfrtp_1 \debounce_inst/_105_  (.CLK(clknet_2_3__leaf_clk),
    .D(\debounce_inst/_001_ [10]),
    .RESET_B(rst_n),
    .Q(\debounce_inst/counter [10]));
 sky130_fd_sc_hd__dfrtp_1 \debounce_inst/_106_  (.CLK(clknet_2_3__leaf_clk),
    .D(\debounce_inst/_001_ [11]),
    .RESET_B(rst_n),
    .Q(\debounce_inst/counter [11]));
 sky130_fd_sc_hd__dfrtp_1 \debounce_inst/_107_  (.CLK(clknet_2_3__leaf_clk),
    .D(\debounce_inst/_001_ [12]),
    .RESET_B(rst_n),
    .Q(\debounce_inst/counter [12]));
 sky130_fd_sc_hd__dfrtp_1 \debounce_inst/_108_  (.CLK(clknet_2_3__leaf_clk),
    .D(\debounce_inst/_001_ [13]),
    .RESET_B(rst_n),
    .Q(\debounce_inst/counter [13]));
 sky130_fd_sc_hd__dfrtp_1 \debounce_inst/_109_  (.CLK(clknet_2_2__leaf_clk),
    .D(\debounce_inst/_001_ [14]),
    .RESET_B(rst_n),
    .Q(\debounce_inst/counter [14]));
 sky130_fd_sc_hd__dfrtp_1 \debounce_inst/_110_  (.CLK(clknet_2_2__leaf_clk),
    .D(\debounce_inst/_001_ [15]),
    .RESET_B(rst_n),
    .Q(\debounce_inst/counter [15]));
 sky130_fd_sc_hd__dfrtp_1 \debounce_inst/_111_  (.CLK(clknet_2_3__leaf_clk),
    .D(\debounce_inst/_001_ [16]),
    .RESET_B(rst_n),
    .Q(\debounce_inst/counter [16]));
 sky130_fd_sc_hd__dfrtp_1 \debounce_inst/_112_  (.CLK(clknet_2_3__leaf_clk),
    .D(\debounce_inst/_001_ [17]),
    .RESET_B(rst_n),
    .Q(\debounce_inst/counter [17]));
 sky130_fd_sc_hd__dfrtp_1 \debounce_inst/_113_  (.CLK(clknet_2_2__leaf_clk),
    .D(\debounce_inst/_001_ [18]),
    .RESET_B(rst_n),
    .Q(\debounce_inst/counter [18]));
 sky130_fd_sc_hd__dfrtp_1 \debounce_inst/_114_  (.CLK(clknet_2_2__leaf_clk),
    .D(btn),
    .RESET_B(rst_n),
    .Q(\debounce_inst/btn_sync ));
 sky130_fd_sc_hd__dfrtp_1 \debounce_inst/_115_  (.CLK(clknet_2_2__leaf_clk),
    .D(\debounce_inst/btn_stable ),
    .RESET_B(rst_n),
    .Q(\debounce_inst/btn_prev ));
 sky130_fd_sc_hd__dfrtp_1 \debounce_inst/_116_  (.CLK(clknet_2_2__leaf_clk),
    .D(\debounce_inst/_002_ ),
    .RESET_B(rst_n),
    .Q(\debounce_inst/btn_stable ));
 sky130_fd_sc_hd__mux2_1 \pw_register/_04_  (.A0(entered_pw[0]),
    .A1(pw_switch[0]),
    .S(btn_pressed),
    .X(\pw_register/_00_ ));
 sky130_fd_sc_hd__mux2_1 \pw_register/_05_  (.A0(entered_pw[1]),
    .A1(pw_switch[1]),
    .S(btn_pressed),
    .X(\pw_register/_01_ ));
 sky130_fd_sc_hd__mux2_1 \pw_register/_06_  (.A0(entered_pw[2]),
    .A1(pw_switch[2]),
    .S(btn_pressed),
    .X(\pw_register/_02_ ));
 sky130_fd_sc_hd__mux2_1 \pw_register/_07_  (.A0(entered_pw[3]),
    .A1(pw_switch[3]),
    .S(btn_pressed),
    .X(\pw_register/_03_ ));
 sky130_fd_sc_hd__dfrtp_1 \pw_register/_08_  (.CLK(clknet_2_2__leaf_clk),
    .D(\pw_register/_00_ ),
    .RESET_B(rst_n),
    .Q(entered_pw[0]));
 sky130_fd_sc_hd__dfrtp_1 \pw_register/_09_  (.CLK(clknet_2_2__leaf_clk),
    .D(\pw_register/_01_ ),
    .RESET_B(rst_n),
    .Q(entered_pw[1]));
 sky130_fd_sc_hd__dfrtp_1 \pw_register/_10_  (.CLK(clknet_2_2__leaf_clk),
    .D(\pw_register/_02_ ),
    .RESET_B(rst_n),
    .Q(entered_pw[2]));
 sky130_fd_sc_hd__dfrtp_1 \pw_register/_11_  (.CLK(clknet_2_2__leaf_clk),
    .D(\pw_register/_03_ ),
    .RESET_B(rst_n),
    .Q(entered_pw[3]));
 assign state_out[0] = state[0];
 assign state_out[1] = state[1];
 assign state_out[2] = state[2];
endmodule
