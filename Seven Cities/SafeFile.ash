struct SafeFile {
  // == WHAT DOES IT DO ==
  //This module is designed to make sure that no data gets lost if the
  //game crashes while saving a file. The former version of the file is
  //kept as long as the new version isn't finished writing.
    
  // == HOW DOES IT WORK ==
  // This entire module works with TWO files : For example if you want to work
  // with 'debug.txt', then the module will actually work with 'debug0.txt' and
  // 'debug1.txt'
  
  
  //Does not really open the file, but makes sure that it will be possible to 
  // establish a swapping between 'debug0.txt' and 'debug1.txt'. 
  // The two files will be used for safe writing (For example debug0.txt
  //gets deleted only when debug1.txt is finished writing, and vice versa)
  import static bool Open(String fileName);
  
  //appends the line at the end of one of the two files (the module manages internally
  //which one). The file gets opened and closed at each line, to force the flushing of
  //the data.
  import static void AppendLine(  String line);
  
  //does not really close the file (it was already closed in 'AppendLine') but deletes
  //the other file, now that we're sure that the first one was saved properly.
  import static void Close();
  
  //returns false if BOTH files exist simultaneously, and Displays an error.
  //That means at some stage the game crashed, with both files existing
  //simultaneoulsy.
  import static bool HealthCheck(String fileName);
  
  //returns the actual file name that can currently be found in the folder, based on the theoretical name.
  //For example: if you pass "bugslist.xml", it will give you either "bugslist0.xml" or "bugslist1.xml"
  import static String FindInstance(String fileName);
};
