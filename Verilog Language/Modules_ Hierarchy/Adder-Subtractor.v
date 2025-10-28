module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
	wire cio;
    wire [31:0] btmp; 
    
    
    always @ (*)
        begin 
            case (sub)
                1'b0 : btmp = b;
                1'b1 : btmp = {32{b}} ^ {32{sub}};
            endcase
        end
    
    add16 add1 ( .a(a[15:0]), .b(btmp[15:0]), .cin(sub), .sum(sum[15:0]), .cout(cio) );
    add16 add2 ( .a(a[31:16]), .b(btmp[31:16]), .cin(cio), .sum(sum[31:16]), .cout(1'b0) );
    
    
    
endmodule


/*   THIS WORKS ALSO, WITH LESS CODE

module top_module (
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
    
    wire cio;
    wire [31:0] btmp; 
    
    assign btmp = sub ? (~b) : b; // EQUIVALENT TO ALWAYS BLOCK ABOVE
    
    add16 add1 ( .a(a[15:0]), .b(btmp[15:0]), .cin(sub), .sum(sum[15:0]), .cout(cio) );
    add16 add2 ( .a(a[31:16]), .b(btmp[31:16]), .cin(cio), .sum(sum[31:16]), .cout(1'b0) );
    
endmodule

*/

