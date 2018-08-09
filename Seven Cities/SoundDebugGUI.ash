#define MAX_SOUND_SCALES 8 
#define NO_SOUND_VALUE -6666
struct SoundDebugGUI
{
  //which existing gui to use, and how many channels we want to display. That means there should be sufficient Buttons and Labels in that gui
  import static void SetSoundGUI(GUI* _gui,  int requestedChannels=7);  
  import static void SetSoundValues(int whichScale,  int value1,  int value2);  
  import static void SetNewStart(int whichScale,  float newLengthMs);  //to be called when you want to set a new start on the scale
  import static int GetNbScales();
};