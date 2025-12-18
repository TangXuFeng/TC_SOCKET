// 执行器模块接口定义
module executor
(
    // 输入信号
     input              clk
    ,input              rst_n
    ,input      [31:0]  next_pc
    ,input      [31:0]  jump_pc
    ,input      [31:0]  rd_data
    ,input      [31:0]  rs1_data
    ,input      [31:0]  rs2_data
    ,input      [31:0]  memory_address
    ,input              memory_read
    ,input              memory_write
    ,input      [31:0]  memory_write_data
    ,input      [31:0]  memory_read_data

    // 输出信号（示例，可根据设计需求调整）
    ,output reg [31:0]  pc_out          // 下一条指令的PC
    ,output             j
    ,output reg [31:0]  alu_result      // ALU计算结果
    ,output reg [31:0]  mem_addr_out    // 输出给内存的地址
    ,output reg [31:0]  mem_wdata_out   // 输出给内存的写数据
    ,output reg         mem_read_out    // 内存读使能
    ,output reg         mem_write_out   // 内存写使能
    ,output reg [31:0]  writeback_data  // 写回寄存器的数据
);





endmodule
