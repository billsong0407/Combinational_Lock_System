module system(input, reset, clock, enter, change, alarm, new, open, display);
    input clock, enter, reset, change;
    input [3:0] input;
    output [6:0] display;
    output alarm, new, open;
   
    wire compare_result, enable, enter_output, change_output, enter_reverse, change_reverse;
    wire [3:0] register_combo;
   
    assign enter_reverse = ~enter;
    assign change_reverse = ~change;
   
    inputConditioning input0(clock, enter_reverse, reset, enter_output);
    inputConditioning input1(clock, change_reverse, reset, change_output);
      
    d_flip_flop stage0(input, enable, register_combo, reset);
   
    comparator stage1(input, register_combo, compare_result);
   
    Moore_FSM stage2(clock, enter_output, change_output, compare_result, reset, enable, new, open, alarm);
   
    hex_segement_display stage3(alarm, new, open, display);
   
endmodule