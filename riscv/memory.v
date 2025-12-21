module memory #(
    parameter SIZE = 20  // 2^20 bytes = 1MB
)(
    input              clk,
    input              rst_n,

    input              enable,   // 选中线
    input              rw,       // 0=读, 1=写
    input      [31:0]  address,
    input      [31:0]  write_data,

    output reg         wait_sig, // 等待线
    output     [31:0]  read_data, // 异步读
    output reg         instruction_address_misaligned
);

    // ---------------------------------------------------------
    // 内存阵列：32bit 宽度
    // 总字节数 = 2^SIZE
    // 总 word 数 = 2^(SIZE-2)
    // ---------------------------------------------------------
    localparam WORDS = (1 << (SIZE - 2));

    reg [31:0] mem [0:WORDS-1];
    reg [4:0] wait_reg;

    // ---------------------------------------------------------
    // 地址按字节寻址，需要除以 4 得到 word index
    // ---------------------------------------------------------
    wire [31:0] word_index = address[31:2];

    // ---------------------------------------------------------
    //  异步读：组合逻辑直接输出
    // ---------------------------------------------------------
    assign read_data = (enable && rw == 1'b0) ? mem[word_index] : 32'b0;

    // ---------------------------------------------------------
    //  同步写 + 异常检测 + wait_sig 模拟延迟
    // ---------------------------------------------------------
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            instruction_address_misaligned <= 1'b0;
            wait_sig <= 1'b0;
            wait_reg <= 5'b0;
        end else begin

            // 默认无异常
            instruction_address_misaligned <= 1'b0;

            if (enable) begin

                // -------------------------------
                // 地址未对齐异常
                // -------------------------------
                if (address[1:0] != 2'b00) begin
                    instruction_address_misaligned <= 1'b1;
                end

                // -------------------------------
                // 模拟设备延迟：16 周期
                // -------------------------------
                if (wait_reg == 5'b0) begin
                    wait_sig <= 1'b1;
                    wait_reg <= wait_reg + 1'b1;
                end else if (wait_reg == 5'b10000) begin
                    wait_sig <= 1'b0;
                    wait_reg <= 5'b0;
                end else begin
                    wait_reg <= wait_reg + 1'b1;
                end

                // -------------------------------
                //  同步写
                // -------------------------------
                if (rw == 1'b1 && address[1:0] == 2'b00) begin
                    mem[word_index] <= write_data;
                end
            end else begin
                wait_sig <= 1'b0;
                wait_reg <= 5'b0;
            end
        end
    end

endmodule
