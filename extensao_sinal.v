//Gabriel Paes Barreto Bandeira
//Projeto 2VA - Arquitetura e Organização de Computadores
//2025.2

module extensao_sinal(input wire[15:0] instruction, output wire[31:0] out); // entrada de 16 bits e saida de 32 bits
	// repete 16 vezes o bit ins[15] (mais significativo) e faz concatenacao com a instrucao total
	assign out = {{16{instruction[15]}}, instruction};
	

endmodule
