module top_module (
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);//

    wire wcio; 
    
    add16 add16_1 (.a(a[15:0]), .b(b[15:0]), .cin(1'b0), .sum(sum[15:0]), .cout(wcio) );
    add16 add16_2 (.a(a[31:16]), .b(b[31:16]), .cin(wcio), .sum(sum[31:16]), .cout(1'b0) );
    
endmodule

module add1 ( input a, input b, input cin,   output sum, output cout );

/* Working Full Adder but Less Efficient
    wire [1:0] sumwide;  
    assign sumwide = a + b + cin;
    assign cout = sumwide [1];
    assign sum = sumwide [0];
*/
    assign sum = a ^ b ^ cin;
	assign cout = a&b | a&cin | b&cin;
    
endmodule
