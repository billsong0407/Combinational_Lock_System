module dflipflop (D, clock, Q, reset);
    input [3:0] D;
    input Enable, reset;
    output reg [3:0] Q = 4'b0110;
    always @(posedge clock, negedge reset)
    begin
        if (reset == 0)
            Q <= 4'b0110;
        if (clock == 1)
            Q <= D;
    end
endmodule