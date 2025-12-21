module memory #(
 parameter SIZE = 20  // 2^20 bytes = 1MB
)(
 input              clk
 , input              rst_n

 , input              enable   // 选中线
 , input              rw       // 0=读, 1=写
 , input      [31:0]  address
 , input      [31:0]  write_data
 , output reg wait_sig //等待线,当读写正忙时产生
 , output reg [31:0]  read_data
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
 // 同步读写
 // ---------------------------------------------------------
 always @(posedge clk) begin
  if (!rst_n) begin
   read_data <= 32'b0;
   wait_reg<=5'b0;
  end else if (enable) begin
   //模拟设备正忙,当经过16周期后返回数据
   //延迟内存
   wait_sig=1'b1;
   if(wait_reg == 5'b0)begin
    wait_reg<=wait_reg+5'b1;
   end else if(wait_reg == 5'b10000) begin
    wait_reg <= 5'b0;
    wait_sig= 1'b0;
   end
   if (rw == 1'b1) begin
    // 写
    mem[word_index] <= write_data;
   end else begin
    // 读
    read_data <= mem[word_index];
   end
  end
 end

endmodule
