
`timescale 1ns/1ps

module tb;

  // Entradas
  reg clock;
  reg reset;

  // Saídas

  wire [31:0] ULA_out;
  wire [31:0] d_mem_out;
  wire [31:0] PC_out;

  // Instanciando o módulo top-level
  mips_top uut (
    .clock(clock),
    .reset(reset),
    .ULA_out(ALU_out),
    .d_mem_out(d_mem_out),
    .PC_out(PC_out)
  );

  // Geração de clock
  initial begin
    clock = 0;
    forever #10 clock = ~clock; // Clock com período de 20ns
  end

  // Teste inicial
  initial begin
    // Inicializa os sinais
    reset = 1;
    #25;
    reset = 0;

    // Simulação roda por 5000ns
    #5000;

    // Encerra simulação
    $stop;
	 end

endmodule
