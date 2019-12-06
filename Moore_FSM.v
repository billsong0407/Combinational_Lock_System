module Moore_FSM(clock, enter, change, Compare, reset, enable, new, open, alarm);
    input enter, change, clock, Compare;
    input reset;
    output new, open, alarm;
    output reg enable;
    parameter [2:0] A = 3'b000, B = 3'b001, C = 3'b010, D = 3'b011, E = 3'b100;
    reg [2:0] current_state, Y;
 
    always @(enter, change)
        case (current_state)
            A:
                begin
                    enable = 0;
                    if (enter && ~Compare)
                        Y = B;
                    else if (change && ~Compare)
                        Y = B;
                    else if (change && Compare)
                        Y = E;
                    else if (enter && Compare)
                        Y = D;
                    else
                        Y = A;
                end
            B:
                if (enter && ~Compare)
                    Y = C;
                else if (change && ~Compare)
                    Y = C;
                else if (change && Compare)
                    Y = E;
                else if (enter && Compare)
                    Y = D;
                else
                    Y = B;
            C:
                if (enter || change)
                    Y = C;
                else
                    Y = C;
            D:
                if (enter || change)
                    Y = A;
                else
                    Y = D;
            E:
                begin
                    if (enter || change)
                        begin
                        Y = A;
                        enable = 1;
                        end
                    else
                        Y = E;
                end
            default: Y = 2'bxxx;
        endcase
   
    always @(negedge reset, posedge clock)
    begin
        if (reset == 0)
            current_state <= A;
        else
            current_state <= Y;
    end
   
    assign new = (current_state == E);
    assign open = (current_state == D);
    assign alarm = (current_state == C);
endmodule