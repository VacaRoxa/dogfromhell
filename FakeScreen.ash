// FakeScreen module header

// To use, make sure the room this is in has the appropriate bg frames

// And add a walkbehind that fills the screen with a baseline low enough to hide the objects and characters



struct __FakeScreen
{
  import function Enable();
  import function Disable();
  import bool isEnabled();
};

import __FakeScreen FakeScreen;
import DynamicSprite * FakeSprite;

#define GWIDTH 224
#define GHEIGHT 320