`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/18/2026 04:35:30 PM
// Design Name: 
// Module Name: data_memory
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////



module data_memory #(parameter width=32, depth= 1024)
( 
input  [width-1:0] alu_out_EX, data2_EX, 
input   mem_write, mem_rd, clk, reset, 
output reg [width-1:0] dmem_out_WB 
);
// Data memory   
logic [width-1:0] mem [depth-1:0];

initial begin
    for(int i=0; i<depth; i++) 
    mem[i]=0;
end
// alu_out_EX==addr,  data2_EX==data need to write  
    always_ff@(negedge  clk) begin
   // if(reset) dmem_out_WB<=0;
    if(mem_write)  mem[alu_out_EX]<=data2_EX;
    end
    
always_comb begin
        if(reset) dmem_out_WB = 0;
        else if(mem_rd) dmem_out_WB = mem[alu_out_EX];
        else dmem_out_WB = 0;
    end


endmodule
