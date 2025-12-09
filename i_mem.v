//Gabriel Paes Barreto Bandeira
//Projeto 2VA - Arquitetura e Organização de Computadores
//2025.2


module i_mem #(
    parameter MEM_SIZE = 256  // tamanho da memória 
)(
    input wire [31:0] address,    
    output wire [31:0] i_out      
);

    // Memória de instrução (ROM)
    reg [31:0] memoria [0:MEM_SIZE-1];

    // Carrega as instruções a partir do arquivo instructions.list
    initial begin
        $readmemb("RandomNumbers.list", memoria);
    end

    // Leitura assíncrona da memória (com divisão por 4 para alinhar por palavra)
    assign i_out = memoria[address >> 2];

endmodule