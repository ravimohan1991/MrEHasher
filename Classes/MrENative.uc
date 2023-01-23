/*
 *   --------------------------
 *  |  MrENative.uc
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
 *
 *   Thanks to Buggie for suggesting interfacing!!
 */

/*******************************************************************************
 * Notes for compiling:
 * 1. For compiling dependent package MrEHasher_Client (with class MrEActor)
 *    set the flags to "class MrENative extends Actor native noexport"
 * 2. For compiling just the MrEHasher package, remove "native noexport" flags
 *
 *******************************************************************************
 */

class MrENative extends Actor;

 var MrEMutator Mut;

/*
 *******************************************************************************
 * One of the beautiful parts of Unreal Engine, the Replication block!
 *
 * We are writing a preamble for how the function calls (in form of RPCs) are to
 * be sent and interpreted for relevant execution over internet.
 *
 * Server function call: *ReportInformation*
 * Since we are spawning the Actor on server, we are authority and hence when
 * server calls ReportInformation, the call must replicate to clinets, which in
 * this case is to gather and report information
 *
 * Client function call: *SendInformationToServer*
 * On clients our Role is less than authority (client didn't spawn the Actor)
 * hence SendInformationToServer called by client, after gathering information,
 * on server for boradcast of the client information
 *
 *******************************************************************************
 */

 replication
 {
 	// Functions the server calls on the client side.
 	reliable if(Role == ROLE_Authority)
 		ReportInformation;

 	// Functions the client calls on the server.
 	reliable if(Role < ROLE_Authority)
 		SendInformationToServer;
 }

 /*
 *******************************************************************************
 * For all practical purposes, we are on Client because Server called the
 * function via RPC as declared in Replication block.
 *
 * Therefore on Client we are calling GetCPUSerialNumber native routine which
 * is basically our own BiosReader code for gauging electronics data.
 *******************************************************************************
 */

 simulated function ReportInformation()
 {

 }

/*
 *******************************************************************************
 * For all practical purposes, we are on Server because of reverse of the
 * comment logic above.
 *
 * So here we broadcast message with replicated variable(s).
 *******************************************************************************
 */

 function SendInformationToServer(string CPUID)
 {
 }


defaultproperties
{
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
