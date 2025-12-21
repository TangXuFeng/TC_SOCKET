//双加载内存
module dual_load_memory #(
    parameter MMIO_BASE_MEMORY = 32'h80000000 //基地址
    ,parameter MMIO_MASK_MEMORY = 32'hFFFFFF00 //掩码
)(
    input               clk
    ,input              rst_n

    ,input              rw       // 0=读, 1=写
    ,input      [31:0]  address
    ,input      [31:0]  pc
    ,input      [31:0]  write_data

    ,output     [31:0]  read_data // 异步读
    ,output     [31:0]  instruction
    ,output             selected //选中信号
);
    //定义内存大小
    localparam MEM_SIZE = (~MMIO_MASK_MEMORY)>>2 +1;
    reg [31:0] mem [0:MEM_SIZE];
    wire selected_instruction= (address & MMIO_MASK_MEMORY)==MMIO_BASE_MEMORY;
    assign selected = (address & MMIO_MASK_MEMORY)==MMIO_BASE_MEMORY;

    assign instruction=(selected_instruction && pc[1:0]==0 ) ? mem[address[31:2]] : 32'b0;

    //读取,并且低位地址必须等于0
    assign read_data = (selected && rw == 1'b0 && address[1:0]==0 ) ? mem[address[31:2]] : 32'b0;
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            //假装重置了
            mem[0]=32'b0;
        end else if (selected &&rw == 1'b1 && address[1:0] == 2'b00) begin
            mem[address[31:2]] <= write_data;
        end
    end

endmodule
