/*
 *   --------------------------
 *  |  NPInfo.uc
 *   --------------------------
 *   This file is part of MrEHasher for UT99.
 *
 *   MrEHasher is free software: you can redistribute and/or modify
 *   it under the terms of the Open Unreal Mod License version 1.1.
 *
 *   MrEHasher is distributed in the hope and belief that it will be useful,
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 *
 *   You should have received a copy of the Open Unreal Mod License
 *   along with MrEHasher.  If not, see
 *   <https://beyondunrealwiki.github.io/pages/openunrealmodlicense.html>.
 *
 *   Timeline:
 *   January, 2023: Development begins
 *
 *   Relevant thread:
 *   https://ut99.org/viewtopic.php?f=15&t=4172
 */

 class NPInfo extends Actor;

 var string ModName;
 var string ModDLLName;
 var string ModSOName;
 var string ModDLLLoaderName;
 var string ModSOLoaderName;
 var string ModPkgDescriptor;
 var string ModLicense;
 var string ModAuthor;
 var string ModDesc;
 var string ModDLLURL;
 var string ModSOURL;
 var string ConflictingClasses;
 var string ConflictingActors;
 var string ConflictingPackages;
 var string RequiredActors;
 var string RequiredPackages;

 function PostBeginPlay ()
 {
 	ModName = "MrEHasher";
 	ModDLLName = "MrEHasher.dll";
 	ModDLLLoaderName = "MrEHasherdll.u";
 	ModPkgDescriptor = "Mod to hash your Turing Machine electronics";
 	ModLicense = "";
 	ModAuthor = "The_Cowboy";
 	ModDesc = "An electronics-items' hashing utility";
 	ModDLLURL = "not yet";
 	ConflictingClasses = "";
 	RequiredActors = "";
 	RequiredPackages = "MrEHasher,MrEHasherdll";
 }

 function string GetItemName (string FullName)
 {
 	switch (Caps(FullName))
 	{
 		case "GETMODNAME":
 			return ModName;
 		case "GETMODDLLNAME":
 			return ModDLLName;
 		case "GETMODDLLLOADERNAME":
 			return ModDLLLoaderName;
 		case "GETMODAUTHOR":
 			return ModAuthor;
 		case "GETMODDESC":
 			return ModDesc;
 		case "GETMODDLLURL":
 			return ModDLLURL;
 		case "GETMODSONAME":
 			return ModSOName;
 		case "GETMODSOLOADERNAME":
 			return ModSOLoaderName;
 		case "GETMODSOURL":
 			return ModSOURL;
 		case "GETMODPKGDESC":
 			return ModPkgDescriptor;
 		case "GETMODLICENSECLASS":
 			return ModLicense;
 		case "GETCONFLICTINGCLASSES":
 			return ConflictingClasses;
 		case "GETCONFLICTINGACTORS":
 			return ConflictingActors;
 		case "GETCONFLICTINGPACKAGES":
 			return ConflictingPackages;
 		case "GETREQUIREDACTORS":
 			return RequiredActors;
 		case "GETREQUIREDPACKAGES":
 			return RequiredPackages;
 	}
 	return "";
 }

 defaultproperties
 {
  bHidden=true
 }

/*
 *		                                  /\
 *		                                 / /
 *		                              /\| |
 *		                              | | |/\
 *		                              | | / /
 *		                              | `  /
 *		                              `\  (___
 *		                             _.->  ,-.-.
 *		                          _.'      |  \ \
 *		                         /    _____| 0 |0\
 *		                        |    /`    `^-.\.-'`-._
 *		                        |   |                  `-._
 *		                        |   :                      `.
 *		                        \    `._     `-.__         O.'
 *		 _.--,                   \     `._     __.^--._O_..-'
 *		`---, `.                  `\     /` ` `
 *		     `\ `,                  `\   |
 *		      |   :                   ;  |
 *		      /    `.              ___|__|___
 *		     /       `.           (          )
 *		    /    `---.:____...---' `--------`.
 *		   /        (         `.      __      `.
 *		  |          `---------' _   /  \       \
 *		  |    .-.      _._     (_)  `--'        \
 *		  |   (   )    /   \                       \
 *		   \   `-'     \   /                       ;-._
 *		    \           `-'           \           .'   `.
 *		    /`.                  `\    `\     _.-'`-.    `.___
 *		   |   `-._                `\    `\.-'       `-.   ,--`
 *		    \      `--.___        ___`\    \           ||^\\
 *		     `._        | ``----''     `.   `\         `'  `
 *		        `--;     \  jgs          `.   `.
 *		           //^||^\\               //^||^\\
 *		           '  `'  `               '   '  `
 */
