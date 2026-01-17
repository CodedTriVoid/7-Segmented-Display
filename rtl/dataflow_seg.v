`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/29/2023 04:48:58 PM
// Design Name: 
// Module Name: dataflow_seg
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


module dataflow_seg(
    input [2:0]v,
    output reg [2:0]v_out
    );
    
        always @ (v)
    begin
        case (v)
            3'b010: v_out = 3'b000; 
            3'b011: v_out = 3'b001;
            3'b100: v_out = 3'b010;
            3'b101: v_out = 3'b011;
            3'b110: v_out = 3'b100;
            3'b111: v_out = 3'b101;
        endcase
    end
endmodule
