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

 class MrEmodMenuWindowFrame expands UWindowFramedWindow;

 // INI variables
 var() config int Xpos;
 var() config int Ypos;
 var() config int Wpos;
 var() config int Hpos;

 function created()
 {
 	super.created();

 	bLeaveOnScreen = true;
 	bStatusBar = true;

 	bSizable = True;
 	bMoving = true;

 	MinWinWidth = 200;
 	MinWinHeight = 100;

 	SetSizePos();

 	WindowTitle = "MrEHasher";
 }

 function ResolutionChanged(float W, float H)
 {
	SetSizePos();
	Super.ResolutionChanged(W, H);
 }

 function SetSizePos()
 {
 	CheckXY();

 	if (WPos > 0 && HPos > 0)
 	{
 		SetSize(WPos, HPos);
 	}
 	else
 	{
 		SetSize(WinWidth, WinHeight);
 	}

 	WinLeft = ((Root.WinWidth  - WinWidth)  / 100) * (Xpos);
 	WinTop  = ((Root.WinHeight - WinHeight) / 100) * (Ypos);
 }

 function Resized()
 {
 	if (ClientArea == None)
 	{
 		return;
 	}

 	if (!bLeaveOnscreen) // hackish way for detect first resize
 		SetSizePos();

 	Super.Resized();
 }

 function CheckXY()
 {
 	if (Xpos < 0 || Xpos > 99)
 	{
 		Xpos = 50;
 	}

 	if (Ypos < 0 || Ypos > 99)
 	{
 		Ypos = 60;
 	}
 }

 function Tick(float DeltaTime)
 {
 	local int x, y;

 	WPos = WinWidth;
 	HPos = WinHeight;

 	x = self.WinLeft / ((Root.WinWidth - WinWidth) / 100);
 	y = self.WinTop / ((Root.WinHeight - WinHeight) / 100);

 	if (Xpos != x || Ypos != y)
 	{
 		Xpos = x;
 		Ypos = y;
 	}

 	Super.Tick(DeltaTime);
 }


 function Close(optional bool bByParent)
 {
 	CheckXY();
 	SaveConfig();
 	Super.Close(bByParent);
 }


 defaultproperties
 {
 	XPos=50
 	YPos=50
 	ClientClass=Class'MrEHashWindow'
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
