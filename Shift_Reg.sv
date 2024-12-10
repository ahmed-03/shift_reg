`timescale 1ns / 1ps

module Shift_Reg#(parameter width = 8)(
    input clk, rst_n,
    input en_shift,
    input load,
    input right_left,
    input [width-1:0]data_in,
    output logic out
    );
    
    logic [width-1:0]data_out;
    always @(posedge clk, negedge rst_n) begin
        if(!rst_n) begin
            data_out<='0;
            out<=0;
        end
        else if (load)begin
            data_out<=data_in;
        else if(en_shift) begin
                //right_left =1 right
                if (right_left) begin
                    out <= data_out[0];
                    data_out<= data_out >>1;
                end
                //right_left =0 left
                else if (!right_left) begin
                    out <= data_out[width-1];
                    data_out<= data_out <<1;
                end
            end
        end
    end


endmodule
