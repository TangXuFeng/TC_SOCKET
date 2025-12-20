module dual_port_mem (
    input              clk,
    input              rst_n,

    // -------- Port 1: read + write --------
    input              write_1,
    input              read_1,
    input      [31:0]  address_1,
    input      [31:0]  write_data_1,
    output reg [31:0]  read_data_1,

    // -------- Port 2: read only --------
    input              read_2,
    input      [31:0]  address_2,
    output reg [31:0]  read_data_2
);

    // 内存大小：你可以改成你需要的深度
    localparam MEM_DEPTH = 1024;  // 1024 words = 4KB

    // 32-bit 宽度的 RAM
    reg [31:0] mem [0:MEM_DEPTH-1];

    // 将字节地址转换为 word 地址
    wire [31:2] addr1_word = address_1[31:2];
    wire [31:2] addr2_word = address_2[31:2];

    // -----------------------------
    // Port 1: 同步写、异步读
    // -----------------------------
    always @(posedge clk) begin
        if (!rst_n) begin
            read_data_1 <= 32'b0;
        end else begin
            // 写操作（同步）
            if (write_1) begin
                mem[addr1_word] <= write_data_1;
            end

            // 读操作（异步读寄存输出）
            if (read_1) begin
                read_data_1 <= mem[addr1_word];
            end
        end
    end

    // -----------------------------
    // Port 2: 只读端口
    // -----------------------------
    always @(posedge clk) begin
        if (!rst_n) begin
            read_data_2 <= 32'b0;
        end else begin
            if (read_2) begin
                read_data_2 <= mem[addr2_word];
            end
        end
    end

endmodule

