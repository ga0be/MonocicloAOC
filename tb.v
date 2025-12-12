
`timescale 1ns/1ps

module tb;

//Entradas e saídas
  reg clock;
  reg reset;
  wire [31:0] ULA_out;
  wire [31:0] PC_out;
  
  mips_top uut (
    .clock(clock),
    .reset(reset),
    .ULA_out(ULA_out),
    .PC_out(PC_out)
  );
  
  // Clock
  initial begin
    clock = 0;
    forever #10 clock = ~clock;
  end
  
  // Teste
  initial begin
    // 1. Cria waveform
    $dumpfile("WaveformTest.vcd");
    $dumpvars(0, tb);
    
    // 2. Reset
    reset = 1;
    #25 reset = 0;
    
    // 3. Monitorando PC e ULA nos primeiros ciclos
    $display("\n------ MONITORANDO PRIMEIROS CICLOS -------");
    $display("Tempo |   PC   |   ULA");
    
    // Verificando primeiras instruções
    #40;  // Primeira instrução após reset
    $display("%4tns | %h | %h", $time, PC_out, ULA_out);
    
    #20; // Segunda instrução
    $display("%4tns | %h | %h", $time, PC_out, ULA_out);
    
    #20; // Terceira
    $display("%4tns | %h | %h", $time, PC_out, ULA_out);
    
    #20; // Quarta
    $display("%4tns | %h | %h", $time, PC_out, ULA_out);
    
    // 4. Roda o resto
    #2000;
    
    $display("\n---- VALORES FINAIS!: ---");
    $display("PC final: %h", PC_out);
    $display("ULA final: %h (%d decimal)", ULA_out, ULA_out);
    
   
  end
endmodule
