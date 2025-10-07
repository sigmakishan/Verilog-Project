module tb_mux_demux;
    logic [3:0] test_data_in;
    logic [1:0] test_select;
    logic       mux_to_demux_wire;
    logic [3:0] final_data_out;

    // Instantiate the Multiplexer
    multiplexer dut_mux (
        .data_in(test_data_in),
        .select_lines(test_select),
        .data_out(mux_to_demux_wire)
    );

    // Instantiate the Demultiplexer
    demultiplexer dut_demux (
        .data_in(mux_to_demux_wire),
        .select_lines(test_select),
        .data_out(final_data_out)
    );
    
    initial begin
        $dumpfile("waveform.vcd");
        $dumpvars(0, tb_mux_demux);
        
        $display("Time | Select | Mux In   | Mux Out | Demux Out");
        $display("----------------------------------------------");
        
        test_data_in = 4'b1010; // D3=1, D2=0, D1=1, D0=0
        
        test_select = 2'b00; #10;
        test_select = 2'b01; #10;
        test_select = 2'b10; #10;
        test_select = 2'b11; #10;
        
        $finish;
    end
    
    always @* begin
      $monitor("%4d |   %b   |  %b  |    %b    |   %b  ", 
               $time, test_select, test_data_in, mux_to_demux_wire, final_data_out);
    end
endmodule
