// 当不希望写入时, rd_address 应该等于 0
module regfile (
    input          clk
    ,input          rst_n
    ,input  [4:0]   rd_address
    ,input  [4:0]   rs1_address
    ,input  [4:0]   rs2_address
    ,input  [31:0]  rd_data
    ,output [31:0]  rs1_data
    ,output [31:0]  rs2_data
);

    reg [31:0] regfile [31:0];
    integer i;

    // 异步低电平复位
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            for (i = 0; i < 32; i = i + 1) begin
                regfile[i] <= 32'b0;
            end
        end else begin
            if (rd_address != 5'b0) begin
                regfile[rd_address] <= rd_data;
            end
        end
    end

    // 读操作
    assign rs1_data = (rs1_address == 5'b0) ? 32'b0 : regfile[rs1_address];
    assign rs2_data = (rs2_address == 5'b0) ? 32'b0 : regfile[rs2_address];

endmodule
