struct TinyParser {

  //sets the text that will be parsed, and rests all variable (in particular, the start position)
  import static void StartParsing(String str);

  //returns the character in the text starting from the current start position, 'ahead' characters ahead.
  //And makes sure not to look beyond 'txt' 's boundaries.
  import static char LookAhead(int howMany);

  //returns true if the parser has reached the end of the text (i.e. if the character at the start position was eKeyReturn)
  import static bool EOF();
 
  //returns the character at the current start position and increases the start position
  import static char GetNextChar();
  
  //returns true if the last character that was read was the special char for a new line ( '[' )
  import static bool NewLine() ;
  
  import static int Start(); //returns the current read position in the string, after GetNextChar got called
  import static int PrevStart(); //returns the previous read position in the string, before GetNextChar got called
};
