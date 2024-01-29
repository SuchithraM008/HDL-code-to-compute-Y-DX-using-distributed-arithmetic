# HDL-code-to-compute-Y-DX-using-distributed-arithmetic
To implement 1x8 x 8x1, we used 1 Adder, Shifter, ROM
and called it sequentially for all 8 bits. (Refer DTX.v,
ROM.v).
Later for 8x8 x 8x1, we called DTX.v module sequentially 8
times( once for each row of D Matrix). (Refer DX.v)
For test bench, go to file named “Test_Bench_DX.v”
Here is the Result of Test Bench:
(Look into Transcripts after pressing Run All)

Final Verdict: Total Area used – 1 Adder, Shifter.
Total Delay : 8 clk cycles for inputting X, 64 clk cycles for final
output.
