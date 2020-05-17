/***** ZbotAPI - Animation - Component of the Zbot API *****/

//Version - 1.0
//Created By - Zodius


/***** To use the ZbotAPI - Animation *****/

//Place the following at the point where the converters action is required:
//#include "ZbotAPI_Animation.h"

/***** Start of ZbotAPI *****/

	//If LEG1 is defined
	#ifdef LEG1
		static-var Prev_Angle1, Prev_Xangle1, Prev_Inner1;
	#endif

	//If LEG2 is defined
	#ifdef LEG2
		static-var Prev_Angle2, Prev_Xangle2, Prev_Inner2;
	#endif
	
	//If LEG3 is defined
	#ifdef LEG3
		static-var Prev_Angle3, Prev_Xangle3, Prev_Inner3;
	#endif
	
	//If LEG4 is defined
	#ifdef LEG4
		static-var Prev_Angle4, Prev_Xangle4, Prev_Inner4;
	#endif
	
	//If LEG5 is defined
	#ifdef LEG5
		static-var Prev_Angle5, Prev_Xangle5, Prev_Inner5;
	#endif
	
	//If LEG6 is defined
	#ifdef LEG6
		static-var Prev_Angle6, Prev_Xangle6, Prev_Inner6;
	#endif
	
	//If LEG7 is defined
	#ifdef LEG7
		static-var Prev_Angle7, Prev_Xangle7, Prev_Inner7;
	#endif
	
	//If LEG8 is defined
	#ifdef LEG8
		static-var Prev_Angle8, Prev_Xangle8, Prev_Inner8;
	#endif


PositionLegs()
{
	var Angle, Xangle, Length, Total_Angle, Inner_Angle, Outer_Angle, Test_Angle, Angle_Increment, Smooth_Speed;
	var Interrupt;

	while(TRUE)
	{	
		Interrupt = 0;

		//Attach feet to the ground
		#if Y_LOCK == TRUE
			#ifdef LEG1
				move POINT1 to y-axis (get GROUND_HEIGHT(get PIECE_XZ(POINT1))- get PIECE_Y(POINT1)) speed LIN_SPEED;
			#endif
			#ifdef LEG2
				move POINT2 to y-axis (get GROUND_HEIGHT(get PIECE_XZ(POINT2))- get PIECE_Y(POINT2)) speed LIN_SPEED;
			#endif
			#ifdef LEG3
				move POINT3 to y-axis (get GROUND_HEIGHT(get PIECE_XZ(POINT3))- get PIECE_Y(POINT3)) speed LIN_SPEED;
			#endif
			#ifdef LEG4
				move POINT4 to y-axis (get GROUND_HEIGHT(get PIECE_XZ(POINT4))- get PIECE_Y(POINT4)) speed LIN_SPEED;
			#endif
			#ifdef LEG5
				move POINT5 to y-axis (get GROUND_HEIGHT(get PIECE_XZ(POINT5))- get PIECE_Y(POINT5)) speed LIN_SPEED;
			#endif
			#ifdef LEG6
				move POINT6 to y-axis (get GROUND_HEIGHT(get PIECE_XZ(POINT6))- get PIECE_Y(POINT6)) speed LIN_SPEED;
			#endif
			#ifdef LEG7
				move POINT7 to y-axis (get GROUND_HEIGHT(get PIECE_XZ(POINT7))- get PIECE_Y(POINT7)) speed LIN_SPEED;
			#endif
			#ifdef LEG8
				move POINT8 to y-axis (get GROUND_HEIGHT(get PIECE_XZ(POINT8))- get PIECE_Y(POINT8)) speed LIN_SPEED;
			#endif
		#endif

		#define INITIALISE	FALSE
		#include "LEG_CLUSTER.h"

		#ifdef LEG1
			if(Prev_Angle1 >= LEG1_ANGLE + ANGLE_RANGE){Interrupt = 1;}
			if(Prev_Angle1 < LEG1_ANGLE - ANGLE_RANGE){Interrupt = 1;}
		#endif
		
		#ifdef LEG2
			if(Prev_Angle2 >= LEG2_ANGLE + ANGLE_RANGE){Interrupt = 1;}
			if(Prev_Angle2 < LEG2_ANGLE - ANGLE_RANGE){Interrupt = 1;}
		#endif
		
		#ifdef LEG3
			if(Prev_Angle3 >= LEG3_ANGLE + ANGLE_RANGE){Interrupt = 1;}
			if(Prev_Angle3 < LEG3_ANGLE - ANGLE_RANGE){Interrupt = 1;}
		#endif
		
		#ifdef LEG4
			if(Prev_Angle4 >= LEG4_ANGLE + ANGLE_RANGE){Interrupt = 1;}
			if(Prev_Angle4 < LEG4_ANGLE - ANGLE_RANGE){Interrupt = 1;}
		#endif
		
		#ifdef LEG5
			if(Prev_Angle5 >= LEG5_ANGLE + ANGLE_RANGE){Interrupt = 1;}
			if(Prev_Angle5 < LEG5_ANGLE - ANGLE_RANGE){Interrupt = 1;}
		#endif

		#ifdef LEG6
			if(Prev_Angle6 >= LEG6_ANGLE + ANGLE_RANGE){Interrupt = 1;}
			if(Prev_Angle6 < LEG6_ANGLE - ANGLE_RANGE){Interrupt = 1;}
		#endif

		#ifdef LEG7
			if(Prev_Angle7 >= LEG7_ANGLE + ANGLE_RANGE){Interrupt = 1;}
			if(Prev_Angle7 < LEG7_ANGLE - ANGLE_RANGE){Interrupt = 1;}
		#endif

		#ifdef LEG8
			if(Prev_Angle8 >= LEG8_ANGLE + ANGLE_RANGE){Interrupt = 1;}
			if(Prev_Angle8 < LEG8_ANGLE - ANGLE_RANGE){Interrupt = 1;}
		#endif

		//Turning Prevention - Sometimes when the unit turns, the stop moving function is called. This can cause the legs to go under the body and not look right.
		//This script detects if the unit isn't moving and if the legs are about to turn to far. If that happens, the script enables a single stride to correct the problem.
		if(Interrupt == 1)
		{
			if(Moving == 0)
			{
				if(LegGroupSelect == 0){Group1_Lock = 0;}
				if(LegGroupSelect == 1){Group2_Lock = 0;}
				Interrupt = 0;
			}
		}
		sleep REFRESH;
	}
}