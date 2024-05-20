
module BOOTH(
	input			clk_pad,
	input			rstn_pad,
	input   multiplicand_0_pad,
	input   multiplicand_1_pad,
	input   multiplicand_2_pad,
	input   multiplicand_3_pad,
	input   multiplicand_4_pad,
	input   multiplicand_5_pad,
	input   multiplicand_6_pad,
	input   multiplicand_7_pad,
	input   multiplicand_8_pad,
	input   multiplicand_9_pad,
	input   multiplicand_10_pad,
	input   multiplicand_11_pad,
	input   multiplicand_12_pad,
	input   multiplicand_13_pad,
	input   multiplicand_14_pad,
	input   multiplicand_15_pad,
	input   multiplicand_16_pad,
	input   multiplicand_17_pad,
	input   multiplicand_18_pad,
	input   multiplicand_19_pad,
	input   multiplicand_20_pad,
	input   multiplicand_21_pad,
	input   multiplicand_22_pad,
	input   multiplicand_23_pad,
	input   multiplicand_24_pad,
	input   multiplicand_25_pad,
	input   multiplicand_26_pad,
	input   multiplicand_27_pad,
	input   multiplicand_28_pad,
	input   multiplicand_29_pad,
	input   multiplicand_30_pad,
	input   multiplicand_31_pad,

	input   multiplier_0_pad,
	input   multiplier_1_pad,
	input   multiplier_2_pad,
	input   multiplier_3_pad,
	input   multiplier_4_pad,
	input   multiplier_5_pad,
	input   multiplier_6_pad,
	input   multiplier_7_pad,
	input   multiplier_8_pad,
	input   multiplier_9_pad,
	input   multiplier_10_pad,
	input   multiplier_11_pad,
	input   multiplier_12_pad,
	input   multiplier_13_pad,
	input   multiplier_14_pad,
	input   multiplier_15_pad,
	input   multiplier_16_pad,
	input   multiplier_17_pad,
	input   multiplier_18_pad,
	input   multiplier_19_pad,
	input   multiplier_20_pad,
	input   multiplier_21_pad,
	input   multiplier_22_pad,
	input   multiplier_23_pad,
	input   multiplier_24_pad,
	input   multiplier_25_pad,
	input   multiplier_26_pad,
	input   multiplier_27_pad,
	input   multiplier_28_pad,
	input   multiplier_29_pad,
	input   multiplier_30_pad,
	input   multiplier_31_pad,

	output  result_0_pad,
	output  result_1_pad,
	output  result_2_pad,
	output  result_3_pad,
	output  result_4_pad,
	output  result_5_pad,
	output  result_6_pad,
	output  result_7_pad,
	output  result_8_pad,
	output  result_9_pad,
	output  result_10_pad,
	output  result_11_pad,
	output  result_12_pad,
	output  result_13_pad,
	output  result_14_pad,
	output  result_15_pad,
	output  result_16_pad,
	output  result_17_pad,
	output  result_18_pad,
	output  result_19_pad,
	output  result_20_pad,
	output  result_21_pad,
	output  result_22_pad,
	output  result_23_pad,
	output  result_24_pad,
	output  result_25_pad,
	output  result_26_pad,
	output  result_27_pad,
	output  result_28_pad,
	output  result_29_pad,
	output  result_30_pad,
	output  result_31_pad,
	output  result_32_pad,
	output  result_33_pad,
	output  result_34_pad,
	output  result_35_pad,
	output  result_36_pad,
	output  result_37_pad,
	output  result_38_pad,
	output  result_39_pad,
	output  result_40_pad,
	output  result_41_pad,
	output  result_42_pad,
	output  result_43_pad,
	output  result_44_pad,
	output  result_45_pad,
	output  result_46_pad,
	output  result_47_pad,
	output  result_48_pad,
	output  result_49_pad,
	output  result_50_pad,
	output  result_51_pad,
	output  result_52_pad,
	output  result_53_pad,
	output  result_54_pad,
	output  result_55_pad,
	output  result_56_pad,
	output  result_57_pad,
	output  result_58_pad,
	output  result_59_pad,
	output  result_60_pad,
	output  result_61_pad,
	output  result_62_pad,
	output  result_63_pad
);

	wire			clk;
	wire			rstn;
	wire   multiplicand_0;
	wire   multiplicand_1;
	wire   multiplicand_2;
	wire   multiplicand_3;
	wire   multiplicand_4;
	wire   multiplicand_5;
	wire   multiplicand_6;
	wire   multiplicand_7;
	wire   multiplicand_8;
	wire   multiplicand_9;
	wire   multiplicand_10;
	wire   multiplicand_11;
	wire   multiplicand_12;
	wire   multiplicand_13;
	wire   multiplicand_14;
	wire   multiplicand_15;
	wire   multiplicand_16;
	wire   multiplicand_17;
	wire   multiplicand_18;
	wire   multiplicand_19;
	wire   multiplicand_20;
	wire   multiplicand_21;
	wire   multiplicand_22;
	wire   multiplicand_23;
	wire   multiplicand_24;
	wire   multiplicand_25;
	wire   multiplicand_26;
	wire   multiplicand_27;
	wire   multiplicand_28;
	wire   multiplicand_29;
	wire   multiplicand_30;
	wire   multiplicand_31;

	wire   multiplier_0;
	wire   multiplier_1;
	wire   multiplier_2;
	wire   multiplier_3;
	wire   multiplier_4;
	wire   multiplier_5;
	wire   multiplier_6;
	wire   multiplier_7;
	wire   multiplier_8;
	wire   multiplier_9;
	wire   multiplier_10;
	wire   multiplier_11;
	wire   multiplier_12;
	wire   multiplier_13;
	wire   multiplier_14;
	wire   multiplier_15;
	wire   multiplier_16;
	wire   multiplier_17;
	wire   multiplier_18;
	wire   multiplier_19;
	wire   multiplier_20;
	wire   multiplier_21;
	wire   multiplier_22;
	wire   multiplier_23;
	wire   multiplier_24;
	wire   multiplier_25;
	wire   multiplier_26;
	wire   multiplier_27;
	wire   multiplier_28;
	wire   multiplier_29;
	wire   multiplier_30;
	wire   multiplier_31;

	wire  result_0;
	wire  result_1;
	wire  result_2;
	wire  result_3;
	wire  result_4;
	wire  result_5;
	wire  result_6;
	wire  result_7;
	wire  result_8;
	wire  result_9;
	wire  result_10;
	wire  result_11;
	wire  result_12;
	wire  result_13;
	wire  result_14;
	wire  result_15;
	wire  result_16;
	wire  result_17;
	wire  result_18;
	wire  result_19;
	wire  result_20;
	wire  result_21;
	wire  result_22;
	wire  result_23;
	wire  result_24;
	wire  result_25;
	wire  result_26;
	wire  result_27;
	wire  result_28;
	wire  result_29;
	wire  result_30;
	wire  result_31;
	wire  result_32;
	wire  result_33;
	wire  result_34;
	wire  result_35;
	wire  result_36;
	wire  result_37;
	wire  result_38;
	wire  result_39;
	wire  result_40;
	wire  result_41;
	wire  result_42;
	wire  result_43;
	wire  result_44;
	wire  result_45;
	wire  result_46;
	wire  result_47;
	wire  result_48;
	wire  result_49;
	wire  result_50;
	wire  result_51;
	wire  result_52;
	wire  result_53;
	wire  result_54;
	wire  result_55;
	wire  result_56;
	wire  result_57;
	wire  result_58;
	wire  result_59;
	wire  result_60;
	wire  result_61;
	wire  result_62;
	wire  result_63;


