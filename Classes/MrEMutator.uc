/*
 *   --------------------------
 *  |  MrEmodMenuWindowFrame.uc
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

 var MrEActor MyHasher;

 function PostBeginPlay()
 {
 	Log("+----------------------------");

 	Log("| Loaded MrEHasher!!");
 	Log("+----------------------------");

 	super.PostBeginPlay();
 }


 function Mutate(string MutateString, PlayerPawn Sender)
 {
 	if(MutateString ~= "showehash")
 	{
 		if(MyHasher == none)
 		{
 			MyHasher = Spawn(class'MrEActor', self);
 			MyHasher.Mut = self;
 		}

 		MyHasher.ReportInformation();

 		// We are destroying the actor because if active the next client connection
 		// crashes with bind error. Not sure what am I missing, till I find that, this be the hack.  Also consult the readme
 		MyHasher.Destroy();
 	}

 	if ( NextMutator != None )
 	{
 		NextMutator.Mutate(MutateString, Sender);
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
