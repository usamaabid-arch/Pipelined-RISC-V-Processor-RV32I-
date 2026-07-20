`timescale 1ns / 1ps
module Reg_WB#(parameter N=32)(
    input logic clk, reset,mem2reg_WB,reg_write_WB,
    input logic [N-1:0] dmem_out_WB, alu_out_EX,Imm_EX, 
    output logic [N-1:0] dmem_out, alu_out_WB,Imm_reg_write,   
    output logic mem2reg,reg_write
    );

    always_ff@( posedge clk or posedge reset) begin
  if(reset) begin
    dmem_out<=0;  alu_out_WB<=0; Imm_reg_write<=0;    
    mem2reg<=0;  reg_write<=0; 
  end
  else begin

    dmem_out<=dmem_out_WB;  alu_out_WB<=alu_out_EX; Imm_reg_write<=Imm_EX;    
    mem2reg<=mem2reg_WB;  reg_write<=reg_write_WB; 
  end
   end 
endmodule
