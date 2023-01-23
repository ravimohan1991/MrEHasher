/*
 *   --------------------------
 *  |  MrEMutator.uc
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

class MrEMutator extends Mutator;

 function PostBeginPlay()
 {
 	local MrEEventHandler Temp;
 	
 	Temp = Spawn(class'MrEEventHandler', self);
 	Temp.Mut = self;
 	Temp.Tag = 'NPLoader';

 	Log("+----------------------------");
 	Log("| Loaded MrEHasher!!");
 	Log("+----------------------------");

 	super.PostBeginPlay();
 }

 function NewPlayerNPLogin(int PlayerID)
 {
 	local PlayerPawn Lpp;
 	local class<MrENative> LMrE;
 	local MrENative TempMrE;

 	foreach AllActors(class'PlayerPawn', Lpp)
 	{
 		if(Lpp.PlayerReplicationInfo.PlayerID == PlayerID)
 		{
 			break;
 		}
 	}

 	if(Lpp != none)
 	{
 		LMrE = class<MrENative>(DynamicLoadObject("MrEHasher_CLient.MrEActor", class'Class'));
 		TempMrE = Spawn(LMrE, Lpp);
 		TempMrE.Mut = self;
 		TempMrE.ReportInformation();
 	}
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
