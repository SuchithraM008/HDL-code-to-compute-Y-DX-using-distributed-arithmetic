module DX(x0,x1,x2,x3,x4,x5,x6,x7,clk,reset,start,done,Y0,Y1,Y2,Y3,Y4,Y5,Y6,Y7);
input [7:0]x0,x1,x2,x3,x4,x5,x6,x7;
input clk,reset,start;
output reg done;
output reg [11:0]Y0,Y1,Y2,Y3,Y4,Y5,Y6,Y7;
wire dn;
reg rst,strt,a;
wire [18:0]Temp;
reg [4:0]Count;

DTX Call_1 (.x0(x0),.x1(x1),.x2(x2),.x3(x3),.x4(x4),.x5(x5),.x6(x6),.x7(x7),.Row(Count),.clk(clk),.reset(rst),.start(strt),.done(dn),.Y(Temp));

always @(posedge clk)
begin
if(reset==1'b1)
begin
rst=1'b1;
strt=1'b0;
done=1'b0;
Count=5'd0;
a=1'b0;
end
else if(start==1'b1)
begin
if(Count<8)
begin
if(dn==1'b0&rst==1'b1&a==1'b1)
begin
Count=Count+1'b1;
a=1'b0;
end
rst=1'b0;
strt=1'b1;

if(dn==1'b1)
begin
a=1'b1;
rst=1'b1;
strt=1'b0;
if(Count==0)
Y0=Temp[18:7];
else if(Count==1)
Y1=Temp[18:7];
else if(Count==2)
Y2=Temp[18:7];
else if(Count==3)
Y3=Temp[18:7];
else if(Count==4)
Y4=Temp[18:7];
else if(Count==5)
Y5=Temp[18:7];
else if(Count==6)
Y6=Temp[18:7];
else if(Count==7)
Y7=Temp[18:7];

end
end



if(Count==8)
done=1'b1;
end
end
endmodule











