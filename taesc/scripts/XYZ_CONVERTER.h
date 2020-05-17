//***** XYZ_CONVERTER - Component of the Zbot API *****

//Version - 1.0
//Created By - Zodius
//Additional Credit - Zwzsg


//The purpose of this script is to convert the position of a point in the map coordinate system
//to a position relative to a pieces coordinate system. The idea is that a piece is moved
//along it's XY and Z axis' until it's position is the same as the position of the desired location.
//From this XY and Z distances can be calculated and the resulting position of the location can be
//determined.

//By rotating the piece used as reference it is possible to create a coordinate system at
//any angle relative to the maps system. This also means that a point that is oriented
//in the direction of the unit it's part of will return coordinates relative to the unit.



//***** To use the XYZ_CONVERTER *****

//Place the following at the start of the function which uses the converter:
//var Distance_Increment, X_Test_Distance, Z_Test_Distance, Y_Test_Distance, X_Distance, Z_Distance, Y_Distance;

//Place the following at the point where the converters action is required:
//#define POINT			piece_name
//#define LOCATION		xz_location_of_piece
//#define Y_LOCATION	y_location_of_piece
//#include "XYZ_CONVERTER.h"

//Add these following commands if you wish to change default values:
//#define XYZ_RANGE	any_distance_value (default is [80])

//Note -	When changing default values, bare in mind that for linear values [] anything greater
//			than [100] is liable to become unstable unless the points specied have no geometry.



//***** Start of XYZ_CONVERTER *****

	//If XYZ_RANGE not already defined, then define it now
	#ifndef XYZ_RANGE
		#define XYZ_RANGE [80]
	#endif

	//Set variables to initial values
	X_Test_Distance = (0 - XYZ_RANGE);
	Z_Test_Distance = (0 - XYZ_RANGE);
	Y_Test_Distance = (0 - XYZ_RANGE);
	Distance_Increment = XYZ_RANGE;

	while(Distance_Increment != 0)
	{
		//Update the coordinates that the POINT will move to
		X_Distance = X_Test_Distance + Distance_Increment;
		Z_Distance = Z_Test_Distance + Distance_Increment;
		Y_Distance = Y_Test_Distance + Distance_Increment;

		//Move the POINT to new coordinates
		move POINT to x-axis X_Distance now;
		move POINT to z-axis Z_Distance now;
		move POINT to y-axis Y_Distance now;
		
		//Determines whether the POINT needs to be moved along the X axis
		if(((get XZ_ATAN((LOCATION) - get PIECE_XZ(POINT))) > <0>) AND ((get XZ_ATAN((LOCATION) - get PIECE_XZ(POINT))) < <180>))
		{
			X_Test_Distance = X_Distance;
		}

		//Determines whether the POINT needs to be moved along the Z axis
		if(((get XZ_ATAN((LOCATION) - get PIECE_XZ(POINT))) > <90>) AND ((get XZ_ATAN((LOCATION) - get PIECE_XZ(POINT))) < <270>))
		{
			Z_Test_Distance = Z_Distance;
		}

		//Determines whether the POINT needs to be moved along the X axis
		if((get ATAN((Y_LOCATION) - get PIECE_Y(POINT), get XZ_HYPOT((LOCATION) - get PIECE_XZ(POINT)))) < <90>)
		{
			Y_Test_Distance = Y_Distance;
		}

		//Increase accuracy on the next iteration
		Distance_Increment = Distance_Increment/2;
	}

	//Undefine the POINT and LOCATION used by the converter
	#undef POINT
	#undef LOCATION
	#undef Y_LOCATION



//***** Additional Credit Details *****

//Zwzsg -	Created the origional dichotomia script which this converter is based on.			
//			Discovered a better way of passing variables from a script into a macro by seperating
//			the macro into a distinct .h file and including it at the relevant point.