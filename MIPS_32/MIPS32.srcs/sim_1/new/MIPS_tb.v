`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/10/2024 04:15:16 PM
// Design Name: 
// Module Name: MIPS_tb
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

module MIPS_tb();

reg clk1, clk2 ;
integer k ;

pipe_MIPS32 dut (clk1, clk2);

initial
    begin
        clk1 = 0 ; clk2 = 0 ;
        repeat(200)
            begin
            #5 clk1 = 1 ; #5 clk1 = 0 ;
            #5 clk2 = 1 ; #5 clk2 = 0 ;
            end
    end
initial
    begin
        for(k=0 ; k<32 ; k=k+1)
            pipe_MIPS32.Reg[k] = k ;
//***************program 1 **************//   (add 3 number)     
//        pipe_MIPS32.mem[0] = 32'h2801000A ;  // ADDI R1, R0, 10
//        pipe_MIPS32.mem[1] = 32'h28020014 ;  // ADDI R2, R0, 20
//        pipe_MIPS32.mem[2] = 32'h2803001E ;  // ADDI R3, R0, 30
//        pipe_MIPS32.mem[3] = 32'h0CE77800 ;  // OR R7, R7, R7    ----DUMMY INST.
//        pipe_MIPS32.mem[4] = 32'h0CE77800 ;  // OR R7, R7, R7    ----DUMMY INST.
//        pipe_MIPS32.mem[5] = 32'h00222000 ;  // ADDI R4, R1, R2 
//        pipe_MIPS32.mem[6] = 32'h0CE77800 ;  // OR R7, R7, R7    ----DUMMY INST.
//        pipe_MIPS32.mem[7] = 32'h00832800 ;  // ADDI R5, R4, R3
//        pipe_MIPS32.mem[8] = 32'hFC000000 ;  //HALT
 
//**************program 2 ***************//         
//        pipe_MIPS32.mem[120] = 55 ;

//        pipe_MIPS32.mem[0] = 32'h28010078 ;  // ADDI R1, R0, 120
//        pipe_MIPS32.mem[1] = 32'h0C631800 ;  // OR R3, R3, R3    ----DUMMY INST.
//        pipe_MIPS32.mem[2] = 32'h20220000 ;  // LW R2, 0(R1)
//        pipe_MIPS32.mem[3] = 32'h0C631800 ;  // OR R3, R3, R3    ----DUMMY INST.
//        pipe_MIPS32.mem[4] = 32'h2842002D ;  // ADDI R2, R2, 45
//        pipe_MIPS32.mem[5] = 32'h0C631800 ;  // OR R3, R3, R3    ----DUMMY INST. 
//        pipe_MIPS32.mem[6] = 32'h24220001 ;  // SW R2, 1(R1)
//        pipe_MIPS32.mem[7] = 32'hFC000000 ;  // HLT

//*************program 3 ****************//  (make factorial)
        pipe_MIPS32.mem[0] = 32'h280A00C8 ;  // ADDI R10, R0, 200
        pipe_MIPS32.mem[1] = 32'h28020001 ;  // ADDI R2, R0, 1
        pipe_MIPS32.mem[2] = 32'h0E94A000 ;  // OR R20, R20, R20    ----DUMMY INST.
        pipe_MIPS32.mem[3] = 32'h21430000 ;  // LW R3, 0(R10)
        pipe_MIPS32.mem[4] = 32'h0E94A000 ;  // OR R20, R20, R20    ----DUMMY INST.
        pipe_MIPS32.mem[5] = 32'h14431000 ;  // LOOP : MUL R2, R2, R3 
        pipe_MIPS32.mem[6] = 32'h2C630001 ;  // SUBI R3, R3, 1
        pipe_MIPS32.mem[7] = 32'h0E94A000 ;  // OR R20, R20, R20    ----DUMMY INST. 
        pipe_MIPS32.mem[8] = 32'h3460FFFC ;  // BNEQZ R3, LOOP (-3 OFFSET)
        pipe_MIPS32.mem[9] = 32'h2542FFFE ;  // SW R2, -2(R10)
        pipe_MIPS32.mem[10] = 32'hFC000000 ;  // HLT  
        
        pipe_MIPS32.mem[200] = 7 ;
        
        pipe_MIPS32.HALTED = 0 ;
        pipe_MIPS32.PC = 0;
        pipe_MIPS32.TAKEN_BRANCH = 0 ;
        
        #3000
        $display ("mem[200] = %4d, mem[198]: %4d ", pipe_MIPS32.mem[200], pipe_MIPS32.mem[198]);
        $finish ;
    end
    
initial
    begin
        $monitor("R2 = %4d", pipe_MIPS32.Reg[2]);
    end        
endmodule
