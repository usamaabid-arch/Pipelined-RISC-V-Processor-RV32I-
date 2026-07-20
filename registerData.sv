`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/18/2026 04:22:12 PM
// Design Name: 
// Module Name: registerData
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

module registerData#(parameter N=32, width=32)(
input logic [N-1:0] inst, 
input logic reg_write, reset, clk, 
input logic [N-1:0] data_w, Imm_reg_write,
output logic [N-1:0] data1_ID, data2_ID 
    );  
//    inst[19:15]=rs1;
//    inst[24:20]=rs2;
//    inst[19:15]=rs1;
    
    logic [N-1:0] mem [width-1: 0];
    // initilize to 0
  always_ff@( posedge clk or posedge reset) begin
  if(reset) for(int i=0; i<width; i++) begin
    mem[i]<=0;
  end
  else if(reg_write && Imm_reg_write[11:7] != 5'd0)
  mem[Imm_reg_write[11:7]] <= data_w;  // data_w on rsd
   end 
  // save data to sourse reg
  assign data1_ID=mem[inst[19:15]]; // data1 out which present on rs1
  assign data2_ID= mem[inst[24:20]];// data2 out which present on rs2

endmodule
