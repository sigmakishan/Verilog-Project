// 4-to-1 Multiplexer
module multiplexer (
    input  [3:0] data_in,
    input  [1:0] select_lines,
    output logic data_out
);
    always_comb begin
        case (select_lines)
            2'b00: data_out = data_in[0];
            2'b01: data_out = data_in[1];
            2'b10: data_out = data_in[2];
            2'b11: data_out = data_in[3];
            default: data_out = 1'b0;
        endcase
    end
endmodule

// 1-to-4 Demultiplexer
module demultiplexer (
    input      data_in,
    input [1:0] select_lines,
    output logic [3:0] data_out
);
    always_comb begin
        data_out = 4'b0000; // Default all outputs to 0
        case (select_lines)
            2'b00: data_out[0] = data_in;
            2'b01: data_out[1] = data_in;
            2'b10: data_out[2] = data_in;
            2'b11: data_out[3] = data_in;
        endcase
    end
endmodule
