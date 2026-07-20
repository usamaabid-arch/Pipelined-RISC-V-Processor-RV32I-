`timescale 1ns / 1ps
module Reg_EX#(parameter N=32)(
    input logic clk, reset,branch_EX, mem_rd_EX, mem2reg_EX, mem_write_EX, reg_write_EX,
    input logic [N-1:0] A1,zero_EX, alu_out, data2,Imm_ID, 
    output logic [N-1:0] A1_EX, zero,  alu_out_EX, data2_EX, Imm_EX, 
    output logic branch, mem_rd, mem2reg_WB, mem_write, reg_write_WB
    );

    always_ff@( posedge clk or posedge reset) begin
  if(reset) begin
    A1_EX<=0;  zero<=0;   alu_out_EX<=0;  data2_EX<=0;  Imm_EX<=0;  
     branch<=0;  mem_rd<=0;  mem2reg_WB<=0;  mem_write<=0;  reg_write_WB<=0; 
  end
  else begin

    A1_EX<=A1;  zero<=zero_EX;   alu_out_EX<=alu_out;  data2_EX<=data2;  Imm_EX<=Imm_ID;  
     branch<=branch_EX;  mem_rd<=mem_rd_EX;  mem2reg_WB<=mem2reg_EX;  mem_write<=mem_write_EX;  reg_write_WB<=reg_write_EX;
  end
   end 
endmodule
