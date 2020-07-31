//Carlos Cuellar Klingenberger #19275 UVG
//Archivo correspondiente a la SOP de la tabla 3

//Creo el módulo
module Tabla4();

//Creo las variables de entrada y salidas de las compuertas
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
wire Y;

not op0(out0, A);
not op1(out1, B);
not op2(out2, C);
not op3(out3, D);

and op4(out4, out0, out1, out2, out3);
and op5(out5, out0, out1, C, out3);
and op6(out6, out0, out1, C, D);
and op7(out7, out0, B, C, out3);
and op8(out8, out0, B, C, D);
and op9(out9, A, out1, out2, out3);
and op10(out10, A, out1, C, out3);

or op11(Y, out4, out5, out6, out7, out8, out9, out10);

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
		$dumpfile ("Tabla4_tb.vcd");
		$dumpvars(0, Tabla4);
	end
endmodule