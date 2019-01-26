// Script header for module 'GUIAnimation'

/*****************************/
/******** AGS MODULE: ********/
/******* GUIANIMATION ********/
/*****************************/

/*****************************
Description:

Provides functions for animating GUI backgrounds.
*****************************/

/*****************************
Macros (#define-s):

GUIANIMATION_VERSION     - This defines the current  version  of   the   module
                             As  of  v2.0  this   is   defined   as   a   float

GUIANIMATION_VERSION_200 - This   defines   version   2.0   of    the    module
*****************************/

/*****************************
Functions:

void GUI.LockView(int view)

  Locks the GUI to VIEW so it can be animated. You MUST lock a view prior to
  calling GUI.Animate.
  
  Example: For an example see GUI.Animate.

void GUI.Animate(int loop, int delay, optional RepeatStyle,
 optional BlockingStyle, optional Direction)

  Starts animating the GUI in the specified LOOP of the locked view. You MUST
  call GUI.LockView before calling this function. The rest of the parameters are
  the same as Character.Animate.
  
  Example:
  
    gMygui.LockView(5); // sets the GUI to use view 5
    gMygui.Animate(2, 5, eOnce, eBlock); // animates the GUI (blocking) in loop 2
    gMygui.UnlockView(); // release the GUI back to it's normal graphic

void GUI.UnlockView(optional bool restoreGrapic)

  Unlocks the GUI and stops any running animation. This is the only way to stop
  a repeating (eRepeat) GUI animation. RESTOREGRAPHIC (default true) sets
  whether the GUI's previous BackgroundGraphic property should be restored.
  
  Example: For an example see GUI.Animate.

bool GUI.IsAnimating()

  Returns whether the GUI is currently animating. Note that this ONLY returns
  true DURING the animation so if the RepeatStyle is set to eOnce then after that
  once this won't return true unless you start animating it again. Also if the
  animation is blocking then this will only return true from repeatedly_execute_always.
  
  Example:
  
    if (!gMygui.IsAnimating()) player.Say("The GUI has stopped animating.");

int GUI.GetView()

  Returns the view the GUI is presently locked to (0 for none).
  
  Example:
  
    if (gMygui.GetView() == 5) player.Say("The GUI is using view 5.");

int GUI.GetLoop()

  Returns the loop the GUI is currently using for animation (-1 if not animating).
  
  Example:
  
    if (gMygui.GetLoop() == 2) player.Say("The GUI is using loop 2.");

int GUI.GetFrame()

  Returns the frame the GUI is currently using for animation (-1 if not animating).
  
  Example:
  
    if (gMygui.GetFrame() == 4) player.Say("The GUI is using frame 4.");

ViewFrame* GUI.GetViewFrame()

  Returns the ViewFrame object representing the GUI's current view, loop, and
  frame (null if not animating). This can be useful to check and/or change
  the sound associated with the current frame.
  
  Example:
  
    ViewFrame *vframe = gMygui.GetViewFrame();
    if (vframe != null) {
      vframe.LinkedAudio = aExplosion; // AGS v3.2, prior versions use vframe.Sound
    }

*****************************/

/*****************************
Licensing:

// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation  files  (the  "Software"),  to
// deal in the Software without restriction, including without  limitation  the
// rights to use, copy, modify, merge, publish, distribute, sublicense,  and/or
// sell copies of the Software, and to permit persons to whom the  Software  is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be  included  in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,  EXPRESS  OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO  THE  WARRANTIES  OF  MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL  THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE  FOR  ANY  CLAIM,  DAMAGES  OR  OTHER
// LIABILITY, WHETHER IN AN ACTION OF  CONTRACT,  TORT  OR  OTHERWISE,  ARISING
// FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
// IN THE SOFTWARE.
*****************************/

/*****************************
Module Change Log:

 Version:     2.0
 Date:        20 August 2009
 Author:      monkey_05_06
 Description: Updated module for use with AGS 3.0+ via the use of extender
              functions, i.e. GUI.Animate instead of GUIAnimation.Start. Set
              GUI functions as a mirror of existing Character functions for
              consistency. Added support for Flipped frames as well as sound
              clips linked to the frame (including the new AGS 3.2+ AudioClip
              ViewFrame.LinkedAudio).

 Version:     1.0
 Date:        17 November 2006
 Author:      monkey_05_06
 Description: First public version of module.
*****************************/

#ifdef AGS_SUPPORTS_IFVER
  #ifver 3.0
    #define GUIAnimation_VERSION 2.0
    #define GUIAnimation_VERSION_200
  #endif
#endif
#ifndef GUIAnimation_VERSION
  #error GUIAnimation module error!: This module requires AGS 3.0 or higher! Please upgrade to a higher version of AGS or use a prior version of this module.
#endif

///GUIAnimation module: Locks the GUI to VIEW so it can be animated.
import void LockView(this GUI*, int view);
///GUIAnimation module: Starts the GUI animating using LOOP of its locked view.
import void Animate(this GUI*, int loop, int delay, RepeatStyle=eOnce, BlockingStyle=eNoBlock, Direction=eForwards);
///GUIAnimation module: Unlocks the GUI's from its view and stops any animation.
import void UnlockView(this GUI*, bool restoreGraphic=true);
///GUIAnimation module: Returns whether the GUI is currently animating.
import bool IsAnimating(this GUI*);
///GUIAnimation module: Returns the current view the GUI is locked to.
import int GetView(this GUI*);
///GUIAnimation module: Returns the loop the GUI is currently using.
import int GetLoop(this GUI*);
///GUIAnimation module: Returns the frame the GUI is currently showing.
import int GetFrame(this GUI*);
///GUIAnimation module: Returns the ViewFrame object of the current GUI's frame.
import ViewFrame* GetViewFrame(this GUI*);
