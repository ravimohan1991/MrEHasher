/*
 *   --------------------------
 *  |  MrEHashWindow.uc
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

 class MrEHashWindow expands UWindowDialogClientWindow;

 var MrEActor MyEHasher;

 var string CPUSerial;
 var string CPUMD5Hash;
 var color BlackColor;
 var color PinkColor;


 function Created()
 {
 	Super.Created();

 	WinLeft = int(Root.WinWidth - WinWidth) / 2;
 	WinTop = int(Root.WinHeight - WinHeight) / 2;

 	MyEHasher = Root.GetPlayerOwner().Spawn(class'MrEActor', Root.GetPlayerOwner());

 	CPUSerial = MyEHasher.GetCPUSerialNumber();
 	CPUMD5Hash = class'MrEHash'.static.MD5(CPUSerial);
 }


 function Resized()
 {
 	Super.Resized();
 }


 function Paint(Canvas C, float X, float Y)
 {
 	local float TitleXLength, TitleYLength;

 	Super.Paint(C, X, Y);

 	C.TextSize(CPUSerial, TitleXLength, TitleYLength);
 	C.SetPos((WinWidth * Root.GUIScale) / 2 - TitleXLength / 2, Root.GUIScale * WinHeight / 2 - TitleYLength / 2);

 	C.DrawColor = BlackColor;
 	C.DrawText(CPUSerial);

 	C.TextSize(CPUMD5Hash, TitleXLength, TitleYLength);
 	C.SetPos((WinWidth * Root.GUIScale) / 2 - TitleXLength / 2, Root.GUIScale * WinHeight / 2 + TitleYLength / 2);

 	C.DrawColor = PinkColor;
 	C.DrawText(CPUMD5Hash);
 }


 function Close(optional bool bByParent)
 {
 	Super.Close(bByParent);
 }

 defaultproperties
 {
 	PinkColor=(R=255,G=192,B=203)
 	BlackColor=(R=0,G=0,B=0)
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
