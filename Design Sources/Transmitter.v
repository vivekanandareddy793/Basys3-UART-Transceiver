module transmitter ( 
   input clk , write_enb , enb ,reset ,
   input [7:0] data_in ,
   output reg tx , 
   output  busy 
);

 parameter idle   =2'b00 ;
 parameter start  = 2'b01 ; 
 parameter data_state = 2'b10 ;
 parameter stop = 2'b11 ;

 reg [7:0] data ;
 reg [2:0] index ;
 reg [1:0] state = 2'b00 ; 

 always @ (posedge clk )
 begin 
        if(reset)
        begin
            tx <= 1'b1 ;
            state <=idle ; 
        end
        else 
         begin
        case (state) 
           idle : begin 
                    if(write_enb)
                         begin 
                            state <= start ;
                             data <= data_in ;
                             index <= 3'b000 ; 
                         end

                    else 
                           state <= idle;
                    end

            start : begin
                    if(enb)
                    begin
                        tx <= 1'b0;
                        state <= data_state ;
                    end 
                    else 
                      state <= start ;
            end 

            data_state : begin
                  if(enb)
                  begin 
                   tx <= data[index] ; 

                    if(index == 3'd7)
                    begin
                      state <= stop ;
                    end
                    else 
                    begin
                      index <= index + 1 ;

                    end
                  end

                  end 

            stop : 
            begin 
                if(enb)
                begin 
                    tx <= 1'b1 ;
                    state <= idle ;
                end
                else
                state <= stop ;
            end

            default : 
                  begin 
                    tx <= 1'b1 ;
                    state <= idle;
                  end

        endcase 
 end
 end

 assign busy = (state == idle) ? 0 : 1 ; 

endmodule