module clock_div
#(
    parameter DIVIDE_BY = 17,
    parameter DIVISOR=2'd3
)
(
    input clock,
    input reset,
    output reg div_clock
);

    reg [DIVIDE_BY-1:0] counter;

    always @(posedge reset, posedge clock) begin
        if (reset) begin
            counter <= 0;
            div_clock <=0;
        end else begin
             if (counter == (2**(DIVIDE_BY-1))) begin
                counter <=0;
                div_clock <= ~div_clock;
            end else begin
                counter <= counter +1; //increment one
            end
        end
    end

endmodule