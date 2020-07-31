//Carlos Cuellar Klingenberger #19275 UVG

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
wire Y;

not op0(out0, A);
not op1(out1, B);
not op2(out2, C);

and op3(out3, out0, out1, C);
and op4(out4, A, B, out2);
and op5(out5, A, B, C);

or op6(Y, out3, out4, out5);

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