`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/11/2026 02:39:20 PM
// Design Name: 
// Module Name: tb_Module_Mux
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

`timescale 1ns/1ps

module tb_Module_mux;

  reg u, v, w, s0, s1;
  wire m, z;

  // DUT
  Module_mux dut (
    .u(u), .v(v), .w(w), //inputs
    .s0(s0), .s1(s1),   //selects
    .m(m), .z(z)        // outputs
  );

  // expected values
  reg exp_z, exp_m;

  task apply_and_check;
    input reg tu, tv, tw, ts0, ts1;
    begin
      u  = tu;  v  = tv;  w  = tw;
      s0 = ts0; s1 = ts1;
      #1; // allow signals to settle

      exp_z = (s0) ? v : u;
      exp_m = (s1) ? w : ((s0) ? v : u);

      if (z !== exp_z || m !== exp_m) begin
        $display("FAIL  t=%0t  u=%b v=%b w=%b s0=%b s1=%b | z=%b(exp %b) m=%b(exp %b)",
                 $time, u,v,w,s0,s1, z,exp_z, m,exp_m);
      end else begin
        $display("PASS  t=%0t  u=%b v=%b w=%b s0=%b s1=%b | z=%b m=%b",
                 $time, u,v,w,s0,s1, z,m);
      end
    end
  endtask

  initial begin
    // 5 test cases
    apply_and_check(0, 1, 0, 0, 0); // s0=0 -> z=u ; s1=0 -> m=z
    apply_and_check(0, 1, 0, 1, 0); // s0=1 -> z=v ; s1=0 -> m=z
    apply_and_check(0, 1, 0, 0, 1); // s1=1 -> m=w (override)
    apply_and_check(1, 0, 1, 1, 1); // s1=1 -> m=w ; z=v
    apply_and_check(1, 1, 0, 1, 0); // all ones except w -> z=v ; m=z

    $display("Done.");
    $finish;
  end

endmodule

