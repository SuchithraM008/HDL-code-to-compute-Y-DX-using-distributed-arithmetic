module Test_Bench_DX;
reg clk,reset,start;
wire done;
reg [7:0]x0,x1,x2,x3,x4,x5,x6,x7;
wire [11:0] Y0,Y1,Y2,Y3,Y4,Y5,Y6,Y7;
reg [4:0]Count;
DX Call_1 (.x0(x0),.x1(x1),.x2(x2),.x3(x3),.x4(x4),.x5(x5),.x6(x6),.x7(x7),.clk(clk),.reset(reset),.start(start),.done(done),.Y0(Y0),.Y1(Y1),.Y2(Y2),.Y3(Y3),.Y4(Y4),.Y5(Y5),.Y6(Y6),.Y7(Y7));
                   
initial 
begin
clk=1'b1;
repeat(10)
begin
Count=5'd0;
reset=1'b1;
start=1'b0;
#100;
reset=1'b0;
start=1'b1;
#1100;
if(done==1'b1)
begin
$display("X=[%d %d %d %d %d %d %d %d], Y=[%d %d %d %d %d %d %d %d]",$signed(x0),$signed(x1),$signed(x2),$signed(x3),$signed(x4),$signed(x5),$signed(x6),$signed(x7),$signed(Y0),$signed(Y1),$signed(Y2),$signed(Y3),$signed(Y4),$signed(Y5),$signed(Y6),$signed(Y7));
#10;      
end
end
$stop;
end
always @(posedge clk)
begin
if(reset==1'b1)
begin
if(Count==0)
x0=$random;
else if(Count==1)
x1=$random;
else if(Count==2)
x2=$random;
else if(Count==3)
x3=$random;
else if(Count==4)
x4=$random;
else if(Count==5)
x5=$random;
else if(Count==6)
x6=$random;
else if(Count==7)
x7=$random;
Count=Count+1'b1;
end
if(Count==8)
Count=5'd0;
end
always
#5 clk=~clk;
endmodule





       
       