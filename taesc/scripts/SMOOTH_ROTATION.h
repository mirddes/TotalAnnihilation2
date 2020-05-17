	
//***** Start of SMOOTH ROTATION *****

	//
	#if AXIS == 0
		turn JOINT to x-axis (PREVIOUS) now;
	#else
		#if AXIS == 1
			turn JOINT to y-axis (PREVIOUS) now;
		#else
			#if AXIS == 2
				turn JOINT to z-axis (PREVIOUS) now;
			#endif
		#endif
	#endif
	
	//
	Smooth_Speed = ((CURRENT - PREVIOUS) * 1000) / REFRESH;
	
	//
	while(Smooth_Speed < 0)
	{
		Smooth_Speed = Smooth_Speed + 65536;
	}
	
	//
	while(Smooth_Speed >= 32768)
	{
		Smooth_Speed = Smooth_Speed - 65536;
	}
	
	//
	if(Smooth_Speed < 0)
	{
		Smooth_Speed = 0 - Smooth_Speed;
	}
	
	//	
	#if AXIS == 0
		turn JOINT to x-axis (CURRENT) speed (Smooth_Speed);
	#else
		#if AXIS == 1
			turn JOINT to y-axis (CURRENT) speed (Smooth_Speed);
		#else
			#if AXIS == 2
				turn JOINT to z-axis (CURRENT) speed (Smooth_Speed);
			#endif
		#endif
	#endif
	
	#undef AXIS
	#undef JOINT
	#undef CURRENT
	#undef PREVIOUS