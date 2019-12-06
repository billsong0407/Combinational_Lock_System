module comparator (a, b, Result);
    input [3:0] a;
    input [3:0] b;
 
    output reg Result;
 
    wire [3:0] c;
   
   assign c = a ^ b;
 
   always @(c)
        begin
            if (c == 4'b0000)
                    Result <= 1;
            else
                    Result <= 0;
        end
endmodule