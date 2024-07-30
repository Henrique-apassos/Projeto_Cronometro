module sete_segmentos (
	input [9:0] seg,
	input [3:0] dec,
	input enable,
	input [2:0] estado_atual,
	
	output reg [0:6] centenas,
	output reg [0:6] dezenas,
	output reg [0:6] unidades,
	output reg [0:6] decimos,
	output reg reset,
	output reg conta,
	output reg pausa,
	output reg para
);

reg [3:0] num_cent;
reg [3:0] num_dez;
reg [3:0] num_uni;
reg [3:0] num_dec;

always @(*) begin
	if (enable) begin
		num_cent = (seg / 100) % 10;
		num_dez = (seg / 10) % 10;
		num_uni = seg % 10;
		num_dec = dec;
	end

	case (num_cent)
		0: centenas = 7'b0000001;
		1: centenas = 7'b1001111;
		2: centenas = 7'b0010010;
		3: centenas = 7'b0000110;
		4: centenas = 7'b1001100;
		5: centenas = 7'b0100100;
		6: centenas = 7'b0100000;
		7: centenas = 7'b0001111;
		8: centenas = 7'b0000000;
		9: centenas = 7'b0000100;
		default: centenas = 7'b1111111;
	endcase
	
	case (num_dez)
		0: dezenas = 7'b0000001;
		1: dezenas = 7'b1001111;
		2: dezenas = 7'b0010010;
		3: dezenas = 7'b0000110;
		4: dezenas = 7'b1001100;
		5: dezenas = 7'b0100100;
		6: dezenas = 7'b0100000;
		7: dezenas = 7'b0001111;
		8: dezenas = 7'b0000000;
		9: dezenas = 7'b0000100;
		default: dezenas = 7'b1111111;
	endcase
	
	case (num_uni)
		0: unidades = 7'b0000001;
		1: unidades = 7'b1001111;
		2: unidades = 7'b0010010;
		3: unidades = 7'b0000110;
		4: unidades = 7'b1001100;
		5: unidades = 7'b0100100;
		6: unidades = 7'b0100000;
		7: unidades = 7'b0001111;
		8: unidades = 7'b0000000;
		9: unidades = 7'b0000100;
		default: unidades = 7'b1111111;
	endcase

	case (num_dec)
		0: decimos = 7'b0000001;
		1: decimos = 7'b1001111;
		2: decimos = 7'b0010010;
		3: decimos = 7'b0000110;
		4: decimos = 7'b1001100;
		5: decimos = 7'b0100100;
		6: decimos = 7'b0100000;
		7: decimos = 7'b0001111;
		8: decimos = 7'b0000000;
		9: decimos = 7'b0000100;
		default: decimos = 7'b1111111;
	endcase
	
	case (estado_atual)
		0: begin
			reset = 1;
			conta = 0;
			pausa = 0;
			para = 0;
		end
		1: begin
			reset = 0;
			conta = 1;
			pausa = 0;
			para = 0;
		end
		2: begin
			reset = 0;
			conta = 0;
			pausa = 1;
			para = 0;
		end
		3: begin
			reset = 0;
			conta = 0;
			pausa = 0;
			para = 1;
		end
	endcase
end

endmodule
