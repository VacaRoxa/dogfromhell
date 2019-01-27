// new module header

enum eKMKey {
  eKMKeyUp,
  eKMKeyLeft,
  eKMKeyRight,
  eKMKeyDown,
  eKMKeyRun
};

enum eKMModificatorKeyCode {
  eKMModKeyLeftShift = 403,
  eKMModKeyRightShift = 404,
  eKMModKeyLeftCtrl = 405,
  eKMModKeyRightCtrl = 406,
  eKMModKeyAlt = 407
};

enum eKMMovementKeys {
  eKMMovementWASD,
  eKMMovementArrowKeys
};

struct str_keys {
  eKeyCode Up, Left, Down, Right;
  eKMModificatorKeyCode Run; 
};

enum eKMLoopDomination {
  eKMLoopDHorizontal,
  eKMLoopDVertical,
  eKMLoopDLast
};  

enum eKMMode {
  eKeyboardMovement_Tapping,  // old module contingency
  eKMModePressing
};

struct KeyboardMovement {
  // keys
  import static eKeyCode GetKey(eKMKey key);
  import static void SetKey(eKMKey key, eKeyCode k);
  import static void SetRunKey(eKMModificatorKeyCode k = eKMModKeyLeftShift);
  import static void SetMovementKeys(eKMMovementKeys mk = eKMMovementWASD);
  
  // settings
  import static int  GetRunSpeed();
  import static void SetRunSpeed(int RunSpeed = 2);
  import static void SetLoopDomination(eKMLoopDomination LoopDomination = eKMLoopDLast);
  import static int  GetRunView();
  import static void SetRunView(int RunView, int RunSpeedX, int RunSpeedY);
  import static void SetDiagonalFactor(float DiagonalFactor);
  import static void SetEdgeAnimation(bool AnimateAtEdge);
  import static void SetBlockedTurn(bool TurnIfBlocked);
  import static void SetIdleView(int view, int delay);
  
  // status
  import static bool Moving();
  import static bool Animating();

  // control
  import static eKMMode GetMode();
  import static void SetMode(eKMMode Mode = eKMModePressing);
  import static void Enable();
  import static void Disable();
  import static bool IsEnabled();
  import static void StopMoving();
  
  //fake keys
  import static void FakeKeyPres(eKeyCode k);
};























