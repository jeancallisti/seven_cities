struct SoundManagement
{
    //AudioClip
    import static int GetAudioClipCount();
    import static AudioClip* GetAudioClip(int i);
    import static String GetAudioClipName(AudioClip* a); 
    import static AudioClip* GetAudioClip_ByName(String s);
    import static bool IsAmbient(AudioClip* a);
    import static void PlayClipSafe(AudioClip* a,  int priority,  int repeatStyle);  //same as built-in AudioClip.Play, but does additional checking to avoid bugs
    import static void PlayClip(AudioClip* a,  int priority,  int repeatStyle,  bool predictChannel = true,  bool playAmbient = false);  //same as PlayClipSafe but with more options; predictChannel is optional. If true, the system tries to predict the channel on which the sound will play
    import static void StopClipSafe(AudioClip* a);  //same as built-in AudioClip.Safe, but does additional checking to avoid bugs
    

    //AudioType
    import static int GetAudioTypesCount();
    import static String GetAudioTypeName(AudioType audioType);
    import static int GetAudioChannelsMax(AudioType audioType); //if our module works this should be equal to the value defined in the editor (0 for "unlimited" channels)
    import static int GetAudioChannelsActual(AudioType audioType); //the actual maximum number of channels available to play clips that have this AudioType (probably 7 if all AudioTypes have maxchannels=0)
    import static int GetSharedChannelsCount(); //number of Audiotypes that have MaxChannels==0; effectively the number of channels being shared by these types
    import static bool IsShared(AudioType audioType); //returns true of this audioType shares its channels with other AudioTypes (in other words : if it has its MaxChannels==0)

    //AudioChannel
    import static bool IsSharedAudioChannel(AudioChannel* c); //returns true of this AudioChannel is "shared", i.e. is used by an AudioType that has MaxChannels==0
    import static AudioChannel* GetAudioChannel(int i); //i must be in 0, GetAudioChannelTotalCount
    import static int GetAudioChannelTotalCount(); //all the channels of all the AudioTypes (probably 7 or 8)
    import static String ChannelGetAudioClipName(AudioChannel* c); 
    import static void StopChannelSafe(AudioChannel* c);  //same as built-in AudioChannel.Stop, but does additional checking to avoid bugs

    
    //Channels Groups
    import static String DumpChannelsGroups(); 
};