//Carlos Cuellar Klingenberger #19275 UVG
//Archivo correspondiente a la POS de la tabla 2

//Se crea el módulo
module Tabla2();

//Se crean las variables de:
//Entradas, operaciones y salidas
reg A;
reg B;
reg C;
wire out0;
wire out1;
wire out2;
wire out3;
wire out4;
wire out5;
wire out6;
wire out7;
wire Y;

not op0(out0, A);
not op1(out1, B);
not op2(out2, C);

or op3(out3, A, B, C);
or op4(out4, A, out1, C);
or op5(out5, A, out1, out2);
or op6(out6, out0, B, C);
or op7(out7, out0, B, out2);

and op8(Y, out3, out4, out5, out6, out7);

//Inicio de la operatoria
initial begin

//Info para facilitar la lectura de la salida final
	$display("A B C | Y");
	$display("---------");

//Se especifican las variables cuyos estados se
//Desean monitorear y la evolución de estas
	$monitor("%b %b %b | %b", A, B, C, Y);
	A = 0; B = 0; C = 0;
	#1 C = 1;
	#1 B = 1; C = 0;
	#1 C = 1;
	#1 A = 1; B = 0; C = 0;
	#1 C = 1;
	#1 B = 1; C = 0;
	#1 C = 1;
	#1 $finish;
end

//Código para habilitar GTKWave
	initial
		begin
			$dumpfile("Tabla2_tb.vcd");
			$dumpvars(0, Tabla2);
		end
endmodule