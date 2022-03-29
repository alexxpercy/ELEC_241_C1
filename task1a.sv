// ELEC241 C1 2022
//Structural Version

/*
A	B	C	Y
0	0	0	00
0	0	1	01
0	1	0	01
0	1	1	10
1	0	0	01
1	0	1	10
1	1	0	10
1	1	1	11
*/

module task1a(output logic [1:0] Y, input logic A, B, C);

/*
Logic combinations:
Y[0] - (not A x not B x C) + (not A x B x not C) + (A x not B x not C) + (A x B x C)
Y[1] - (not A x B x C) + (A x not B x C) + (A x B x not C) + (A x B x C)
*/

//internal wires:
logic notA;
logic notB;
logic notC;
//internal comb wires - differenciate between all AND combos
logic Y0_1, Y0_2, Y0_3, Y0_4;
logic Y1_1, Y1_2, Y1_3, Y1_4;

//assign values to not_X
not u1 (notA, A);
not u2 (notB, B);
not u3 (notC, C);
//assign values to Y combos - bit 0
and a1 (Y0_1, notA, notB, C);
and a2 (Y0_2, notA, B, notC);
and a3 (Y0_3, A, notB, notC);
and a4 (Y0_4, A, B, C);
or a5 (Y[0], Y0_1, Y0_2, Y0_3, Y0_4);
//assign values to Y combos - bit 1
and b1 (Y1_1, notA, B, C);
and b2 (Y1_2, A, notB, C);
and b3 (Y1_3, A, B, notC);
and b4 (Y1_4, A, B, C);
or b5 (Y[1], Y1_1, Y1_2, Y1_3, Y1_4);

endmodule
