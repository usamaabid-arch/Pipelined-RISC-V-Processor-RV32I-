`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/18/2026 04:25:08 PM
// Design Name: 
// Module Name: alu_control
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

module alu_control(
input logic [1:0] alu_op, 
input logic [31:0] Imm_ID, 
output logic [3:0] alu_ctrl 
); 
//// f3 = Imm_ID[14:12]   f7 = Imm_ID[30] 
logic       f7;
logic [2:0] f3;

assign f7 = Imm_ID[30];
assign f3 = Imm_ID[14:12];


//    always_comb begin
//        alu_ctrl = 4'b0010;   // default
//        if(alu_op==2'b00) alu_ctrl=4'b0010;   // Load/Store=== ADD
//        if (alu_op==2'b01) alu_ctrl=4'b0110;        // Branch
//        if  (alu_op==2'b10) begin
//            if ( f7==1) alu_ctrl=4'b0110;
//            else  begin
//                if(f3==3'b000) alu_ctrl=4'b0010;
//                if(f3==3'b111) alu_ctrl=4'b0000;
//                if(f3==3'b110) alu_ctrl=4'b0001;
//                end
//            end
//         if  (alu_op==2'b11) begin
//       case(f3) 
//             3'b000: alu_ctrl = 4'b0010;
//             3'b111: alu_ctrl = 4'b0000;
//             3'b110: alu_ctrl = 4'b0001;
//             3'b010: alu_ctrl = 4'b0111;
//             endcase
//         end
//        end
//    endmodule




always_comb begin
case(alu_op)
    2'b00: alu_ctrl = 4'b0010;      // ADD ld

    2'b01: alu_ctrl = 4'b0110;      // SUB

   2'b10: begin // R-Type
   case ({f7,f3})
     4'b0000: alu_ctrl = 4'b0010; // ADD
     4'b1000: alu_ctrl = 4'b0110; // SUB
     4'b0111: alu_ctrl = 4'b0000; // AND
     4'b0110: alu_ctrl = 4'b0001; // OR
     4'b0010: alu_ctrl = 4'b0111; // SLT
        default: alu_ctrl = 4'b0010;
        endcase
    end

   2'b11: begin // I-Type
        case(f3)
            3'b000: alu_ctrl = 4'b0010; // ADDI
            3'b001: alu_ctrl = 4'd15;   // SLLI 
            3'b111: alu_ctrl = 4'b0000; // ANDI
            3'b110: alu_ctrl = 4'b0001; // ORI
            3'b010: alu_ctrl = 4'b0111; // SLTI
            default: alu_ctrl = 4'b0010;
        endcase
    end
    default: alu_ctrl = 4'b0010;
    endcase
end

endmodule