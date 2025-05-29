//`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Student
// Engineer: Pulipati Lokesh Varma
// 
// Create Date: 28.05.2025 19:56:33
// Design Name: 
// Module Name: washing_machine
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module washing_machine(clk,rst,clothes,det_liquid,water_tap,finish,error  );
  //  output washing,rinsing,spining;
    input clk,rst,clothes,det_liquid,water_tap;
    output reg finish,error;
    parameter idle=2'b00,wash=2'b01,rinse=2'b10,spin=2'b11;
    reg [1:0]cs,ns;
    reg [4:0]count;
    reg washd=0,rinsed=0,spind=0;
    always@(posedge clk or posedge rst)begin
        if(rst)begin
            cs<=idle;
        end
        else begin
            cs<=ns;
        end
    
    end
    
    always@(posedge clk)begin
       // count=0;
        case(cs)
            2'b00:begin
                finish<=1'b0;
                error<=1'b0;
                count<=0;
                if(clothes && det_liquid && water_tap)begin
                    ns<=wash;
                
                end
                else if(clothes && det_liquid && !water_tap)begin
                    error<=1'b1;
                    
                end
                else begin
                    ns<=idle;
                end
            
            end
           2'b01:begin
                     if(count<30 && washd!=1'b1)begin
                          count<=count+1;
                          ns<=wash;
                         end  
                     else begin 
                     if(count>=30)begin
                          count<=0;
                          washd<=1'b1;
                          ns<=rinse;
                          
                         end
                      end
           end 
           2'b10:begin
                    if(count<30 && rinsed!=1'b1)begin
                       count<=count+1;
                     //  ns<=rinse;
                     end  
                     else begin 
                             if(count>=30)begin
                             count<=0;
                             rinsed<=1'b1;
                             ns<=spin;
                              end 
                              end
              end
           2'b11:  begin
                          if(count<30 && spind!=1'b1)begin
                             count<=count+1;
                              ns<=spin;

                              end  
              else begin 
                      if(count>=30)begin
                         finish<=1'b1;
                         spind<=1'b1;
                             ns<=idle;
                        end 
                end
            end
        endcase
    
    end
endmodule
