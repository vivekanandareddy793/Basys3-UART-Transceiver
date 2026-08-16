`timescale 1ns/1ps

module baud_rate_generator #(
    parameter  basys_3_frequnecy  = 100000000, UART_standard = 9600 )
    (
    input clk , reset,
    output reg rx_enb , tx_enb 
);

     localparam max_count_tx = basys_3_frequnecy / UART_standard ;


  reg [13:0] tx_counter;
  reg [9:0] rx_counter ;

  always @(posedge clk or posedge reset) begin
      if(reset)
        begin
            tx_enb = 0;
            tx_counter = 14'b0;
        end
      else 
        begin
            if ( tx_counter == max_count_tx ) 
            begin
                tx_enb = 1'b1 ;
                tx_counter = 0;
            end
            else 
            begin 
                tx_counter = tx_counter + 1 ;
                tx_enb = 0;
            end
        end
  end

always @(posedge clk or posedge reset) begin
      if(reset)
        begin
            rx_enb = 0;
            rx_counter = 14'b0;
        end
      else 
        begin
            if ( rx_counter == 650 ) 
            begin
                rx_enb = 1'b1 ;
                rx_counter = 0;
            end
            else 
            begin 
                rx_counter = rx_counter + 1 ;
                rx_enb = 0;
            end
        end
  end

endmodule