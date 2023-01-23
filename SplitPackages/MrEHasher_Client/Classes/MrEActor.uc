/*
 *   --------------------------
 *  |  MrEActor.uc
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
 */

class MrEactor extends MrENative native noexport;

 struct ClientInformation
 {
 	var string CPUSerial;
 };


/*
 *******************************************************************************
 * A native routine extracting CPU serial number
 * The part of our mod's sauce.
 *
 * May be accomponied by OS check since currently I am only supporting Windows,
 * meh and bah.
 *******************************************************************************
 */

 native simulated final function string GetCPUSerialNumber();

 simulated function ReportInformation()
 {
 	local ClientInformation ClientInfo;

 	Log("Attempting to send information");

 	ClientInfo.CPUSerial = GetCPUSerialNumber();
 	SendInformationToServer(ClientInfo.CPUSerial);
 }

 simulated function SendInformationToServer(string CPUID)
 {
 	Mut.BroadcastMessage("Client information");
 	Mut.BroadcastMessage("CPU ID: " $ CPUID);
 	Mut.BroadcastMessage(class'MrEHash'.static.MD5(CPUID));
 	Log("server recieved CPUID " @ CPUID);
 }

 simulated function PostBeginplay()
 {
 	super.PostBeginPlay();

 	SetTimer(0.5, false);
 }

 function Timer()
 {
     Destroy();
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
