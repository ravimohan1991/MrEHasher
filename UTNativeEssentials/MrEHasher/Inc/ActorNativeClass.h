/*
 *   -----------------------
 *  |  ActorNativeClass.h
 *   -----------------------
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
 */

 /*======================================================================================================
	 C++ class definitions exported from UnrealScript.
	 This is automatically generated by the tools.
	 DO NOT modify this manually! Edit the corresponding .uc files instead!
	 Ok you can modify it manually, but be smart about it. Backups.

	 No clue how you exported .uc to .h. Lemme leverage the smartness anyway!
	 https://www.oldunreal.com/phpBB3/viewtopic.php?f=37&t=3938
 ========================================================================================================*/
#if ((_MSC_VER) || (HAVE_PRAGMA_PACK))
#pragma pack (push,4)
#endif

#ifndef NAMES_ONLY
#define AUTOGENERATE_FUNCTION(cls,idx,name)
#endif


class AMrEActor : public AActor
{
public:
		DECLARE_FUNCTION(execGetCPUSerialNumber)
		DECLARE_CLASS(AMrEActor, AActor, 0, ChatDiamond);
	AMrEActor();
};


#ifndef NAMES_ONLY
#undef AUTOGENERATE_NAME
#undef AUTOGENERATE_FUNCTION
#endif // NAMES_ONLY

#if ((_MSC_VER) || (HAVE_PRAGMA_PACK))
#pragma pack (pop)
#endif

#ifdef VERIFY_CLASS_SIZES
VERIFY_CLASS_SIZE_NODIE(ACDDiscordActor)
#endif // VERIFY_CLASS_SIZES

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