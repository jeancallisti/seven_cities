//By Monsieur Ouxx.
//License : GPL
//This code is very bad but does the job. 
//You should use the "SuperString" module by monkey_05_06 instead

import String RemoveCharAt(this String*,  int at);
import void RenderStringReal(this Label*,  String str); //shows the String in the Label as it is exactly in memory (with backslashes, '[', etc.)
import void RenderStringAscii(this Label*,  String str); //renders the ascii codes of each char in the string, as it is stored in memory
import String Before(this String*,  int position);
import String After(this String*,  int position);
