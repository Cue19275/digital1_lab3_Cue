//Carlos Cuellar Klingenberger #19275 UVG
//Archivo correspondiente a la POS de la tabla 1

//Creo el módulo
module Tabla1();

//Creo las variables de entrada 
//y salidas de las diversas compuertas
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

or op3(out3, A, B, out2);
or op4(out4, A, out1, out2);
or op5(out5, out0, out1, C);

and op6(Y, out3, out4, out5);

//Inicio de las operaciones
initial begin

//Se agrega información a imprimir para facilitar comprensión
	$display("A B C | Y");
	$display("---------");

//Se especifica las variables cuyos estados
//Se desean monitorear	
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
			$dumpfile("Tabla1_tb.vcd");
			$dumpvars(0, Tabla1);
		end
endmodule
