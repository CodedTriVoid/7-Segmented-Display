`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/29/2023 04:20:53 PM
// Design Name: 
// Module Name: segment_display
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


module segment_display(
    input [3:0]v,
    output z,
 //   output wire [3:0]m,
    output [7:0]an,
    output [6:0]seg0
    );
    wire [2:0]w;
    wire [3:0]m;
    reg [3:0]a;
    
    comparator_dataflow d1(v,z); // Checks if v > 9 sets z as 0 or 1 if above 9
    dataflow_seg d2(v,w);
    mux_2to1 m1(v[0],w[0],z,m[0]);
    mux_2to1 m2(v[1],w[1],z,m[1]);
    mux_2to1 m3(v[2],w[2],z,m[2]);
    mux_2to1 m4(v[3],0,z,m[3]);

    bcdto7segment_dataflow d3 (m,an,seg0);

    
    // accounts for when v > 9, makes the decimal display 0 if 10 or x if 1x.
    always @(v) 
    begin
    if (v < 10) 
        begin
        a = v; 
        end
    else if (v >10)
        begin
            a =v - 4'd10;
        end
    end
endmodule
