//Gabriel Paes Barreto Bandeira
//Projeto 2VA - Arquitetura e Organização de Computadores
//2025.2
module PC(
    input wire clk,
    input wire reset,
    input wire [31:0] nextPC, // proxima endereco/instrucao
    output reg [31:0] PC 
);
// logica do clk com reset para que seja reiniciado ou avance para nextPC
    always @(posedge clk or posedge reset) begin
        if (reset) begin // zera o pc em caso de reset
            PC <= 32'b0;
        end else begin // avanca para proximo endereco
            PC <= nextPC;
        end
    end

endmodule