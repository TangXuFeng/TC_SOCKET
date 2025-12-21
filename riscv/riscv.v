module riscv (
    input  clk
    ,input  rst_n
    ,output done
);
    
    core core_inst (
        .instruction(instruction)
        ,.pc(pc)
        ,.clk(clk)
        ,.rst_n(rst_n)
    );

endmodule
