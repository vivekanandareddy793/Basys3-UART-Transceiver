module reciever ( 
    input clk , reset, ready_clr , clk_enb , rx ,
    output reg ready ,
    output reg [7:0] data_out 
);

 parameter start = 2'b00 ;
 parameter data_out_state = 2'b01 ; 
 parameter stop = 2'b10 ;


 reg [1:0] state = 2'b00 ;
 reg [3:0] sample = 0;
 reg [3:0] index  = 0 ;
 reg [7:0] data_temp = 8'b0 ;


 always @ ( posedge clk )
 begin
    if(reset ) begin
        ready <= 0;
        data_out <= 0;
        state <=start;
        sample <=0;
        index <=0;
    end
   else
    begin 
    if(ready_clr)
    begin
        ready <=0;
    end 
    else if(clk_enb)
        begin
            case(state)

                start : 
                begin 
                    if(rx == 0 || sample!=0 )
                   begin
                       if(sample == 15) 
                    begin 
                        state <= data_out_state  ;
                        sample <= 0;
                        index  <= 0 ;
                        data_temp <=0;
                    end 
                    else  
                    begin 
                        sample <= sample + 1'b1 ;
                    end
                end
               end
                data_out_state :
                  begin
                    sample <= sample + 1'b1 ;
                    if(sample == 4'h8)
                    begin
                        data_temp [index] <= rx ;
                        index <=index + 1'b1;
                    end
                    if(index == 8 && sample == 15 )

                    state <= stop ;
                  end

                stop : 
                begin 
                    if(sample == 15 )
                    begin
                        state <= start ;
                        data_out = data_temp ;
                        ready <= 1'b1 ;
                        sample <= 0 ;
                    end
                    else 
                    sample <=sample + 1'b1 ;

                end

            default : 
                    begin
                        state <= start ;
                    end

            endcase
        end
 end
 end

endmodule