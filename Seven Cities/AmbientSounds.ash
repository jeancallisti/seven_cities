/*
  AMBIANT SOUND/LOOP MODULE
  
  version 1.0
  Author : Mathieu Bergounioux (Monsieur Ouxx)
  
  License : "MIT". Google it for details.
    In a nutshell : 
    - use it the way you like it (modify it, include it in commercial game, whatever)
    - you must put my name in the credits of your game: cEgo.Flatter();
    - you must tell if you modified the plugin
    
    WHAT DOES IT DO
      It allows you to play any sound so that it repeats smoothly,
      thus allowing you to transform any sound effect into an ambiant loop.
      
      Note that it will work better if the sound is rather uniform (no
      recognizable repeating sound in it) and not too short. 
      For example, if you have a "storm" sound effect, avoid having 
      one outrageously recognizable thunderclap sound right in the middle of
      your ridiculously short loop.
      
    USE:
    
    Example : 
      aSound1.Play_Ambient(); //this plays aSound1 in a smooth loop
      aSound1.Stop_Ambient(); // stops aSound1
      Stop_Ambient_All(); //stops all ambiant sounds
      
    LIMITATIONS
      You can play up to 10 ambiant sounds simultaneously. change macro
      MAX_AMBIENTS to increase the limit.Please note that the real limit
      is the number of channels. There is a need of 2 channels per ambiant sound.
      
      */
      
//Play any AudioClip so that it loops smoothly
import void Play_Ambient(this AudioClip*,  int volume); //Play any AudioClip so that it loops smoothly


//adjust volume on the fly
import void SetAmbientVolume(this AudioClip*,  int volume); 

//Stops the audioclip if it was previously played using Play_Ambiant.
//Remarks: it stops the clip in the first channel found here it's currently being played
import void Stop_Ambient(this AudioClip* ); 

//Stops all the ambiant sounds
import void Stop_Ambient_All();

import void DumpChannels();



