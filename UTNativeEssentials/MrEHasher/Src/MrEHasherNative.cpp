/*
 *   ------------------------
 *  |  MrEhasherNative.cpp
 *   ------------------------
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

#include "MrEHasherNative.h"
#include <regex>

extern "C" {
#include "dmidecode.h"
}


IMPLEMENT_PACKAGE(MrEHasher_Client);

IMPLEMENT_CLASS(AMrENative);

AMrENative::AMrENative()
{
}

IMPLEMENT_CLASS(AMrEActor);

AMrEActor::AMrEActor()
{
	//Super::AActor(); // Call super's constructor.
}

/**********************************************************************************
 * Gets your RAM serial number
 *
 **********************************************************************************
 */

void AMrEActor::execGetCPUSerialNumber(FFrame& Stack, RESULT_DECL)
{
	guard(AMrEActor::execGetCPUSerialNumber);
	//P_GET_STR(S);//Get the first parameter
	//P_GET_INT(I);//and the second
	P_FINISH;//you MUST call this or it will crash.

	//GLog->Logf(TEXT("Hello World! S=%s,I=%i"), *S, I);//Log output and use printf format.
	//You may also use debugf(TEXT("Hello world!")) since it may be easier to remember.

	std::string CPUSn;

	// Catcher rhymes with Hatcher, the Topologist, just for information!
	void* catcher = electronics_spit(ps_processor);

	if (central_processing_unit* pInfo = static_cast<central_processing_unit*>(catcher))
	{
		CPUSn = pInfo->cpuid;
	}
	else
	{
		GLog->Logf(TEXT("Couldn't get the relevant information. Contact the author!!"));
		CPUSn = "Not Available";
	}

	std::wstring WideCPUSn = std::wstring(CPUSn.begin(), CPUSn.end());
	*(FString*)Result = WideCPUSn.c_str();

	unguard;
}
IMPLEMENT_FUNCTION(AMrEActor, -1, execGetCPUSerialNumber);


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