module riscv (
    input  clk
    ,input  rst_n
    ,output done
);

// Core <-> dual_load_memory (I-port)
wire [31:0] pc;
wire [31:0] instruction;

// Core <-> memory / dual_load_memory (D-port)
wire [31:0] d_addr;
wire [31:0] d_wdata;
wire [31:0] d_rdata;
wire        d_ren;
wire        d_wen;

// dual_load_memory outputs
wire [31:0] dlm_rdata;
wire        dlm_selected;

// memory outputs
wire [31:0] mem_rdata;
wire        mem_selected;


    
core #(
    .RST_PC_ADDRESS(32'h0000_0000)
) u_core (
    .clk            (clk),
    .rst_n          (rst_n),

    .instruction    (instruction),   // 来自 dual_load_memory
    .read_data      (d_rdata),       // 来自 memory 或 dual_load_memory

    .pc             (pc),
    .address        (d_addr),
    .write_data     (d_wdata),
    .read_data_sig  (d_ren),
    .write_data_sig (d_wen)
);
dual_load_memory #(
    .MMIO_BASE_MEMORY(32'h8000_0000),
    .MMIO_MASK_MEMORY(32'hFFFF_FF00) //掩码长度和内存大小有关,2^8=256byte
) u_dual_load_memory (
    .clk        (clk),
    .rst_n      (rst_n),

    .rw         (d_wen),        // CPU 写信号
    .address    (d_addr),       // CPU 数据地址
    .pc         (pc),           // CPU 取指地址
    .write_data (d_wdata),      // CPU 写数据

    .read_data  (dlm_rdata),    // 数据读出
    .instruction(instruction),  // 指令读出
    .selected   (dlm_selected)  // 地址命中
);
memory #(
    .MMIO_BASE_MEMORY(32'h9000_0000),
    .MMIO_MASK_MEMORY(32'hFFFF_FF00) //大内存综合器做不出来
) u_memory (
    .clk        (clk),
    .rst_n      (rst_n),

    .rw         (d_wen),
    .address    (d_addr),
    .write_data (d_wdata),

    .read_data  (mem_rdata),
    .selected   (mem_selected)
);

endmodule
