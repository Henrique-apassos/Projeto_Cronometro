module contador (
    input clk,
	 input reset,
	 input contando,
	
	 output reg limite, // quando chegar a 999.9
    output reg [9:0] cont_seg, // contador para os segundos
    output reg [3:0] cont_dec // contador para os decimos de segundo
);

//
reg [31:0] cont_clk = 0; // contador para os ciclos do clock

parameter segundo = 50000000; // ciclos de clock por segundo
parameter decimo = segundo / 10;

initial begin 
    cont_seg = 10'd0;
    cont_dec = 4'd0;
	 limite = 1'b0;
end

always @(posedge clk or negedge reset) begin
    if (!reset) begin
        cont_clk <= 32'd0;
        cont_seg <= 10'd0;
        cont_dec <= 4'd0;
    end else begin 
        if (contando) begin
				limite = 0;
            cont_clk <= cont_clk + 1;
            if (cont_clk == decimo) begin
                cont_clk <= 1;
                if (cont_dec < 4'd9) begin // verifique se passaram 10 decimos de segundo
                    cont_dec <= cont_dec + 1; // se for falso, acrescente 1 ao contador dos decimos de segundo
                end else begin 
                    cont_dec <= 4'd0; // se for verdade, coloque zero no contador dos decimos de segundo
                    if (cont_seg < 10'd999) begin // verifique se passaram 999 segundos
                        cont_seg <= cont_seg + 1; // se for falso, acrescente 1 ao contador dos segundos
                    end else begin
                        cont_seg <= 10'd0; // se for verdade, reinicie a contagem
								limite = 1;
						  end
                end
            end
        end
    end
end

endmodule