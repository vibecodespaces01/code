module top (I1,I2,O1);
 input I1, I2;
 output O1;
 assign O1 = I1 | I2;
endmodule