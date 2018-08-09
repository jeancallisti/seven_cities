#define REALPAUSE //we notify that this function is available for third-party
                  //modules, such as tweens



#ifver 3.3.0
#define ags_3_3_0
#endif


#ifndef ags_3_3_0 //STILL IN 3.2.1
  //[Mathieu] I defined our own 'enum', because there are none for SetSkipSpeech in AGS 3.2.1
  // There will be in AGS 3.3.0 though. We'll have to upgrade
  enum SkipSpeech {
    eSkipSpeech_AnyKeyOrMouse  = 0,  //any keystroke or mouse click
    eSkipSpeech_Time           = 2 //nothing can skip the cutscene except time
  };
#endif

#ifdef ags_3_3_0 //3.3.0 or higher
  #define eSkipSpeech_AnyKeyOrMouse eSkipKeyMouse
  #define eSkipSpeech_Time eSkipTime
#endif

    
struct RealPause
{
  //if you give a gui to that function, afterwards it will appear when the game 
  //gets paused using this modeul's pause/unpause.
  //Use this to display a "pause" message. The results if you try to use the gui
  //for something else are unpredictable
  import static void BindGui(GUI* gPause);
  
  //pauses the game. It does more that built-in PauseGame:
  // - it displays the "pause" gui (see 'BindGui')
  // - it works during cutscenes
  //note: if silent is true, the "pause message" is not displayed.
  import static void Pause(bool silent=false);
  
  import static void Unpause(); 
  
  import static bool IsPaused(); 
  
};

//to understand that macro, read below
#define WAIT SuspendableWait.Set(
#define PLEASE ); while(!SuspendableWait.Done()) { Wait(10); }



// Allows to create a "suspendable Wait".
// That's our equivalent to AGS' built-in "Wait(delay)", but that gets suspended
// for as long as IsGamePaused() is true. It means that if you pause the game during a
// "suspendable Wait", then that "Wait" gets prolongated for as long as the pause 
// is active.
struct SuspendableWait
{
  
  // To be used in a loop as follows, in a section of script where you could normally
  // use a regular Wait (i.e. NOT in repeatedly_execute_always) :
  //
  //    SuspendableWait.Set(450); while(!SuspendableWait.Done()) { Wait(10); } //equivalent to Wait(450);
  //
  // You can use only one "suspendable wait" simultaneously. Do not try to mix them.
  // Nothing else changes: the Wait still blocks other scripts, etc. See the offocial help for
  // more details.
  //
  // Alternatively you can use the follwoing macro for more convenience:
  //
  //    WAIT 110 PLEASE //equivalent to Wait(10);
  //
  // Note that the PLEASE macro waits game loops 10 by 10, not 1 by 1. You can change that if you wish
  
  import static void Set(int delay);
  import static bool Done();

};

#define WAIT_1  SuspendableWait.Set(1); while(!SuspendableWait.Done()) { Wait(1); } //this one is rather useless; it's just there for use consistency
#define WAIT_10 SuspendableWait.Set(10); while(!SuspendableWait.Done()) { Wait(10); }
#define WAIT_20 SuspendableWait.Set(20); while(!SuspendableWait.Done()) { Wait(10); }
#define WAIT_30 SuspendableWait.Set(30); while(!SuspendableWait.Done()) { Wait(10); }
#define WAIT_40 SuspendableWait.Set(40); while(!SuspendableWait.Done()) { Wait(10); }
#define WAIT_50 SuspendableWait.Set(50); while(!SuspendableWait.Done()) { Wait(10); }
#define WAIT_60 SuspendableWait.Set(60); while(!SuspendableWait.Done()) { Wait(10); }
#define WAIT_70 SuspendableWait.Set(70); while(!SuspendableWait.Done()) { Wait(10); }
#define WAIT_80 SuspendableWait.Set(80); while(!SuspendableWait.Done()) { Wait(10); }
#define WAIT_90 SuspendableWait.Set(90); while(!SuspendableWait.Done()) { Wait(10); }
#define WAIT_100 SuspendableWait.Set(100); while(!SuspendableWait.Done()) { Wait(10); }
#define WAIT_110 SuspendableWait.Set(110); while(!SuspendableWait.Done()) { Wait(10); }
#define WAIT_120 SuspendableWait.Set(120); while(!SuspendableWait.Done()) { Wait(10); }
#define WAIT_130 SuspendableWait.Set(130); while(!SuspendableWait.Done()) { Wait(10); }
#define WAIT_140 SuspendableWait.Set(140); while(!SuspendableWait.Done()) { Wait(10); }
#define WAIT_150 SuspendableWait.Set(150); while(!SuspendableWait.Done()) { Wait(10); }
#define WAIT_160 SuspendableWait.Set(160); while(!SuspendableWait.Done()) { Wait(10); }
#define WAIT_170 SuspendableWait.Set(170); while(!SuspendableWait.Done()) { Wait(10); }
#define WAIT_180 SuspendableWait.Set(180); while(!SuspendableWait.Done()) { Wait(10); }
#define WAIT_190 SuspendableWait.Set(190); while(!SuspendableWait.Done()) { Wait(10); }
#define WAIT_200 SuspendableWait.Set(200); while(!SuspendableWait.Done()) { Wait(10); }
#define WAIT_210 SuspendableWait.Set(210); while(!SuspendableWait.Done()) { Wait(10); }
#define WAIT_220 SuspendableWait.Set(220); while(!SuspendableWait.Done()) { Wait(10); }
#define WAIT_230 SuspendableWait.Set(230); while(!SuspendableWait.Done()) { Wait(10); }
#define WAIT_240 SuspendableWait.Set(240); while(!SuspendableWait.Done()) { Wait(10); }
#define WAIT_250 SuspendableWait.Set(250); while(!SuspendableWait.Done()) { Wait(10); }



