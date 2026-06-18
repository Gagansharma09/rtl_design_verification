// HDLBits: 12-hour clock (hh:mm:ss) with AM/PM
// https://hdlbits.01xz.net/wiki/count_clock
module count_clock(
    input  logic        clk, reset,
    output logic [7:0]  hh, mm, ss,
    output logic        pm
);
    // Seconds
    always_ff @(posedge clk) begin
        if (reset) begin
            ss <= 8'h00; mm <= 8'h00; hh <= 8'h12; pm <= 0;
        end else begin
            // Seconds
            if (ss[3:0] == 9)      begin ss[3:0] <= 0; ss[7:4] <= ss[7:4]+1; end
            else                         ss[3:0] <= ss[3:0]+1;
            if (ss == 8'h59) begin
                ss <= 8'h00;
                // Minutes
                if (mm[3:0] == 9)  begin mm[3:0] <= 0; mm[7:4] <= mm[7:4]+1; end
                else                      mm[3:0] <= mm[3:0]+1;
                if (mm == 8'h59) begin
                    mm <= 8'h00;
                    // Hours
                    if (hh == 8'h12) begin hh <= 8'h01; pm <= ~pm; end
                    else if (hh[3:0]==9) begin hh[3:0]<=0; hh[7:4]<=hh[7:4]+1; end
                    else hh[3:0]<=hh[3:0]+1;
                end
            end
        end
    end
endmodule
