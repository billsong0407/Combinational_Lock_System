module hex_segement_display (alarm, new, open, display_out);
 
    input new, open, alarm;
   output reg [6:0] display_out;
     
    always @(new, open, alarm)
        if (new)
            display_out = 7'b0101011;
        else if (open)
            display_out = 7'b1000000;
        else if (alarm)
            display_out = 7'b0001000;
        else
            display_out = 7'b0111111;
     
endmodule