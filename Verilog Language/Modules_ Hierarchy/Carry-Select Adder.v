module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
	
    
    wire [15:0] w1;
    wire mux;
    wire [15:0] sum1, sum2;
   
    
    add16 add1 (.a(a[15:0]), .b(b[15:0]), .cin(1'b0), .sum(w1[15:0]), .cout(mux));
    add16 add2 (.a(a[31:16]), .b(b[31:16]), .cin(1'b0), .sum(sum1[15:0]), .cout(1'b0));
    add16 add3 (.a(a[31:16]), .b(b[31:16]), .cin(1'b1), .sum(sum2[15:0]), .cout(1'b0));
    
    always @ (*)
        begin
            case (mux)
                
                1'b0 : sum = {sum1, w1};
                1'b1 : sum = {sum2, w1};
                
            endcase
        end
   
        
        
endmodule
