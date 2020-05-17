//***** SPIDER_LEG - Component of the Zbot API *****

//Version - 1.0
//Created By - Zodius
//Additional Credit - Zwzsg


//The purpose of this script is to align an arm or leg in the unit to a specified piece position.
//The idea is that a series of pieces are rotated until the end points position matches that of the piece.
//For this leg set up, all joints but the first are rotated by a given angle. The first is then
//rotated to complete the alignment.

//When this is viewed, the leg configuration is that which is typically expected from a spider.
//It is therefore ideal for spider based units, but undesirable for humanoid type units



//***** To use the SPIDER_LEG *****

//Place the following at the start of the function which uses the converter:
//var Angle, Xangle, Length, Total_Angle, Inner_Angle, Outer_Angle, Test_Angle, Angle_Increment;

//Place the following at the point where the leg action is required:
//#define JOINT0		origin_joint_name	(Optional, see below)
//#define JOINT1		joint_name
//#define JOINT2		joint_name
//#define JOINT3		joint_name
//#define JOINT4		joint_name
//...(There is support for up to 18 joints)
//#define POINT			piece_name
//#define END			end_piece_name
//#include "SPIDER_LEG.h"

//Add these following commands if you wish to change default values:
//#define JOINT2_DIR	positive_or_negative_value (default is 1)
//#define JOINT3_DIR	positive_or_negative_value (default is 1)
//#define JOINT4_DIR	positive_or_negative_value (default is 1)
//...(There is support for up to 18 joints)

//Note -	JOINT0 and JOINT1 can't have their directions changed.
//			JOINT0 is optional, and intended to be used on units which have the Y axis rotation
//			of a leg seperate from the actual leg structure. If it's not defined, then JOINT1 is
//			persumed to be the joint to turn. Note that in the model itself, the leg must be
//			positioned downwards. After the last joint, another end piece must be added.
//			It's this which is aligned to the specified point.



