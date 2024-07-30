module main(
	input clk,
	input reset,
	input conta,
	input pausa,
	input para,
	
	output [0:6] centenas,
	output [0:6] decimos,
	output [0:6] dezenas,
	output [0:6] unidades,
	
	output reset_led,
	output conta_led,
	output pausa_led,
	output para_led
);

wire contando_fio;
wire enable_fio;
wire limite_fio;
wire	[2:0] estado_fio;
wire	[3:0] decimos_fio;
wire	[9:0] segundos_fio;


contador contador(
	.clk(clk),
	.reset(reset),
	.contando(contando_fio),
	.limite(limite_fio),
	.cont_dec(decimos_fio),
	.cont_seg(segundos_fio)
);

	defparam	contador.segundo = 50;

estados estados(
	.clk(clk),
	.reset(reset),
	.conta(conta),
	.pausa(pausa),
	.para(para),
	.limite(limite_fio),
	.contando(contando_fio),
	.enable(enable_fio),
	.estado(estado_fio)
);

	defparam	estados.contar = 1;
	defparam	estados.inicio = 0;
	defparam	estados.parar = 3;
	defparam	estados.pausar = 2;

sete_segmentos(
	.dec(decimos_fio),
	.seg(segundos_fio),
	.enable(enable_fio),
	.estado_atual(estado_fio),
	.centenas(centenas),
	.decimos(decimos),
	.dezenas(dezenas),
	.unidades(unidades),
	.reset(reset_led),
	.conta(conta_led),
	.pausa(pausa_led),
	.para(para_led)
);


endmodule
