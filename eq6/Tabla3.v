//Carlos Cuellar Klingenberger #19275 UVG
//Archivo correspondiente a la POS de la tabla 3

//Creo el módulo
module Tabla3 ();

//Creo Var de entrada y las salidas de diversas compuertas
reg A; 
reg B;
reg C;
reg D;
wire out0;
wire out1;
wire out2;
wire out3;
wire out4;
wire out5;
wire out6;
wire out7;
wire out8;
wire out9;
wire out10;
wire out11;
wire out12;
wire Y;

not op0(out0, A);
not op1(out1, B);
not op2(out2, C);
not op3(out3, D);

or op4(out4, A, out1, C, D);
or op5(out5, A, out1, C, out3);
or op6(out6, A, out1, out2, D);
or op7(out7, A, out1, out2, out3);
or op8(out8, out0, B, C, out3);
or op9(out9, out0, B, out2, out3);
or op10(out10, out0, out1, C, D);
or op11(out11, out0, out1, C, out3);
or op12(out12, out0, out1, out2, out3);

and op13(Y, out4, out5, out6, out7, out8, out9, out10, out11, out12);

//Inicio de las operaciones
initial begin

//Se agrega información a imprimir para facilitar comprensión
	$display("A B C D | Y");
	$display("-----------");

//Se especifican las variables cuyos estados se desean monitorear
	$monitor("%b %b %b %b | %b", A, B, C, D, Y);
	A = 0; B = 0; C = 0; D = 0;
	#1 D = 1;
	#1 D = 0; C = 1;
	#1 D = 1; 
	#1 D = 0; C = 0; B = 1;
	#1 D = 1;
	#1 D = 0; C = 1;
	#1 D = 1;
	#1 D = 0; C = 0; B = 0; A = 1;
	#1 D = 1;
	#1 D = 0; C = 1; 
	#1 D = 1; 
	#1 D = 0; C = 0; B = 1; 
	#1 D = 1;
	#1 D = 0; C = 1;
	#1 D = 1;
end

//Código para habilitar GTKWave
	initial
		begin 
		$dumpfile ("Tabla3_tb.vcd");
		$dumpvars(0, Tabla3);
	end
endmodule