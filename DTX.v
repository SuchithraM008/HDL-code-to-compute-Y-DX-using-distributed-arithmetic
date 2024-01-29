module DTX (x0,x1,x2,x3,x4,x5,x6,x7,Row,clk,reset,start,done,Y);
input [7:0]x0,x1,x2,x3,x4,x5,x6,x7;
input [4:0]Row;
input clk,reset,start;
output reg done;
output reg[18:0]Y;
reg [7:0]S;
reg [13:0]A_New,B_New;
wire [10:0]B;
reg [4:0]Count;
reg k;
reg LSB[6:0];
wire [14:0]Temp;


Add_Sub_Nbit #(.N(14)) Call_1 (.A(A_New),.B(B_New),.k(k),.S(Temp));
ROM Call_2 (.S(S),.Count(Row),.Y(B));

assign B_New={{3{B[10]}},B};


always @(posedge clk)
begin
if(Count==8)
begin
Y={Temp[11:0],LSB[6],LSB[5],LSB[4],LSB[3],LSB[2],LSB[1],LSB[0]};
done=1'b1;
end
if(reset==1'b1)
begin
k=1'b0;
Count=5'd0;
A_New=14'd0;
B_New=14'd0;
done=1'b0;
end
else if(start==1'b1)
begin
if(Count<8)
begin
if(Count==7)
k=1'b1;

if(Count!=0)
begin
LSB[Count-1]=Temp[0];
A_New={Temp[13],Temp[13:1]};
end
S={x7[Count],x6[Count],x5[Count],x4[Count],x3[Count],x2[Count],x1[Count],x0[Count]};

Count=Count+1'b1;
end

end
end
endmodule