//Left
PRUW08DGZ_H_G clk_PAD(.I(1'b0), .OEN(1'b1), .REN(1'b0), .PAD(clk_pad), .C(clk));  					//input
PRUW08DGZ_H_G rstn_PAD(.I(1'b0), .OEN(1'b1), .REN(1'b0), .PAD(rstn_pad), .C(rstn));  					//input

//Top
PRUW08DGZ_V_G multiplicand_0_PAD(.I(1'b0), .OEN(1'b1), .REN(1'b0), .PAD(multiplicand_0_pad), .C(multiplicand_0));  	//input
PRUW08DGZ_V_G multiplicand_1_PAD(.I(1'b0), .OEN(1'b1), .REN(1'b0), .PAD(multiplicand_1_pad), .C(multiplicand_1));  	//input
PRUW08DGZ_V_G multiplicand_2_PAD(.I(1'b0), .OEN(1'b1), .REN(1'b0), .PAD(multiplicand_2_pad), .C(multiplicand_2));  	//input
PRUW08DGZ_V_G multiplicand_3_PAD(.I(1'b0), .OEN(1'b1), .REN(1'b0), .PAD(multiplicand_3_pad), .C(multiplicand_3));  	//input
PRUW08DGZ_V_G multiplicand_4_PAD(.I(1'b0), .OEN(1'b1), .REN(1'b0), .PAD(multiplicand_4_pad), .C(multiplicand_4));  	//input
PRUW08DGZ_V_G multiplicand_5_PAD(.I(1'b0), .OEN(1'b1), .REN(1'b0), .PAD(multiplicand_5_pad), .C(multiplicand_5));  	//input
PRUW08DGZ_V_G multiplicand_6_PAD(.I(1'b0), .OEN(1'b1), .REN(1'b0), .PAD(multiplicand_6_pad), .C(multiplicand_6));  	//input
PRUW08DGZ_V_G multiplicand_7_PAD(.I(1'b0), .OEN(1'b1), .REN(1'b0), .PAD(multiplicand_7_pad), .C(multiplicand_7));  	//input
PRUW08DGZ_V_G multiplicand_8_PAD(.I(1'b0), .OEN(1'b1), .REN(1'b0), .PAD(multiplicand_8_pad), .C(multiplicand_8));  	//input
PRUW08DGZ_V_G multiplicand_9_PAD(.I(1'b0), .OEN(1'b1), .REN(1'b0), .PAD(multiplicand_9_pad), .C(multiplicand_9));  	//input
PRUW08DGZ_V_G multiplicand_10_PAD(.I(1'b0), .OEN(1'b1), .REN(1'b0), .PAD(multiplicand_10_pad), .C(multiplicand_10));  	//input
PRUW08DGZ_V_G multiplicand_11_PAD(.I(1'b0), .OEN(1'b1), .REN(1'b0), .PAD(multiplicand_11_pad), .C(multiplicand_11));  	//input
PRUW08DGZ_V_G multiplicand_12_PAD(.I(1'b0), .OEN(1'b1), .REN(1'b0), .PAD(multiplicand_12_pad), .C(multiplicand_12));  	//input
PRUW08DGZ_V_G multiplicand_13_PAD(.I(1'b0), .OEN(1'b1), .REN(1'b0), .PAD(multiplicand_13_pad), .C(multiplicand_13));  	//input
PRUW08DGZ_V_G multiplicand_14_PAD(.I(1'b0), .OEN(1'b1), .REN(1'b0), .PAD(multiplicand_14_pad), .C(multiplicand_14));  	//input
PRUW08DGZ_V_G multiplicand_15_PAD(.I(1'b0), .OEN(1'b1), .REN(1'b0), .PAD(multiplicand_15_pad), .C(multiplicand_15));  	//input
PRUW08DGZ_V_G multiplicand_16_PAD(.I(1'b0), .OEN(1'b1), .REN(1'b0), .PAD(multiplicand_16_pad), .C(multiplicand_16));  	//input
PRUW08DGZ_V_G multiplicand_17_PAD(.I(1'b0), .OEN(1'b1), .REN(1'b0), .PAD(multiplicand_17_pad), .C(multiplicand_17));  	//input
PRUW08DGZ_V_G multiplicand_18_PAD(.I(1'b0), .OEN(1'b1), .REN(1'b0), .PAD(multiplicand_18_pad), .C(multiplicand_18));  	//input
PRUW08DGZ_V_G multiplicand_19_PAD(.I(1'b0), .OEN(1'b1), .REN(1'b0), .PAD(multiplicand_19_pad), .C(multiplicand_19));  	//input
PRUW08DGZ_V_G multiplicand_20_PAD(.I(1'b0), .OEN(1'b1), .REN(1'b0), .PAD(multiplicand_20_pad), .C(multiplicand_20));  	//input
PRUW08DGZ_V_G multiplicand_21_PAD(.I(1'b0), .OEN(1'b1), .REN(1'b0), .PAD(multiplicand_21_pad), .C(multiplicand_21));  	//input
PRUW08DGZ_V_G multiplicand_22_PAD(.I(1'b0), .OEN(1'b1), .REN(1'b0), .PAD(multiplicand_22_pad), .C(multiplicand_22));  	//input
PRUW08DGZ_V_G multiplicand_23_PAD(.I(1'b0), .OEN(1'b1), .REN(1'b0), .PAD(multiplicand_23_pad), .C(multiplicand_23));  	//input
PRUW08DGZ_V_G multiplicand_24_PAD(.I(1'b0), .OEN(1'b1), .REN(1'b0), .PAD(multiplicand_24_pad), .C(multiplicand_24));  	//input
PRUW08DGZ_V_G multiplicand_25_PAD(.I(1'b0), .OEN(1'b1), .REN(1'b0), .PAD(multiplicand_25_pad), .C(multiplicand_25));  	//input
PRUW08DGZ_V_G multiplicand_26_PAD(.I(1'b0), .OEN(1'b1), .REN(1'b0), .PAD(multiplicand_26_pad), .C(multiplicand_26));  	//input
PRUW08DGZ_V_G multiplicand_27_PAD(.I(1'b0), .OEN(1'b1), .REN(1'b0), .PAD(multiplicand_27_pad), .C(multiplicand_27));  	//input
PRUW08DGZ_V_G multiplicand_28_PAD(.I(1'b0), .OEN(1'b1), .REN(1'b0), .PAD(multiplicand_28_pad), .C(multiplicand_28));  	//input
PRUW08DGZ_V_G multiplicand_29_PAD(.I(1'b0), .OEN(1'b1), .REN(1'b0), .PAD(multiplicand_29_pad), .C(multiplicand_29));  	//input
PRUW08DGZ_V_G multiplicand_30_PAD(.I(1'b0), .OEN(1'b1), .REN(1'b0), .PAD(multiplicand_30_pad), .C(multiplicand_30));  	//input
PRUW08DGZ_V_G multiplicand_31_PAD(.I(1'b0), .OEN(1'b1), .REN(1'b0), .PAD(multiplicand_31_pad), .C(multiplicand_31));  	//input

//Right
PRUW08DGZ_H_G multiplier_0_PAD(.I(1'b0), .OEN(1'b1), .REN(1'b0), .PAD(multiplier_0_pad), .C(multiplier_0));  	//input
PRUW08DGZ_H_G multiplier_1_PAD(.I(1'b0), .OEN(1'b1), .REN(1'b0), .PAD(multiplier_1_pad), .C(multiplier_1));  	//input
PRUW08DGZ_H_G multiplier_2_PAD(.I(1'b0), .OEN(1'b1), .REN(1'b0), .PAD(multiplier_2_pad), .C(multiplier_2));  	//input
PRUW08DGZ_H_G multiplier_3_PAD(.I(1'b0), .OEN(1'b1), .REN(1'b0), .PAD(multiplier_3_pad), .C(multiplier_3));  	//input
PRUW08DGZ_H_G multiplier_4_PAD(.I(1'b0), .OEN(1'b1), .REN(1'b0), .PAD(multiplier_4_pad), .C(multiplier_4));  	//input
PRUW08DGZ_H_G multiplier_5_PAD(.I(1'b0), .OEN(1'b1), .REN(1'b0), .PAD(multiplier_5_pad), .C(multiplier_5));  	//input
PRUW08DGZ_H_G multiplier_6_PAD(.I(1'b0), .OEN(1'b1), .REN(1'b0), .PAD(multiplier_6_pad), .C(multiplier_6));  	//input
PRUW08DGZ_H_G multiplier_7_PAD(.I(1'b0), .OEN(1'b1), .REN(1'b0), .PAD(multiplier_7_pad), .C(multiplier_7));  	//input
PRUW08DGZ_H_G multiplier_8_PAD(.I(1'b0), .OEN(1'b1), .REN(1'b0), .PAD(multiplier_8_pad), .C(multiplier_8));  	//input
PRUW08DGZ_H_G multiplier_9_PAD(.I(1'b0), .OEN(1'b1), .REN(1'b0), .PAD(multiplier_9_pad), .C(multiplier_9));  	//input
PRUW08DGZ_H_G multiplier_10_PAD(.I(1'b0), .OEN(1'b1), .REN(1'b0), .PAD(multiplier_10_pad), .C(multiplier_10));  	//input
PRUW08DGZ_H_G multiplier_11_PAD(.I(1'b0), .OEN(1'b1), .REN(1'b0), .PAD(multiplier_11_pad), .C(multiplier_11));  	//input
PRUW08DGZ_H_G multiplier_12_PAD(.I(1'b0), .OEN(1'b1), .REN(1'b0), .PAD(multiplier_12_pad), .C(multiplier_12));  	//input
PRUW08DGZ_H_G multiplier_13_PAD(.I(1'b0), .OEN(1'b1), .REN(1'b0), .PAD(multiplier_13_pad), .C(multiplier_13));  	//input
PRUW08DGZ_H_G multiplier_14_PAD(.I(1'b0), .OEN(1'b1), .REN(1'b0), .PAD(multiplier_14_pad), .C(multiplier_14));  	//input
PRUW08DGZ_H_G multiplier_15_PAD(.I(1'b0), .OEN(1'b1), .REN(1'b0), .PAD(multiplier_15_pad), .C(multiplier_15));  	//input
PRUW08DGZ_H_G multiplier_16_PAD(.I(1'b0), .OEN(1'b1), .REN(1'b0), .PAD(multiplier_16_pad), .C(multiplier_16));  	//input
PRUW08DGZ_H_G multiplier_17_PAD(.I(1'b0), .OEN(1'b1), .REN(1'b0), .PAD(multiplier_17_pad), .C(multiplier_17));  	//input
PRUW08DGZ_H_G multiplier_18_PAD(.I(1'b0), .OEN(1'b1), .REN(1'b0), .PAD(multiplier_18_pad), .C(multiplier_18));  	//input
PRUW08DGZ_H_G multiplier_19_PAD(.I(1'b0), .OEN(1'b1), .REN(1'b0), .PAD(multiplier_19_pad), .C(multiplier_19));  	//input
PRUW08DGZ_H_G multiplier_20_PAD(.I(1'b0), .OEN(1'b1), .REN(1'b0), .PAD(multiplier_20_pad), .C(multiplier_20));  	//input
PRUW08DGZ_H_G multiplier_21_PAD(.I(1'b0), .OEN(1'b1), .REN(1'b0), .PAD(multiplier_21_pad), .C(multiplier_21));  	//input
PRUW08DGZ_H_G multiplier_22_PAD(.I(1'b0), .OEN(1'b1), .REN(1'b0), .PAD(multiplier_22_pad), .C(multiplier_22));  	//input
PRUW08DGZ_H_G multiplier_23_PAD(.I(1'b0), .OEN(1'b1), .REN(1'b0), .PAD(multiplier_23_pad), .C(multiplier_23));  	//input
PRUW08DGZ_H_G multiplier_24_PAD(.I(1'b0), .OEN(1'b1), .REN(1'b0), .PAD(multiplier_24_pad), .C(multiplier_24));  	//input
PRUW08DGZ_H_G multiplier_25_PAD(.I(1'b0), .OEN(1'b1), .REN(1'b0), .PAD(multiplier_25_pad), .C(multiplier_25));  	//input
PRUW08DGZ_H_G multiplier_26_PAD(.I(1'b0), .OEN(1'b1), .REN(1'b0), .PAD(multiplier_26_pad), .C(multiplier_26));  	//input
PRUW08DGZ_H_G multiplier_27_PAD(.I(1'b0), .OEN(1'b1), .REN(1'b0), .PAD(multiplier_27_pad), .C(multiplier_27));  	//input
PRUW08DGZ_H_G multiplier_28_PAD(.I(1'b0), .OEN(1'b1), .REN(1'b0), .PAD(multiplier_28_pad), .C(multiplier_28));  	//input
PRUW08DGZ_H_G multiplier_29_PAD(.I(1'b0), .OEN(1'b1), .REN(1'b0), .PAD(multiplier_29_pad), .C(multiplier_29));  	//input
PRUW08DGZ_H_G multiplier_30_PAD(.I(1'b0), .OEN(1'b1), .REN(1'b0), .PAD(multiplier_30_pad), .C(multiplier_30));  	//input
PRUW08DGZ_H_G multiplier_31_PAD(.I(1'b0), .OEN(1'b1), .REN(1'b0), .PAD(multiplier_31_pad), .C(multiplier_31));  	//input	

//bottom
PRUW08DGZ_V_G result_0_PAD(.I(result_0), .OEN(1'b0), .REN(1'b1), .PAD(result_0_pad), .C());   		//output
PRUW08DGZ_V_G result_1_PAD(.I(result_1), .OEN(1'b0), .REN(1'b1), .PAD(result_1_pad), .C());   		//output
PRUW08DGZ_V_G result_2_PAD(.I(result_2), .OEN(1'b0), .REN(1'b1), .PAD(result_2_pad), .C());   		//output
PRUW08DGZ_V_G result_3_PAD(.I(result_3), .OEN(1'b0), .REN(1'b1), .PAD(result_3_pad), .C());   		//output
PRUW08DGZ_V_G result_4_PAD(.I(result_4), .OEN(1'b0), .REN(1'b1), .PAD(result_4_pad), .C());   		//output
PRUW08DGZ_V_G result_5_PAD(.I(result_5), .OEN(1'b0), .REN(1'b1), .PAD(result_5_pad), .C());   		//output
PRUW08DGZ_V_G result_6_PAD(.I(result_6), .OEN(1'b0), .REN(1'b1), .PAD(result_6_pad), .C());   		//output
PRUW08DGZ_V_G result_7_PAD(.I(result_7), .OEN(1'b0), .REN(1'b1), .PAD(result_7_pad), .C());   		//output
PRUW08DGZ_V_G result_8_PAD(.I(result_8), .OEN(1'b0), .REN(1'b1), .PAD(result_8_pad), .C());   		//output
PRUW08DGZ_V_G result_9_PAD(.I(result_9), .OEN(1'b0), .REN(1'b1), .PAD(result_9_pad), .C());   		//output
PRUW08DGZ_V_G result_10_PAD(.I(result_10), .OEN(1'b0), .REN(1'b1), .PAD(result_10_pad), .C());   		//output
PRUW08DGZ_V_G result_11_PAD(.I(result_11), .OEN(1'b0), .REN(1'b1), .PAD(result_11_pad), .C());   		//output
PRUW08DGZ_V_G result_12_PAD(.I(result_12), .OEN(1'b0), .REN(1'b1), .PAD(result_12_pad), .C());   		//output
PRUW08DGZ_V_G result_13_PAD(.I(result_13), .OEN(1'b0), .REN(1'b1), .PAD(result_13_pad), .C());   		//output
PRUW08DGZ_V_G result_14_PAD(.I(result_14), .OEN(1'b0), .REN(1'b1), .PAD(result_14_pad), .C());   		//output
PRUW08DGZ_V_G result_15_PAD(.I(result_15), .OEN(1'b0), .REN(1'b1), .PAD(result_15_pad), .C());   		//output
PRUW08DGZ_V_G result_16_PAD(.I(result_16), .OEN(1'b0), .REN(1'b1), .PAD(result_16_pad), .C());   		//output
PRUW08DGZ_V_G result_17_PAD(.I(result_17), .OEN(1'b0), .REN(1'b1), .PAD(result_17_pad), .C());   		//output
PRUW08DGZ_V_G result_18_PAD(.I(result_18), .OEN(1'b0), .REN(1'b1), .PAD(result_18_pad), .C());   		//output
PRUW08DGZ_V_G result_19_PAD(.I(result_19), .OEN(1'b0), .REN(1'b1), .PAD(result_19_pad), .C());   		//output
PRUW08DGZ_V_G result_20_PAD(.I(result_20), .OEN(1'b0), .REN(1'b1), .PAD(result_20_pad), .C());   		//output
PRUW08DGZ_V_G result_21_PAD(.I(result_21), .OEN(1'b0), .REN(1'b1), .PAD(result_21_pad), .C());   		//output
PRUW08DGZ_V_G result_22_PAD(.I(result_22), .OEN(1'b0), .REN(1'b1), .PAD(result_22_pad), .C());   		//output
PRUW08DGZ_V_G result_23_PAD(.I(result_23), .OEN(1'b0), .REN(1'b1), .PAD(result_23_pad), .C());   		//output
PRUW08DGZ_V_G result_24_PAD(.I(result_24), .OEN(1'b0), .REN(1'b1), .PAD(result_24_pad), .C());   		//output
PRUW08DGZ_V_G result_25_PAD(.I(result_25), .OEN(1'b0), .REN(1'b1), .PAD(result_25_pad), .C());   		//output
PRUW08DGZ_V_G result_26_PAD(.I(result_26), .OEN(1'b0), .REN(1'b1), .PAD(result_26_pad), .C());   		//output
PRUW08DGZ_V_G result_27_PAD(.I(result_27), .OEN(1'b0), .REN(1'b1), .PAD(result_27_pad), .C());   		//output
PRUW08DGZ_V_G result_28_PAD(.I(result_28), .OEN(1'b0), .REN(1'b1), .PAD(result_28_pad), .C());   		//output
PRUW08DGZ_V_G result_29_PAD(.I(result_29), .OEN(1'b0), .REN(1'b1), .PAD(result_29_pad), .C());   		//output
PRUW08DGZ_V_G result_30_PAD(.I(result_30), .OEN(1'b0), .REN(1'b1), .PAD(result_30_pad), .C());   		//output
PRUW08DGZ_V_G result_31_PAD(.I(result_31), .OEN(1'b0), .REN(1'b1), .PAD(result_31_pad), .C());   		//output
PRUW08DGZ_V_G result_32_PAD(.I(result_32), .OEN(1'b0), .REN(1'b1), .PAD(result_32_pad), .C());   		//output
PRUW08DGZ_V_G result_33_PAD(.I(result_33), .OEN(1'b0), .REN(1'b1), .PAD(result_33_pad), .C());   		//output
PRUW08DGZ_V_G result_34_PAD(.I(result_34), .OEN(1'b0), .REN(1'b1), .PAD(result_34_pad), .C());   		//output
PRUW08DGZ_V_G result_35_PAD(.I(result_35), .OEN(1'b0), .REN(1'b1), .PAD(result_35_pad), .C());   		//output
PRUW08DGZ_V_G result_36_PAD(.I(result_36), .OEN(1'b0), .REN(1'b1), .PAD(result_36_pad), .C());   		//output
PRUW08DGZ_V_G result_37_PAD(.I(result_37), .OEN(1'b0), .REN(1'b1), .PAD(result_37_pad), .C());   		//output
PRUW08DGZ_V_G result_38_PAD(.I(result_38), .OEN(1'b0), .REN(1'b1), .PAD(result_38_pad), .C());   		//output
PRUW08DGZ_V_G result_39_PAD(.I(result_39), .OEN(1'b0), .REN(1'b1), .PAD(result_39_pad), .C());   		//output
PRUW08DGZ_V_G result_40_PAD(.I(result_40), .OEN(1'b0), .REN(1'b1), .PAD(result_40_pad), .C());   		//output
PRUW08DGZ_V_G result_41_PAD(.I(result_41), .OEN(1'b0), .REN(1'b1), .PAD(result_41_pad), .C());   		//output
PRUW08DGZ_V_G result_42_PAD(.I(result_42), .OEN(1'b0), .REN(1'b1), .PAD(result_42_pad), .C());   		//output
PRUW08DGZ_V_G result_43_PAD(.I(result_43), .OEN(1'b0), .REN(1'b1), .PAD(result_43_pad), .C());   		//output
PRUW08DGZ_V_G result_44_PAD(.I(result_44), .OEN(1'b0), .REN(1'b1), .PAD(result_44_pad), .C());   		//output
PRUW08DGZ_V_G result_45_PAD(.I(result_45), .OEN(1'b0), .REN(1'b1), .PAD(result_45_pad), .C());   		//output
PRUW08DGZ_V_G result_46_PAD(.I(result_46), .OEN(1'b0), .REN(1'b1), .PAD(result_46_pad), .C());   		//output
PRUW08DGZ_V_G result_47_PAD(.I(result_47), .OEN(1'b0), .REN(1'b1), .PAD(result_47_pad), .C());   		//output
PRUW08DGZ_V_G result_48_PAD(.I(result_48), .OEN(1'b0), .REN(1'b1), .PAD(result_48_pad), .C());   		//output
PRUW08DGZ_V_G result_49_PAD(.I(result_49), .OEN(1'b0), .REN(1'b1), .PAD(result_49_pad), .C());   		//output
PRUW08DGZ_V_G result_50_PAD(.I(result_50), .OEN(1'b0), .REN(1'b1), .PAD(result_50_pad), .C());   		//output
PRUW08DGZ_V_G result_51_PAD(.I(result_51), .OEN(1'b0), .REN(1'b1), .PAD(result_51_pad), .C());   		//output
PRUW08DGZ_V_G result_52_PAD(.I(result_52), .OEN(1'b0), .REN(1'b1), .PAD(result_52_pad), .C());   		//output
PRUW08DGZ_V_G result_53_PAD(.I(result_53), .OEN(1'b0), .REN(1'b1), .PAD(result_53_pad), .C());   		//output
PRUW08DGZ_V_G result_54_PAD(.I(result_54), .OEN(1'b0), .REN(1'b1), .PAD(result_54_pad), .C());   		//output
PRUW08DGZ_V_G result_55_PAD(.I(result_55), .OEN(1'b0), .REN(1'b1), .PAD(result_55_pad), .C());   		//output
PRUW08DGZ_V_G result_56_PAD(.I(result_56), .OEN(1'b0), .REN(1'b1), .PAD(result_56_pad), .C());   		//output
PRUW08DGZ_V_G result_57_PAD(.I(result_57), .OEN(1'b0), .REN(1'b1), .PAD(result_57_pad), .C());   		//output
PRUW08DGZ_V_G result_58_PAD(.I(result_58), .OEN(1'b0), .REN(1'b1), .PAD(result_58_pad), .C());   		//output
PRUW08DGZ_V_G result_59_PAD(.I(result_59), .OEN(1'b0), .REN(1'b1), .PAD(result_59_pad), .C());   		//output
PRUW08DGZ_V_G result_60_PAD(.I(result_60), .OEN(1'b0), .REN(1'b1), .PAD(result_60_pad), .C());   		//output
PRUW08DGZ_V_G result_61_PAD(.I(result_61), .OEN(1'b0), .REN(1'b1), .PAD(result_61_pad), .C());   		//output
PRUW08DGZ_V_G result_62_PAD(.I(result_62), .OEN(1'b0), .REN(1'b1), .PAD(result_62_pad), .C());   		//output
PRUW08DGZ_V_G result_63_PAD(.I(result_63), .OEN(1'b0), .REN(1'b1), .PAD(result_63_pad), .C());   		//output


wire   [31:0]  multiplicand;
wire   [31:0]  multiplier;
wire   [63:0]  result;

booth_multiplier  u_booth_multiplier (
    .clk                     ( clk            ),
    .rstn                    ( rstn           ),
    .multiplicand            ( multiplicand   ),
    .multiplier              ( multiplier     ),

    .result                  ( result         )
);

	assign   multiplicand[0] = multiplicand_0;
	assign   multiplicand[1] = multiplicand_1;
	assign   multiplicand[2] = multiplicand_2;
	assign   multiplicand[3] = multiplicand_3;
	assign   multiplicand[4] = multiplicand_4;
	assign   multiplicand[5] = multiplicand_5;
	assign   multiplicand[6] = multiplicand_6;
	assign   multiplicand[7] = multiplicand_7;
	assign   multiplicand[8] = multiplicand_8;
	assign   multiplicand[9] = multiplicand_9;
	assign   multiplicand[10] = multiplicand_10;
	assign   multiplicand[11] = multiplicand_11;
	assign   multiplicand[12] = multiplicand_12;
	assign   multiplicand[13] = multiplicand_13;
	assign   multiplicand[14] = multiplicand_14;
	assign   multiplicand[15] = multiplicand_15;
	assign   multiplicand[16] = multiplicand_16;
	assign   multiplicand[17] = multiplicand_17;
	assign   multiplicand[18] = multiplicand_18;
	assign   multiplicand[19] = multiplicand_19;
	assign   multiplicand[20] = multiplicand_20;
	assign   multiplicand[21] = multiplicand_21;
	assign   multiplicand[22] = multiplicand_22;
	assign   multiplicand[23] = multiplicand_23;
	assign   multiplicand[24] = multiplicand_24;
	assign   multiplicand[25] = multiplicand_25;
	assign   multiplicand[26] = multiplicand_26;
	assign   multiplicand[27] = multiplicand_27;
	assign   multiplicand[28] = multiplicand_28;
	assign   multiplicand[29] = multiplicand_29;
	assign   multiplicand[30] = multiplicand_30;
	assign   multiplicand[31] = multiplicand_31;

	assign   multiplier[0] = multiplier_0;
	assign   multiplier[1] = multiplier_1;
	assign   multiplier[2] = multiplier_2;
	assign   multiplier[3] = multiplier_3;
	assign   multiplier[4] = multiplier_4;
	assign   multiplier[5] = multiplier_5;
	assign   multiplier[6] = multiplier_6;
	assign   multiplier[7] = multiplier_7;
	assign   multiplier[8] = multiplier_8;
	assign   multiplier[9] = multiplier_9;
	assign   multiplier[10] = multiplier_10;
	assign   multiplier[11] = multiplier_11;
	assign   multiplier[12] = multiplier_12;
	assign   multiplier[13] = multiplier_13;
	assign   multiplier[14] = multiplier_14;
	assign   multiplier[15] = multiplier_15;
	assign   multiplier[16] = multiplier_16;
	assign   multiplier[17] = multiplier_17;
	assign   multiplier[18] = multiplier_18;
	assign   multiplier[19] = multiplier_19;
	assign   multiplier[20] = multiplier_20;
	assign   multiplier[21] = multiplier_21;
	assign   multiplier[22] = multiplier_22;
	assign   multiplier[23] = multiplier_23;
	assign   multiplier[24] = multiplier_24;
	assign   multiplier[25] = multiplier_25;
	assign   multiplier[26] = multiplier_26;
	assign   multiplier[27] = multiplier_27;
	assign   multiplier[28] = multiplier_28;
	assign   multiplier[29] = multiplier_29;
	assign   multiplier[30] = multiplier_30;
	assign   multiplier[31] = multiplier_31;
	
	assign  result_0 = result[0];
	assign  result_1 = result[1];
	assign  result_2 = result[2];
	assign  result_3 = result[3];
	assign  result_4 = result[4];
	assign  result_5 = result[5];
	assign  result_6 = result[6];
	assign  result_7 = result[7];
	assign  result_8 = result[8];
	assign  result_9 = result[9];
	assign  result_10 = result[10];
	assign  result_11 = result[11];
	assign  result_12 = result[12];
	assign  result_13 = result[13];
	assign  result_14 = result[14];
	assign  result_15 = result[15];
	assign  result_16 = result[16];
	assign  result_17 = result[17];
	assign  result_18 = result[18];
	assign  result_19 = result[19];
	assign  result_20 = result[20];
	assign  result_21 = result[21];
	assign  result_22 = result[22];
	assign  result_23 = result[23];
	assign  result_24 = result[24];
	assign  result_25 = result[25];
	assign  result_26 = result[26];
	assign  result_27 = result[27];
	assign  result_28 = result[28];
	assign  result_29 = result[29];
	assign  result_30 = result[30];
	assign  result_31 = result[31];
	assign  result_32 = result[32];
	assign  result_33 = result[33];
	assign  result_34 = result[34];
	assign  result_35 = result[35];
	assign  result_36 = result[36];
	assign  result_37 = result[37];
	assign  result_38 = result[38];
	assign  result_39 = result[39];
	assign  result_40 = result[40];
	assign  result_41 = result[41];
	assign  result_42 = result[42];
	assign  result_43 = result[43];
	assign  result_44 = result[44];
	assign  result_45 = result[45];
	assign  result_46 = result[46];
	assign  result_47 = result[47];
	assign  result_48 = result[48];
	assign  result_49 = result[49];
	assign  result_50 = result[50];
	assign  result_51 = result[51];
	assign  result_52 = result[52];
	assign  result_53 = result[53];
	assign  result_54 = result[54];
	assign  result_55 = result[55];
	assign  result_56 = result[56];
	assign  result_57 = result[57];
	assign  result_58 = result[58];
	assign  result_59 = result[59];
	assign  result_60 = result[60];
	assign  result_61 = result[61];
	assign  result_62 = result[62];
	assign  result_63 = result[63];


endmodule