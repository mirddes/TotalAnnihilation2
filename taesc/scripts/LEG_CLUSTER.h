/***** ZbotAPI - Animation - Component of the Zbot API *****/

//Version - 1.0
//Created By - Zodius


/***** To use the ZbotAPI - Animation *****/

//Place the following at the point where the converters action is required:
//#include "ZbotAPI_Animation.h"

/***** Start of ZbotAPI *****/

	//If LEG1 is defined
	#ifdef LEG1
		//Includes the script for controlling a Spider Leg - Smooth Movement
		#ifdef LEG1_JOINT0
			#define JOINT0		LEG1_JOINT0
		#endif

		//JOINT1 is required
		#define JOINT1		LEG1_JOINT1
		
		#ifdef LEG1_JOINT2
			#define JOINT2		LEG1_JOINT2
		#endif
		#ifdef LEG1_JOINT3
			#define JOINT3		LEG1_JOINT3
		#endif
		#ifdef LEG1_JOINT4
			#define JOINT4		LEG1_JOINT4
		#endif
		#ifdef LEG1_JOINT5
			#define JOINT5		LEG1_JOINT5
		#endif
		#ifdef LEG1_JOINT6
			#define JOINT6		LEG1_JOINT6
		#endif
		#ifdef LEG1_JOINT7
			#define JOINT7		LEG1_JOINT7
		#endif
		#ifdef LEG1_JOINT8
			#define JOINT8		LEG1_JOINT8
		#endif
		#ifdef LEG1_JOINT9
			#define JOINT9		LEG1_JOINT9
		#endif
		#ifdef LEG1_JOINT10
			#define JOINT10		LEG1_JOINT10
		#endif
		#ifdef LEG1_JOINT11
			#define JOINT11		LEG1_JOINT11
		#endif
		#ifdef LEG1_JOINT12
			#define JOINT12		LEG1_JOINT12
		#endif
		#ifdef LEG1_JOINT13
			#define JOINT13		LEG1_JOINT13
		#endif
		#ifdef LEG1_JOINT14
			#define JOINT14		LEG1_JOINT14
		#endif
		#ifdef LEG1_JOINT15
			#define JOINT15		LEG1_JOINT15
		#endif
		#ifdef LEG1_JOINT16
			#define JOINT16		LEG1_JOINT16
		#endif
		#ifdef LEG1_JOINT17
			#define JOINT17		LEG1_JOINT17
		#endif
		#ifdef LEG1_JOINT18
			#define JOINT18		LEG1_JOINT18
		#endif
		#define POINT		STRIDE_POINT1
		#define END			LEG1_END

		#if INITIALISE == FALSE
			#define PREV_ANGLE	Prev_Angle1
			#define PREV_XANGLE	Prev_Xangle1
			#define PREV_INNER	Prev_Inner1
		#endif
		#include "SPIDER_LEG.h"
		#if	INITIALISE == TRUE
			Prev_Angle1 = Angle;
			Prev_Xangle1 = Xangle;
			Prev_Inner1 = Inner_Angle;
		#endif
	#endif
	
	//If LEG2 is defined
	#ifdef LEG2
		//Includes the script for controlling a Spider Leg - Smooth Movement
		#ifdef LEG2_JOINT0
			#define JOINT0		LEG2_JOINT0
		#endif

		//JOINT1 is required
		#define JOINT1		LEG2_JOINT1
		
		#ifdef LEG2_JOINT2
			#define JOINT2		LEG2_JOINT2
		#endif
		#ifdef LEG2_JOINT3
			#define JOINT3		LEG2_JOINT3
		#endif
		#ifdef LEG2_JOINT4
			#define JOINT4		LEG2_JOINT4
		#endif
		#ifdef LEG2_JOINT5
			#define JOINT5		LEG2_JOINT5
		#endif
		#ifdef LEG2_JOINT6
			#define JOINT6		LEG2_JOINT6
		#endif
		#ifdef LEG2_JOINT7
			#define JOINT7		LEG2_JOINT7
		#endif
		#ifdef LEG2_JOINT8
			#define JOINT8		LEG2_JOINT8
		#endif
		#ifdef LEG2_JOINT9
			#define JOINT9		LEG2_JOINT9
		#endif
		#ifdef LEG2_JOINT10
			#define JOINT10		LEG2_JOINT10
		#endif
		#ifdef LEG2_JOINT11
			#define JOINT11		LEG2_JOINT11
		#endif
		#ifdef LEG2_JOINT12
			#define JOINT12		LEG2_JOINT12
		#endif
		#ifdef LEG2_JOINT13
			#define JOINT13		LEG2_JOINT13
		#endif
		#ifdef LEG2_JOINT14
			#define JOINT14		LEG2_JOINT14
		#endif
		#ifdef LEG2_JOINT15
			#define JOINT15		LEG2_JOINT15
		#endif
		#ifdef LEG2_JOINT16
			#define JOINT16		LEG2_JOINT16
		#endif
		#ifdef LEG2_JOINT17
			#define JOINT17		LEG2_JOINT17
		#endif
		#ifdef LEG2_JOINT18
			#define JOINT18		LEG2_JOINT18
		#endif
		#define POINT		STRIDE_POINT2
		#define END			LEG2_END

		#if INITIALISE == FALSE
			#define PREV_ANGLE	Prev_Angle2
			#define PREV_XANGLE	Prev_Xangle2
			#define PREV_INNER	Prev_Inner2
		#endif
		#include "SPIDER_LEG.h"
		#if	INITIALISE == TRUE
			Prev_Angle2 = Angle;
			Prev_Xangle2 = Xangle;
			Prev_Inner2 = Inner_Angle;
		#endif
	#endif
	
	//If LEG3 is defined
	#ifdef LEG3
		//Includes the script for controlling a Spider Leg - Smooth Movement
		#ifdef LEG3_JOINT0
			#define JOINT0		LEG3_JOINT0
		#endif

		//JOINT1 is required
		#define JOINT1		LEG3_JOINT1
		
		#ifdef LEG3_JOINT2
			#define JOINT2		LEG3_JOINT2
		#endif
		#ifdef LEG3_JOINT3
			#define JOINT3		LEG3_JOINT3
		#endif
		#ifdef LEG3_JOINT4
			#define JOINT4		LEG3_JOINT4
		#endif
		#ifdef LEG3_JOINT5
			#define JOINT5		LEG3_JOINT5
		#endif
		#ifdef LEG3_JOINT6
			#define JOINT6		LEG3_JOINT6
		#endif
		#ifdef LEG3_JOINT7
			#define JOINT7		LEG3_JOINT7
		#endif
		#ifdef LEG3_JOINT8
			#define JOINT8		LEG3_JOINT8
		#endif
		#ifdef LEG3_JOINT9
			#define JOINT9		LEG3_JOINT9
		#endif
		#ifdef LEG3_JOINT10
			#define JOINT10		LEG3_JOINT10
		#endif
		#ifdef LEG3_JOINT11
			#define JOINT11		LEG3_JOINT11
		#endif
		#ifdef LEG3_JOINT12
			#define JOINT12		LEG3_JOINT12
		#endif
		#ifdef LEG3_JOINT13
			#define JOINT13		LEG3_JOINT13
		#endif
		#ifdef LEG3_JOINT14
			#define JOINT14		LEG3_JOINT14
		#endif
		#ifdef LEG3_JOINT15
			#define JOINT15		LEG3_JOINT15
		#endif
		#ifdef LEG3_JOINT16
			#define JOINT16		LEG3_JOINT16
		#endif
		#ifdef LEG3_JOINT17
			#define JOINT17		LEG3_JOINT17
		#endif
		#ifdef LEG3_JOINT18
			#define JOINT18		LEG3_JOINT18
		#endif
		#define POINT		STRIDE_POINT3
		#define END			LEG3_END

		#if INITIALISE == FALSE
			#define PREV_ANGLE	Prev_Angle3
			#define PREV_XANGLE	Prev_Xangle3
			#define PREV_INNER	Prev_Inner3
		#endif
		#include "SPIDER_LEG.h"
		#if	INITIALISE == TRUE
			Prev_Angle3 = Angle;
			Prev_Xangle3 = Xangle;
			Prev_Inner3 = Inner_Angle;
		#endif
	#endif

	//If LEG4 is defined
	#ifdef LEG4
		//Includes the script for controlling a Spider Leg - Smooth Movement
		#ifdef LEG4_JOINT0
			#define JOINT0		LEG4_JOINT0
		#endif

		//JOINT1 is required
		#define JOINT1		LEG4_JOINT1
		
		#ifdef LEG4_JOINT2
			#define JOINT2		LEG4_JOINT2
		#endif
		#ifdef LEG4_JOINT3
			#define JOINT3		LEG4_JOINT3
		#endif
		#ifdef LEG4_JOINT4
			#define JOINT4		LEG4_JOINT4
		#endif
		#ifdef LEG4_JOINT5
			#define JOINT5		LEG4_JOINT5
		#endif
		#ifdef LEG4_JOINT6
			#define JOINT6		LEG4_JOINT6
		#endif
		#ifdef LEG4_JOINT7
			#define JOINT7		LEG4_JOINT7
		#endif
		#ifdef LEG4_JOINT8
			#define JOINT8		LEG4_JOINT8
		#endif
		#ifdef LEG4_JOINT9
			#define JOINT9		LEG4_JOINT9
		#endif
		#ifdef LEG4_JOINT10
			#define JOINT10		LEG4_JOINT10
		#endif
		#ifdef LEG4_JOINT11
			#define JOINT11		LEG4_JOINT11
		#endif
		#ifdef LEG4_JOINT12
			#define JOINT12		LEG4_JOINT12
		#endif
		#ifdef LEG4_JOINT13
			#define JOINT13		LEG4_JOINT13
		#endif
		#ifdef LEG4_JOINT14
			#define JOINT14		LEG4_JOINT14
		#endif
		#ifdef LEG4_JOINT15
			#define JOINT15		LEG4_JOINT15
		#endif
		#ifdef LEG4_JOINT16
			#define JOINT16		LEG4_JOINT16
		#endif
		#ifdef LEG4_JOINT17
			#define JOINT17		LEG4_JOINT17
		#endif
		#ifdef LEG4_JOINT18
			#define JOINT18		LEG4_JOINT18
		#endif
		#define POINT		STRIDE_POINT4
		#define END			LEG4_END

		#if INITIALISE == FALSE
			#define PREV_ANGLE	Prev_Angle4
			#define PREV_XANGLE	Prev_Xangle4
			#define PREV_INNER	Prev_Inner4
		#endif
		#include "SPIDER_LEG.h"
		#if	INITIALISE == TRUE
			Prev_Angle4 = Angle;
			Prev_Xangle4 = Xangle;
			Prev_Inner4 = Inner_Angle;
		#endif
	#endif
	
	//If LEG5 is defined
	#ifdef LEG5
		//Includes the script for controlling a Spider Leg - Smooth Movement
		#ifdef LEG5_JOINT0
			#define JOINT0		LEG5_JOINT0
		#endif

		//JOINT1 is required
		#define JOINT1		LEG5_JOINT1
		
		#ifdef LEG5_JOINT2
			#define JOINT2		LEG5_JOINT2
		#endif
		#ifdef LEG5_JOINT3
			#define JOINT3		LEG5_JOINT3
		#endif
		#ifdef LEG5_JOINT4
			#define JOINT4		LEG5_JOINT4
		#endif
		#ifdef LEG5_JOINT5
			#define JOINT5		LEG5_JOINT5
		#endif
		#ifdef LEG5_JOINT6
			#define JOINT6		LEG5_JOINT6
		#endif
		#ifdef LEG5_JOINT7
			#define JOINT7		LEG5_JOINT7
		#endif
		#ifdef LEG5_JOINT8
			#define JOINT8		LEG5_JOINT8
		#endif
		#ifdef LEG5_JOINT9
			#define JOINT9		LEG5_JOINT9
		#endif
		#ifdef LEG5_JOINT10
			#define JOINT10		LEG5_JOINT10
		#endif
		#ifdef LEG5_JOINT11
			#define JOINT11		LEG5_JOINT11
		#endif
		#ifdef LEG5_JOINT12
			#define JOINT12		LEG5_JOINT12
		#endif
		#ifdef LEG5_JOINT13
			#define JOINT13		LEG5_JOINT13
		#endif
		#ifdef LEG5_JOINT14
			#define JOINT14		LEG5_JOINT14
		#endif
		#ifdef LEG5_JOINT15
			#define JOINT15		LEG5_JOINT15
		#endif
		#ifdef LEG5_JOINT16
			#define JOINT16		LEG5_JOINT16
		#endif
		#ifdef LEG5_JOINT17
			#define JOINT17		LEG5_JOINT17
		#endif
		#ifdef LEG5_JOINT18
			#define JOINT18		LEG5_JOINT18
		#endif
		#define POINT		STRIDE_POINT5
		#define END			LEG5_END

		#if INITIALISE == FALSE
			#define PREV_ANGLE	Prev_Angle5
			#define PREV_XANGLE	Prev_Xangle5
			#define PREV_INNER	Prev_Inner5
		#endif
		#include "SPIDER_LEG.h"
		#if	INITIALISE == TRUE
			Prev_Angle5 = Angle;
			Prev_Xangle5 = Xangle;
			Prev_Inner5 = Inner_Angle;
		#endif
	#endif
	
	//If LEG6 is defined
	#ifdef LEG6
		//Includes the script for controlling a Spider Leg - Smooth Movement
		#ifdef LEG6_JOINT0
			#define JOINT0		LEG6_JOINT0
		#endif

		//JOINT1 is required
		#define JOINT1		LEG6_JOINT1
		
		#ifdef LEG6_JOINT2
			#define JOINT2		LEG6_JOINT2
		#endif
		#ifdef LEG6_JOINT3
			#define JOINT3		LEG6_JOINT3
		#endif
		#ifdef LEG6_JOINT4
			#define JOINT4		LEG6_JOINT4
		#endif
		#ifdef LEG6_JOINT5
			#define JOINT5		LEG6_JOINT5
		#endif
		#ifdef LEG6_JOINT6
			#define JOINT6		LEG6_JOINT6
		#endif
		#ifdef LEG6_JOINT7
			#define JOINT7		LEG6_JOINT7
		#endif
		#ifdef LEG6_JOINT8
			#define JOINT8		LEG6_JOINT8
		#endif
		#ifdef LEG6_JOINT9
			#define JOINT9		LEG6_JOINT9
		#endif
		#ifdef LEG6_JOINT10
			#define JOINT10		LEG6_JOINT10
		#endif
		#ifdef LEG6_JOINT11
			#define JOINT11		LEG6_JOINT11
		#endif
		#ifdef LEG6_JOINT12
			#define JOINT12		LEG6_JOINT12
		#endif
		#ifdef LEG6_JOINT13
			#define JOINT13		LEG6_JOINT13
		#endif
		#ifdef LEG6_JOINT14
			#define JOINT14		LEG6_JOINT14
		#endif
		#ifdef LEG6_JOINT15
			#define JOINT15		LEG6_JOINT15
		#endif
		#ifdef LEG6_JOINT16
			#define JOINT16		LEG6_JOINT16
		#endif
		#ifdef LEG6_JOINT17
			#define JOINT17		LEG6_JOINT17
		#endif
		#ifdef LEG6_JOINT18
			#define JOINT18		LEG6_JOINT18
		#endif
		#define POINT		STRIDE_POINT6
		#define END			LEG6_END

		#if INITIALISE == FALSE
			#define PREV_ANGLE	Prev_Angle6
			#define PREV_XANGLE	Prev_Xangle6
			#define PREV_INNER	Prev_Inner6
		#endif
		#include "SPIDER_LEG.h"
		#if	INITIALISE == TRUE
			Prev_Angle6 = Angle;
			Prev_Xangle6 = Xangle;
			Prev_Inner6 = Inner_Angle;
		#endif
	#endif
	
	//If LEG7 is defined
	#ifdef LEG7
		//Includes the script for controlling a Spider Leg - Smooth Movement
		#ifdef LEG7_JOINT0
			#define JOINT0		LEG7_JOINT0
		#endif

		//JOINT1 is required
		#define JOINT1		LEG7_JOINT1
		
		#ifdef LEG7_JOINT2
			#define JOINT2		LEG7_JOINT2
		#endif
		#ifdef LEG7_JOINT3
			#define JOINT3		LEG7_JOINT3
		#endif
		#ifdef LEG7_JOINT4
			#define JOINT4		LEG7_JOINT4
		#endif
		#ifdef LEG7_JOINT5
			#define JOINT5		LEG7_JOINT5
		#endif
		#ifdef LEG7_JOINT6
			#define JOINT6		LEG7_JOINT6
		#endif
		#ifdef LEG7_JOINT7
			#define JOINT7		LEG7_JOINT7
		#endif
		#ifdef LEG7_JOINT8
			#define JOINT8		LEG7_JOINT8
		#endif
		#ifdef LEG7_JOINT9
			#define JOINT9		LEG7_JOINT9
		#endif
		#ifdef LEG7_JOINT10
			#define JOINT10		LEG7_JOINT10
		#endif
		#ifdef LEG7_JOINT11
			#define JOINT11		LEG7_JOINT11
		#endif
		#ifdef LEG7_JOINT12
			#define JOINT12		LEG7_JOINT12
		#endif
		#ifdef LEG7_JOINT13
			#define JOINT13		LEG7_JOINT13
		#endif
		#ifdef LEG7_JOINT14
			#define JOINT14		LEG7_JOINT14
		#endif
		#ifdef LEG7_JOINT15
			#define JOINT15		LEG7_JOINT15
		#endif
		#ifdef LEG7_JOINT16
			#define JOINT16		LEG7_JOINT16
		#endif
		#ifdef LEG7_JOINT17
			#define JOINT17		LEG7_JOINT17
		#endif
		#ifdef LEG7_JOINT18
			#define JOINT18		LEG7_JOINT18
		#endif
		#define POINT		STRIDE_POINT7
		#define END			LEG7_END

		#if INITIALISE == FALSE
			#define PREV_ANGLE	Prev_Angle7
			#define PREV_XANGLE	Prev_Xangle7
			#define PREV_INNER	Prev_Inner7
		#endif
		#include "SPIDER_LEG.h"
		#if	INITIALISE == TRUE
			Prev_Angle7 = Angle;
			Prev_Xangle7 = Xangle;
			Prev_Inner7 = Inner_Angle;
		#endif
	#endif
	
	//If LEG8 is defined
	#ifdef LEG8
		//Includes the script for controlling a Spider Leg - Smooth Movement
		#ifdef LEG8_JOINT0
			#define JOINT0		LEG8_JOINT0
		#endif

		//JOINT1 is required
		#define JOINT1		LEG8_JOINT1
		
		#ifdef LEG8_JOINT2
			#define JOINT2		LEG8_JOINT2
		#endif
		#ifdef LEG8_JOINT3
			#define JOINT3		LEG8_JOINT3
		#endif
		#ifdef LEG8_JOINT4
			#define JOINT4		LEG8_JOINT4
		#endif
		#ifdef LEG8_JOINT5
			#define JOINT5		LEG8_JOINT5
		#endif
		#ifdef LEG8_JOINT6
			#define JOINT6		LEG8_JOINT6
		#endif
		#ifdef LEG8_JOINT7
			#define JOINT7		LEG8_JOINT7
		#endif
		#ifdef LEG8_JOINT8
			#define JOINT8		LEG8_JOINT8
		#endif
		#ifdef LEG8_JOINT9
			#define JOINT9		LEG8_JOINT9
		#endif
		#ifdef LEG8_JOINT10
			#define JOINT10		LEG8_JOINT10
		#endif
		#ifdef LEG8_JOINT11
			#define JOINT11		LEG8_JOINT11
		#endif
		#ifdef LEG8_JOINT12
			#define JOINT12		LEG8_JOINT12
		#endif
		#ifdef LEG8_JOINT13
			#define JOINT13		LEG8_JOINT13
		#endif
		#ifdef LEG8_JOINT14
			#define JOINT14		LEG8_JOINT14
		#endif
		#ifdef LEG8_JOINT15
			#define JOINT15		LEG8_JOINT15
		#endif
		#ifdef LEG8_JOINT16
			#define JOINT16		LEG8_JOINT16
		#endif
		#ifdef LEG8_JOINT17
			#define JOINT17		LEG8_JOINT17
		#endif
		#ifdef LEG8_JOINT18
			#define JOINT18		LEG8_JOINT18
		#endif
		#define POINT		STRIDE_POINT8
		#define END			LEG8_END

		#if INITIALISE == FALSE
			#define PREV_ANGLE	Prev_Angle8
			#define PREV_XANGLE	Prev_Xangle8
			#define PREV_INNER	Prev_Inner8
		#endif
		#include "SPIDER_LEG.h"
		#if	INITIALISE == TRUE
			Prev_Angle8 = Angle;
			Prev_Xangle8 = Xangle;
			Prev_Inner8 = Inner_Angle;
		#endif
	#endif

	#undef INITIALISE