`timescale 1ns/1ps

module cronometer_tb();

// Variables para test bench
reg clk, rst, enable;
wire [6:0] s_un, s_de;
wire [6:0] ms_un, ms_de;

// Instanciación del módulo top-level
cronometer DUT(
    .clk(clk),
    .rst(rst),
    .enable(enable),
    .s_un(s_un),
    .s_de(s_de),
    .ms_un(ms_un),
    .ms_de(ms_de)
);

// Establecimiento de condiciones iniciales
initial begin
    clk <= 0;
    rst <= 0;
    enable <= 0;
end

// Generación de señal de reloj
always #10 clk <= ~clk;

initial begin
    $display("Simulacion iniciada.");
    #30;
    rst <= 1;       // Activar reset para forzar condiciones iniciales
    #10;
    rst <= 0;       // Desactivar reset
    #200;         // Demora para estabilizar el sistema
    enable <= 1;

    #2000000000;           // Esperar a que la cuenta llegue a 20 segundos
    $display("Simulacion terminada.");

    $stop;
    $finish;
end

initial begin
    $dumpfile("cronometer_tb.vcd");
    $dumpvars(0, cronometer_tb);
end

endmodule