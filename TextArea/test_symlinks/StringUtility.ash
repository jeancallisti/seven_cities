//By Monsieur Ouxx.
//License : GPL
//This code is very bad but does the job. 
//You should use the "SuperString" module by monkey_05_06 instead

import String RemoveCharAt(this String*,  int at);
import void RenderStringReal(this Label*,  String str); //shows the String in the Label as it is exactly in memory (with backslashes, '[', etc.)
import void RenderStringAscii(this Label*,  String str); //renders the ascii codes of each char in the string, as it is stored in memory
import String Before(this String*,  int position);//returns the contents of the string before 'position' (not included)
                                                  //and does some safety work (never returns null, at least "")
import String After(this String*,  int position); //returns the contents of the string after 'position' (included)
                                                  //and does some safety work (never returns null, at least "")
import String Trim_After(this String*); //removes all white spaces at the end of the string
import String Trim_Before_After(this String*); //removes all white spaces at the beginning and the end of the string

import char LowerCase(char keycode);  //