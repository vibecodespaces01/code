// File: tb_adder4.sv
// Workbench (Testbench) para a XOR b

module tb_adder4;
    logic [3:0] a, b;
    logic [3:0] sum; // ajustado para 4 bits (XOR 4-bit)

    // Instancia o DUT - Device Under Test
    adder4 dut (
        .a(a),
        .b(b),
        .sum(sum)
    );

    // Gera estímulos
    initial begin
        // Cabeçalho de saída
        $display("time\ta\tb\tsum");
        $dumpfile("ondas.vcd");
        $dumpvars(0, tb_adder4);

        // Estímulos sequenciais
        a = 0; b = 0;
        #5  a = 4'd3;  b = 4'd2;
        #5  a = 4'd7;  b = 4'd8;
        #5  a = 4'hE; b = 4'd1;
        #5  a = 4'd9;  b = 4'd6;
        #5  a = 4'd5;  b = 4'd10;

        #10 $finish;  // encerra simulação
    end

    // Monitora mudanças
    initial begin
        $monitor("%0t\t%d\t%d\t%d", $time, a, b, sum);
    end
endmodule