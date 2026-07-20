`timescale 1ns / 1ps
module Reg_IF#(parameter N=32)(input logic clk, reset,
    input logic [N-1:0] pc_out,  inst_IF,
    output logic [N-1:0] pc_out_IF,  inst
    );

    always_ff@( posedge clk or posedge reset) begin
  if(reset) begin
    pc_out_IF<=0;  inst<=0;
  end
  else begin
    pc_out_IF<=pc_out;  inst<=inst_IF;
  end
   end 
endmodule
