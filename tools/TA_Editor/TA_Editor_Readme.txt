TOTAL ANNIHILATION UNITS AND WEAPONS EDITOR V 1.11 (called TA Editor in this readme)



!Dont forget to make a copy of all your units and weapons files before using the TA Editor!

Table of content ==========================================

1. PURPOSE OF THE TOOL
2. FEATURES
3. INSTALLATION
4. HOW TO USE
5. CHANGELOG
6. AUTHOR


1. PURPOSE OF THE TOOL ====================================

	The TA Editor shall help modders to edit, compare and balance their mods in a better and much more comforatble way than the standard way where you have to open, edit and save each single file by hand.

	
2. FEATURES ===============================================

	+ View all units at the same time and with all weapons they use in two separate data tables

	+ Only the important values are shown to keep a good overview in the tables

	+ Edit and compare unit values like mass cost, maxdamage, velocity, range and rateoffire

	+ Mass value calculations are possible by using addition, substraction or multiplication on all selected cells at once

	+ Detailed filter functions let you filter for Arm, Core, KBots, tanks, air planes, buildings, ships, construction units and their tech levels 
	
	+ Category filters can be disabled to show units even when they belong to third party factions (other than Core or Arm) or have other TEDClasses (total conversion mods might have to use this)

	+ The tool automatically checks for duplicate weapon IDs and tells the user if the weapons have duplicate IDs. Additionally the program tells the user which IDs are still unused so he can fix the files (this has to be done outside the program)

	+ The DPS value is calculated for each weapon 

	+ The HP/Mass value is calculated for each unit (DamageModifier has an impact even if the modifier is not always active)
	
	+ Right click on a selected row opens the specific unit or weapon file and lets you edit all other values you dont see in the TA Editor. Dont forget to read the files again after you have edited them outside the program or data will be overwritten when saving inside the TA Editor. 
	
	+ Set your favorite packing program (for example HPI File Packer) and one click start the packing after you have finished your editing
	
3. INSTALLATION ===========================================

	Simply extract all files into a folder of your choice.

	
4. HOW TO USE =============================================

	!Dont forget to make a copy of all your units and weapons files before using the TA Editor!

	Extract your hpi, gp3 or ufo files which contain your units and weapons files (HPI VIEWER works for me). The extracted file should offer a folder structur with a UNITS and WEAPONS folder inside. The units folder should have .fbi files included and the weapons folder should have .tdf file included. 
	The TA_Editor looks into all folders containing the word "unit" and all folders containg the word "weapon" to get the relevant files.
	Set the folder path in the TA Editor and click on "Read Units Data". The first table should show all units inside the folders containing the word "units" now. Take into account that the filters you have selected affect the result.
	If you want to see the weapons values also click on "Read Weapons Data". The TA Editor shows only the weapons values associated to the shown units and inside a folder containing the word "weapons". 
	You now might edit the values you want by clicking inside the cells. Some values like Names, DPS, side or HP/Mass cant be edited at all.
	If you are done dont forget to SAVE. All changed units and weapons files will be overwritten. The final step is to pack all files back into the original file and put it into your TA folder (u can use HPI PACKER).

	The calculation functions work on all selected cell values if the values are numeric.

	
5. CHANGELOG ==============================================

	1.11

	- some minor UI tweaks
	- option to start the default packing program out of the TA Editor. The path to the packing program will be stored in the TA_Editor.cfg (second line)
	
	1.10
	
	- the show all column checkbox works now like the disable all filters. Unchecking results in showing all columns and disabling all 6 columns checkboxes
	- disabling or enabling ALL level filters results in ignoring level filter completely
	- added category field which is filterable by entering a string field
	- each cell shows the ID (UnitName, Weaponname) as a tooltip 
	- a MessageBox appears when no units or weapons files could be read giving a short instruction what to do 
	- explosion (explodeas and selfdestructas) weapons are shown in the weapons table (maybe this will be an option in the future)
	- ui improvement with headlines for columns, mass editing and filters
	- improved performance of datagrids
	
	1.09
	
	- the tool checks now all folders containing the word "unit" for .fbi files
	- the tool checks now all folders containing the word "weapon" for .tdf files
	- several dozens of new fields will be shown in the units table categorized in 6 different classes like radar, orders or economy - each category represented in a unique color
	- 6 checkboxes to view/hide the relevant columns have been added
	- one checkbox has been added to makes all extra columns visible
	- a new mass calculation function "Set" has been added
	- improvedfeedback for mass calculation (showing how many values could not be edited, have been set to default values if necessary or were successuffly changed)
	
	1.08
	
	- Fixed: if a unit had the word "LEVELX" in the category property the level was only read if it started and ended with a blank (" LEVELX ")
	- Fixed: lines starting with a "/" are ignored now
	- Fixed: Some unit properties were case sensitive
	- if the filters for the race are unchecked third party races are filtered (so if you have a race called "Aliens" just uncheck "Arm" and "Core" checkboxes and you will see them) 
	- "Lvl 3" filter is now called "Lvl3 +" and will filter all units with a level of 3 or higher
	
	1.07

	- added the option to disable the filters so mods that have different sides (not Arm or Core) or have other TEDClasses can use the TA Editor as well. The filter for strings still work, even when 
	- added columns for units:
		RealHP (showing the MaxDamage inlcuding the DamageModifier)
	- added columns for weapons:
		Tolerance
		SprayAngle
		WeaponTimer
		StartVelocity
		WeaponAcceleration
		EdgeEffectiveness
		PitchTolerance
		MinBarrelAngle
		Color
		Color2
	- Fixed: UsedBy column was emptied whenever a weapon value changed 
	- some changes/fixes/refactoring
	
	1.06

	- initial public release

	
6. AUTHOR =================================================

	The author of this program is Pascal Wauer. 
	Using the TA Editor is under your own responsibility. You should always have a backup of your files before editing them.