module estados(
    input clk,
    input reset,
    input conta,  
    input pausa, 
    input para,
	 input limite,
    
    output reg [2:0] estado,
    output reg contando,
    output reg enable
);

parameter inicio = 0, contar = 1, pausar = 2, parar = 3;

reg [2:0] estado_atual = inicio;
reg [2:0] estado_anterior = inicio;

// armazena o estado anterior dos botões
reg conta_reg, pausa_reg, para_reg; 

// detecta que o botão foi solto
wire conta_ativo = !conta_reg && conta;
wire pausa_ativo = !pausa_reg && pausa;
wire para_ativo = !para_reg && para;

always @(posedge clk or negedge reset) begin
    if (!reset) begin 
        estado_atual <= inicio;
        contando <= 0;
        enable <= 1;
        conta_reg <= 1; 
        pausa_reg <= 1; 
        para_reg <= 1;  
    end 
	 else if (limite) begin // se chegou a 999.9
		  estado_atual <= inicio;
        contando <= 0;
        enable <= 1;
        conta_reg <= 1; 
        pausa_reg <= 1; 
        para_reg <= 1;  
	 end
	 else begin
        // atualiza o estado anterior dos botões
        conta_reg <= conta;
        pausa_reg <= pausa;
        para_reg <= para;

        // transição de estados
        case (estado_atual)
            inicio: begin
                if (conta_ativo) begin 
                    estado_atual <= contar;
                    contando <= 1;
                    enable <= 1;
                end
            end
            contar: begin
                if (!reset) begin
                    estado_atual <= inicio;
                    contando <= 0;
                    enable <= 1;
                end else if (pausa_ativo) begin
                    estado_atual <= pausar;
                    contando <= 1;
                    enable <= 0;
                end else if (para_ativo) begin 
                    estado_atual <= parar;
                    contando <= 0;
                    enable <= 1;
                end
            end
            pausar: begin
                if (!reset) begin
                    estado_atual <= inicio;
                    contando <= 0;
                    enable <= 1;
                end else if (conta_ativo) begin 
                    estado_atual <= contar;
                    contando <= 1;
                    enable <= 1;
                end else if (para_ativo) begin 
                    estado_atual <= parar;
                    contando <= 0;
                    enable <= 1;
                end
            end
            parar: begin
                if (!reset) begin
                    estado_atual <= inicio;
                    contando <= 0;
                    enable <= 1;
                end else if (conta_ativo) begin 
                    estado_atual <= contar;
                    contando <= 1;
                    enable <= 1;
                end
            end
        endcase
    end
end

always @(posedge clk or negedge reset) begin
    if (!reset) begin
        estado <= inicio;
    end else begin
        estado <= estado_atual;
    end
end

endmodule