//***** Start of SPIDER_LEG *****

	#ifdef JOINT0
		//Calculate the angle in which to turn JOINT0
		Angle = get XZ_ATAN(get PIECE_XZ(JOINT0) - get PIECE_XZ(POINT));	

		//Turn JOINT0 to the specified angle on the Y axis
		turn JOINT0 to y-axis (Angle) now;
	#else
		//Calculate the angle in which to turn JOINT1
		Angle = get XZ_ATAN(get PIECE_XZ(JOINT1) - get PIECE_XZ(POINT));	

		//Turn JOINT1 to the specified angle on the Y axis
		turn JOINT1 to y-axis (Angle) now;
	#endif

	//Set variables to initial values
	Test_Angle = 0;
	Angle_Increment = 16384;
	Length = get HYPOT(get PIECE_Y(JOINT1) - get PIECE_Y(POINT), get XZ_HYPOT(get PIECE_XZ(JOINT1) - get PIECE_XZ(POINT)));
	
	while(Angle_Increment != 0)
	{
		//Update the angle that the JOINTs will turn to
		Inner_Angle = Test_Angle + Angle_Increment;
		
		//Turn the JOINTs to the new angle
		#ifdef JOINT2
			#ifdef JOINT2_DIR
				turn JOINT2 to x-axis (Inner_Angle * JOINT2_DIR) now;
			#else
				turn JOINT2 to x-axis (Inner_Angle) now;
			#endif
		#endif
		#ifdef JOINT3
			#ifdef JOINT3_DIR
				turn JOINT3 to x-axis (Inner_Angle * JOINT3_DIR) now;
			#else
				turn JOINT3 to x-axis (Inner_Angle) now;
			#endif
		#endif
		#ifdef JOINT4
			#ifdef JOINT4_DIR
				turn JOINT4 to x-axis (Inner_Angle * JOINT4_DIR) now;
			#else
				turn JOINT4 to x-axis (Inner_Angle) now;
			#endif
		#endif
		#ifdef JOINT5
			#ifdef JOINT5_DIR
				turn JOINT5 to x-axis (Inner_Angle * JOINT5_DIR) now;
			#else
				turn JOINT5 to x-axis (Inner_Angle) now;
			#endif
		#endif
		#ifdef JOINT6
			#ifdef JOINT6_DIR
				turn JOINT6 to x-axis (Inner_Angle * JOINT6_DIR) now;
			#else
				turn JOINT6 to x-axis (Inner_Angle) now;
			#endif
		#endif
		#ifdef JOINT7
			#ifdef JOINT7_DIR
				turn JOINT7 to x-axis (Inner_Angle * JOINT7_DIR) now;
			#else
				turn JOINT7 to x-axis (Inner_Angle) now;
			#endif
		#endif
		#ifdef JOINT8
			#ifdef JOINT8_DIR
				turn JOINT8 to x-axis (Inner_Angle * JOINT8_DIR) now;
			#else
				turn JOINT8 to x-axis (Inner_Angle) now;
			#endif
		#endif
		#ifdef JOINT9
			#ifdef JOINT9_DIR
				turn JOINT9 to x-axis (Inner_Angle * JOINT9_DIR) now;
			#else
				turn JOINT9 to x-axis (Inner_Angle) now;
			#endif
		#endif
		#ifdef JOINT10
			#ifdef JOINT10_DIR
				turn JOINT10 to x-axis (Inner_Angle * JOINT10_DIR) now;
			#else
				turn JOINT10 to x-axis (Inner_Angle) now;
			#endif
		#endif
		#ifdef JOINT11
			#ifdef JOINT11_DIR
				turn JOINT11 to x-axis (Inner_Angle * JOINT11_DIR) now;
			#else
				turn JOINT11 to x-axis (Inner_Angle) now;
			#endif
		#endif
		#ifdef JOINT12
			#ifdef JOINT12_DIR
				turn JOINT12 to x-axis (Inner_Angle * JOINT12_DIR) now;
			#else
				turn JOINT12 to x-axis (Inner_Angle) now;
			#endif
		#endif
		#ifdef JOINT13
			#ifdef JOINT13_DIR
				turn JOINT13 to x-axis (Inner_Angle * JOINT13_DIR) now;
			#else
				turn JOINT13 to x-axis (Inner_Angle) now;
			#endif
		#endif
		#ifdef JOINT14
			#ifdef JOINT14_DIR
				turn JOINT14 to x-axis (Inner_Angle * JOINT14_DIR) now;
			#else
				turn JOINT14 to x-axis (Inner_Angle) now;
			#endif
		#endif
		#ifdef JOINT15
			#ifdef JOINT15_DIR
				turn JOINT15 to x-axis (Inner_Angle * JOINT15_DIR) now;
			#else
				turn JOINT15 to x-axis (Inner_Angle) now;
			#endif
		#endif
		#ifdef JOINT16
			#ifdef JOINT16_DIR
				turn JOINT16 to x-axis (Inner_Angle * JOINT16_DIR) now;
			#else
				turn JOINT16 to x-axis (Inner_Angle) now;
			#endif
		#endif
		#ifdef JOINT17
			#ifdef JOINT17_DIR
				turn JOINT17 to x-axis (Inner_Angle * JOINT17_DIR) now;
			#else
				turn JOINT17 to x-axis (Inner_Angle) now;
			#endif
		#endif
		#ifdef JOINT18
			#ifdef JOINT18_DIR
				turn JOINT18 to x-axis (Inner_Angle * JOINT18_DIR) now;
			#else
				turn JOINT18 to x-axis (Inner_Angle) now;
			#endif
		#endif
		
		//Determines whether the JOINTs needs to be turned around the X axis
		if(get HYPOT(get PIECE_Y(JOINT1) - get PIECE_Y(END), get XZ_HYPOT(get PIECE_XZ(JOINT1) - get PIECE_XZ(END))) > Length)
		{
			Test_Angle = Test_Angle + Angle_Increment;
		}
		
		//Increase accuracy on the next iteration
		Angle_Increment = Angle_Increment / 2;
	}

	//Reset the X axis angle of JOINT1
	turn JOINT1 to x-axis 0 now;

	//Calculate the angle in which to turn JOINT1
	Outer_Angle = get ATAN(get PIECE_Y(JOINT1) - get PIECE_Y(END), get XZ_HYPOT(get PIECE_XZ(JOINT1) - get PIECE_XZ(END)));
	Total_Angle = get XZ_ATAN(get PIECE_XZ(END) - get PIECE_XZ(JOINT1)) - get XZ_ATAN(get PIECE_XZ(POINT) - get PIECE_XZ(JOINT1));
	
	while(Total_Angle < 0)
	{
		Total_Angle = Total_Angle + 65536;
	}
	while(Total_Angle >= 32768)
	{
		Total_Angle = Total_Angle - 65536;
	}
	if(Total_Angle < 0)
	{
		Total_Angle = 0 - Total_Angle;
	}
	if(Total_Angle >= 16384)
	{
		Xangle = get ATAN(get PIECE_Y(JOINT1) - get PIECE_Y(POINT), get XZ_HYPOT(get PIECE_XZ(JOINT1) - get PIECE_XZ(POINT))) + Outer_Angle - 32768;	
	}
	if(Total_Angle < 16384)
	{
		Xangle = get ATAN(get PIECE_Y(JOINT1) - get PIECE_Y(POINT), get XZ_HYPOT(get PIECE_XZ(JOINT1) - get PIECE_XZ(POINT))) - Outer_Angle;	
	}
	
	//Turn JOINT1 to the specified angle on the X axis
	turn JOINT1 to x-axis (Xangle) now;

	#ifdef PREV_ANGLE
		if((Angle > (PREV_ANGLE + TOLERANCE)) OR (Angle < (PREV_ANGLE - TOLERANCE)))
		{
			#if SMOOTH_ANIM == TRUE
				#ifdef JOINT0
					//Turn JOINT0 to the previous angle on the Y axis, then move smoothly
					#define AXIS		1
					#define JOINT		JOINT0
					#define CURRENT		Angle
					#define PREVIOUS	PREV_ANGLE
					#include "SMOOTH_ROTATION.h"
				#else
					//Turn JOINT1 to the previous angle on the Y axis, then move smoothly
					#define AXIS		1
					#define JOINT		JOINT1
					#define CURRENT		Angle
					#define PREVIOUS	PREV_ANGLE
					#include "SMOOTH_ROTATION.h"
				#endif
			#endif

			PREV_ANGLE = Angle;
		}
		else
		{
			#ifdef JOINT0
				turn JOINT0 to y-axis (PREV_ANGLE) now;
			#else
				turn JOINT1 to y-axis (PREV_ANGLE) now;
			#endif
		}
	#endif

	#ifdef PREV_INNER
		if((Inner_Angle > (PREV_INNER + TOLERANCE)) OR (Inner_Angle < (PREV_INNER - TOLERANCE)))
		{
			#if SMOOTH_ANIM == TRUE
				//Turn the JOINTs to the previous angle, then move smoothly
				#ifdef JOINT2
					#ifdef JOINT2_DIR
						#define AXIS		0
						#define JOINT		JOINT2
						#define CURRENT		Inner_Angle * JOINT2_DIR
						#define PREVIOUS	PREV_INNER * JOINT2_DIR
						#include "SMOOTH_ROTATION.h"
					#else
						#define AXIS		0
						#define JOINT		JOINT2
						#define CURRENT		Inner_Angle
						#define PREVIOUS	PREV_INNER
						#include "SMOOTH_ROTATION.h"
					#endif
				#endif
				
				#ifdef JOINT3
					#ifdef JOINT3_DIR
						#define AXIS		0
						#define JOINT		JOINT3
						#define CURRENT		Inner_Angle * JOINT3_DIR
						#define PREVIOUS	PREV_INNER * JOINT3_DIR
						#include "SMOOTH_ROTATION.h"
					#else
						#define AXIS		0
						#define JOINT		JOINT3
						#define CURRENT		Inner_Angle
						#define PREVIOUS	PREV_INNER
						#include "SMOOTH_ROTATION.h"
					#endif
				#endif
				
				#ifdef JOINT4
					#ifdef JOINT4_DIR
						#define AXIS		0
						#define JOINT		JOINT4
						#define CURRENT		Inner_Angle * JOINT4_DIR
						#define PREVIOUS	PREV_INNER * JOINT4_DIR
						#include "SMOOTH_ROTATION.h"
					#else
						#define AXIS		0
						#define JOINT		JOINT4
						#define CURRENT		Inner_Angle
						#define PREVIOUS	PREV_INNER
						#include "SMOOTH_ROTATION.h"
					#endif
				#endif

				#ifdef JOINT5
					#ifdef JOINT5_DIR
						#define AXIS		0
						#define JOINT		JOINT5
						#define CURRENT		Inner_Angle * JOINT5_DIR
						#define PREVIOUS	PREV_INNER * JOINT5_DIR
						#include "SMOOTH_ROTATION.h"
					#else
						#define AXIS		0
						#define JOINT		JOINT5
						#define CURRENT		Inner_Angle
						#define PREVIOUS	PREV_INNER
						#include "SMOOTH_ROTATION.h"
					#endif
				#endif

				#ifdef JOINT6
					#ifdef JOINT6_DIR
						#define AXIS		0
						#define JOINT		JOINT6
						#define CURRENT		Inner_Angle * JOINT6_DIR
						#define PREVIOUS	PREV_INNER * JOINT6_DIR
						#include "SMOOTH_ROTATION.h"
					#else
						#define AXIS		0
						#define JOINT		JOINT6
						#define CURRENT		Inner_Angle
						#define PREVIOUS	PREV_INNER
						#include "SMOOTH_ROTATION.h"
					#endif
				#endif

				#ifdef JOINT7
					#ifdef JOINT7_DIR
						#define AXIS		0
						#define JOINT		JOINT7
						#define CURRENT		Inner_Angle * JOINT7_DIR
						#define PREVIOUS	PREV_INNER * JOINT7_DIR
						#include "SMOOTH_ROTATION.h"
					#else
						#define AXIS		0
						#define JOINT		JOINT7
						#define CURRENT		Inner_Angle
						#define PREVIOUS	PREV_INNER
						#include "SMOOTH_ROTATION.h"
					#endif
				#endif

				#ifdef JOINT8
					#ifdef JOINT8_DIR
						#define AXIS		0
						#define JOINT		JOINT8
						#define CURRENT		Inner_Angle * JOINT8_DIR
						#define PREVIOUS	PREV_INNER * JOINT8_DIR
						#include "SMOOTH_ROTATION.h"
					#else
						#define AXIS		0
						#define JOINT		JOINT8
						#define CURRENT		Inner_Angle
						#define PREVIOUS	PREV_INNER
						#include "SMOOTH_ROTATION.h"
					#endif
				#endif

				#ifdef JOINT9
					#ifdef JOINT9_DIR
						#define AXIS		0
						#define JOINT		JOINT9
						#define CURRENT		Inner_Angle * JOINT9_DIR
						#define PREVIOUS	PREV_INNER * JOINT9_DIR
						#include "SMOOTH_ROTATION.h"
					#else
						#define AXIS		0
						#define JOINT		JOINT9
						#define CURRENT		Inner_Angle
						#define PREVIOUS	PREV_INNER
						#include "SMOOTH_ROTATION.h"
					#endif
				#endif

				#ifdef JOINT10
					#ifdef JOINT10_DIR
						#define AXIS		0
						#define JOINT		JOINT10
						#define CURRENT		Inner_Angle * JOINT10_DIR
						#define PREVIOUS	PREV_INNER * JOINT10_DIR
						#include "SMOOTH_ROTATION.h"
					#else
						#define AXIS		0
						#define JOINT		JOINT10
						#define CURRENT		Inner_Angle
						#define PREVIOUS	PREV_INNER
						#include "SMOOTH_ROTATION.h"
					#endif
				#endif

				#ifdef JOINT11
					#ifdef JOINT11_DIR
						#define AXIS		0
						#define JOINT		JOINT11
						#define CURRENT		Inner_Angle * JOINT11_DIR
						#define PREVIOUS	PREV_INNER * JOINT11_DIR
						#include "SMOOTH_ROTATION.h"
					#else
						#define AXIS		0
						#define JOINT		JOINT11
						#define CURRENT		Inner_Angle
						#define PREVIOUS	PREV_INNER
						#include "SMOOTH_ROTATION.h"
					#endif
				#endif

				#ifdef JOINT12
					#ifdef JOINT12_DIR
						#define AXIS		0
						#define JOINT		JOINT12
						#define CURRENT		Inner_Angle * JOINT4_DIR
						#define PREVIOUS	PREV_INNER * JOINT4_DIR
						#include "SMOOTH_ROTATION.h"
					#else
						#define AXIS		0
						#define JOINT		JOINT12
						#define CURRENT		Inner_Angle
						#define PREVIOUS	PREV_INNER
						#include "SMOOTH_ROTATION.h"
					#endif
				#endif

				#ifdef JOINT13
					#ifdef JOINT13_DIR
						#define AXIS		0
						#define JOINT		JOINT13
						#define CURRENT		Inner_Angle * JOINT13_DIR
						#define PREVIOUS	PREV_INNER * JOINT13_DIR
						#include "SMOOTH_ROTATION.h"
					#else
						#define AXIS		0
						#define JOINT		JOINT13
						#define CURRENT		Inner_Angle
						#define PREVIOUS	PREV_INNER
						#include "SMOOTH_ROTATION.h"
					#endif
				#endif

				#ifdef JOINT14
					#ifdef JOINT14_DIR
						#define AXIS		0
						#define JOINT		JOINT14
						#define CURRENT		Inner_Angle * JOINT14_DIR
						#define PREVIOUS	PREV_INNER * JOINT14_DIR
						#include "SMOOTH_ROTATION.h"
					#else
						#define AXIS		0
						#define JOINT		JOINT14
						#define CURRENT		Inner_Angle
						#define PREVIOUS	PREV_INNER
						#include "SMOOTH_ROTATION.h"
					#endif
				#endif

				#ifdef JOINT15
					#ifdef JOINT15_DIR
						#define AXIS		0
						#define JOINT		JOINT15
						#define CURRENT		Inner_Angle * JOINT15_DIR
						#define PREVIOUS	PREV_INNER * JOINT15_DIR
						#include "SMOOTH_ROTATION.h"
					#else
						#define AXIS		0
						#define JOINT		JOINT15
						#define CURRENT		Inner_Angle
						#define PREVIOUS	PREV_INNER
						#include "SMOOTH_ROTATION.h"
					#endif
				#endif

				#ifdef JOINT16
					#ifdef JOINT16_DIR
						#define AXIS		0
						#define JOINT		JOINT16
						#define CURRENT		Inner_Angle * JOINT16_DIR
						#define PREVIOUS	PREV_INNER * JOINT16_DIR
						#include "SMOOTH_ROTATION.h"
					#else
						#define AXIS		0
						#define JOINT		JOINT16
						#define CURRENT		Inner_Angle
						#define PREVIOUS	PREV_INNER
						#include "SMOOTH_ROTATION.h"
					#endif
				#endif

				#ifdef JOINT17
					#ifdef JOINT17_DIR
						#define AXIS		0
						#define JOINT		JOINT17
						#define CURRENT		Inner_Angle * JOINT17_DIR
						#define PREVIOUS	PREV_INNER * JOINT17_DIR
						#include "SMOOTH_ROTATION.h"
					#else
						#define AXIS		0
						#define JOINT		JOINT17
						#define CURRENT		Inner_Angle
						#define PREVIOUS	PREV_INNER
						#include "SMOOTH_ROTATION.h"
					#endif
				#endif

				#ifdef JOINT18
					#ifdef JOINT18_DIR
						#define AXIS		0
						#define JOINT		JOINT18
						#define CURRENT		Inner_Angle * JOINT18_DIR
						#define PREVIOUS	PREV_INNER * JOINT18_DIR
						#include "SMOOTH_ROTATION.h"
					#else
						#define AXIS		0
						#define JOINT		JOINT18
						#define CURRENT		Inner_Angle
						#define PREVIOUS	PREV_INNER
						#include "SMOOTH_ROTATION.h"
					#endif
				#endif
			#endif

			PREV_INNER = Inner_Angle;
		}
		else
		{
			#ifdef JOINT2
				#ifdef JOINT2_DIR
					turn JOINT2 to x-axis (PREV_INNER * JOINT2_DIR) now;
				#else
					turn JOINT2 to x-axis (PREV_INNER) now;
				#endif
			#endif
			#ifdef JOINT3
				#ifdef JOINT3_DIR
					turn JOINT3 to x-axis (PREV_INNER * JOINT3_DIR) now;
				#else
					turn JOINT3 to x-axis (PREV_INNER) now;
				#endif
			#endif
			#ifdef JOINT4
				#ifdef JOINT4_DIR
					turn JOINT4 to x-axis (PREV_INNER * JOINT4_DIR) now;
				#else
					turn JOINT4 to x-axis (PREV_INNER) now;
				#endif
			#endif
			#ifdef JOINT5
				#ifdef JOINT5_DIR
					turn JOINT5 to x-axis (PREV_INNER * JOINT5_DIR) now;
				#else
					turn JOINT5 to x-axis (PREV_INNER) now;
				#endif
			#endif
			#ifdef JOINT6
				#ifdef JOINT6_DIR
					turn JOINT6 to x-axis (PREV_INNER * JOINT6_DIR) now;
				#else
					turn JOINT6 to x-axis (PREV_INNER) now;
				#endif
			#endif
			#ifdef JOINT7
				#ifdef JOINT7_DIR
					turn JOINT7 to x-axis (PREV_INNER * JOINT7_DIR) now;
				#else
					turn JOINT7 to x-axis (PREV_INNER) now;
				#endif
			#endif
			#ifdef JOINT8
				#ifdef JOINT8_DIR
					turn JOINT8 to x-axis (PREV_INNER * JOINT8_DIR) now;
				#else
					turn JOINT8 to x-axis (PREV_INNER) now;
				#endif
			#endif
			#ifdef JOINT9
				#ifdef JOINT9_DIR
					turn JOINT9 to x-axis (PREV_INNER * JOINT9_DIR) now;
				#else
					turn JOINT9 to x-axis (PREV_INNER) now;
				#endif
			#endif
			#ifdef JOINT10
				#ifdef JOINT10_DIR
					turn JOINT10 to x-axis (PREV_INNER * JOINT10_DIR) now;
				#else
					turn JOINT10 to x-axis (PREV_INNER) now;
				#endif
			#endif
			#ifdef JOINT11
				#ifdef JOINT11_DIR
					turn JOINT11 to x-axis (PREV_INNER * JOINT11_DIR) now;
				#else
					turn JOINT11 to x-axis (PREV_INNER) now;
				#endif
			#endif
			#ifdef JOINT12
				#ifdef JOINT12_DIR
					turn JOINT12 to x-axis (PREV_INNER * JOINT12_DIR) now;
				#else
					turn JOINT12 to x-axis (PREV_INNER) now;
				#endif
			#endif
			#ifdef JOINT13
				#ifdef JOINT13_DIR
					turn JOINT13 to x-axis (PREV_INNER * JOINT13_DIR) now;
				#else
					turn JOINT13 to x-axis (PREV_INNER) now;
				#endif
			#endif
			#ifdef JOINT14
				#ifdef JOINT14_DIR
					turn JOINT14 to x-axis (PREV_INNER * JOINT14_DIR) now;
				#else
					turn JOINT14 to x-axis (PREV_INNER) now;
				#endif
			#endif
			#ifdef JOINT15
				#ifdef JOINT15_DIR
					turn JOINT15 to x-axis (PREV_INNER * JOINT15_DIR) now;
				#else
					turn JOINT15 to x-axis (PREV_INNER) now;
				#endif
			#endif
			#ifdef JOINT16
				#ifdef JOINT16_DIR
					turn JOINT16 to x-axis (PREV_INNER * JOINT16_DIR) now;
				#else
					turn JOINT16 to x-axis (PREV_INNER) now;
				#endif
			#endif
			#ifdef JOINT17
				#ifdef JOINT17_DIR
					turn JOINT17 to x-axis (PREV_INNER * JOINT17_DIR) now;
				#else
					turn JOINT17 to x-axis (PREV_INNER) now;
				#endif
			#endif
			#ifdef JOINT18
				#ifdef JOINT18_DIR
					turn JOINT18 to x-axis (PREV_INNER * JOINT18_DIR) now;
				#else
					turn JOINT18 to x-axis (PREV_INNER) now;
				#endif
			#endif
		}
	#endif

	#ifdef PREV_XANGLE
		if((Xangle > (PREV_XANGLE + TOLERANCE)) OR (Xangle < (PREV_XANGLE - TOLERANCE)))
		{
			#if SMOOTH_ANIM == TRUE
				//Turn JOINT1 to the previous angle on the X axis, then move smoothly
				#define AXIS		0
				#define JOINT		JOINT1
				#define CURRENT		Xangle
				#define PREVIOUS	PREV_XANGLE
				#include "SMOOTH_ROTATION.h"
			#endif

			PREV_XANGLE = Xangle;
		}
		else
		{
			turn JOINT1 to x-axis (PREV_XANGLE) now;
		}
	#endif


	//Undefine the JOINTs and POINTs used by the leg
	#undef JOINT0
	#undef JOINT1
	#undef JOINT2
	#undef JOINT3
	#undef JOINT4
	#undef JOINT5
	#undef JOINT6
	#undef JOINT7
	#undef JOINT8
	#undef JOINT9
	#undef JOINT10
	#undef JOINT11
	#undef JOINT12
	#undef JOINT13
	#undef JOINT14
	#undef JOINT15
	#undef JOINT16
	#undef JOINT17
	#undef JOINT18
	#undef POINT
	#undef END
	#undef PREV_ANGLE
	#undef PREV_XANGLE
	#undef PREV_INNER



//***** Additional Credit Details *****

//Zwzsg -	Created the origional dichotomia script which this converter is based on.			
//			Discovered a better way of passing variables from a script into a macro by seperating
//			the macro into a distinct .h file and including it at the relevant point.
//			He also created the Prodder script which allows for a leg to join two points together.