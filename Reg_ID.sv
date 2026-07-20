`timescale 1ns / 1ps
module Reg_ID#(parameter N=32)(
    input logic clk, reset,branch_ID, mem_rd_ID, mem2reg_ID, mem_write_ID, alu_scr_ID, reg_write_ID,
    input logic [N-1:0] pc_out_IF,  inst, data1_ID, data2_ID, immout_ID, 
    input logic [1:0] alu_op_ID,
    output logic [N-1:0] pc_out_ID,  Imm_ID ,data1, data2, immout, 
    output logic branch_EX, mem_rd_EX, mem2reg_EX, mem_write_EX, alu_scr, reg_write_EX,
    output logic [1:0] alu_op
    );

    always_ff@( posedge clk or posedge reset) begin
  if(reset) begin
    pc_out_ID<=0;   Imm_ID<=0; data1<=0;  data2<=0;  immout<=0;  branch_EX<=branch_ID;
    mem_rd_EX<=0;  mem2reg_EX<=0;  mem_write_EX<=0;  alu_scr<=0;  reg_write_EX<=0; alu_op<=0; 
  end
  else begin

    pc_out_ID<=pc_out_IF;   Imm_ID<=inst; data1<=data1_ID;  data2<=data2_ID;  immout<=immout_ID;  branch_EX<=branch_ID;
    mem_rd_EX<=mem_rd_ID;  mem2reg_EX<=mem2reg_ID;  mem_write_EX<=mem_write_ID;  alu_scr<=alu_scr_ID;  reg_write_EX<=reg_write_ID; alu_op<=alu_op_ID; 
  end
   end 
endmodule
