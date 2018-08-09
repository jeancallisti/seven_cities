struct CharactersLogic {
  
  import static void setIndyView_suit();
  
  /////////////////////
  //
  //    INTERACTIONS LOGIC
  //
  /////////////////////
  import static void Mulbray(CursorMode mode);
  import static void Irene(CursorMode mode);
  import static void Biff(CursorMode mode);  
  import static void Bruno(CursorMode mode);  
  import static void Student1(CursorMode mode);  
  import static void Student2(CursorMode mode);    
  import static void Student5(CursorMode mode);  
  import static void Student6(CursorMode mode); 
  import static void Student7(CursorMode mode); 
  import static void Students_SpeakFast(String s1,  String s2,  String s3,  String s4);
  

  /////////////////////
  //
  //    STUDENTS PUZZLE
  //
  /////////////////////
  import static bool AllStudentsGaveTheirPreferences(); //Returns true if they all gave their favorite topic
  import static void Students_AllGaveTheirPreferences_Reaction1(); //Indy says aloud "you've asked enough questions..." 
  import static void Students_AllGaveTheirPreferences_Reaction2(); //indy says aloud "i can't just make up topics"
  import static void Students_SetSubjectPart(int part,  int answerChosen); //the essay's subject is made of 4 parts (location, era, etc.) For each part there are 4 possible answers
  import static void Students_ResetSubject(); //resets all parts of the essay's subject
  import static bool Students_ComputeSubject();   //tells if Indy picked all correct 4 parts for the essay's subject
  import static void RepeatSolution(); //Indy recaps the proper solution.
};


enum DialogVars {
  
  /////////////////////////////////
  //
  //    BARNETT
  //
  /////////////////////////////////
  eDialog_SandyHasExplainedTheProblem,  //Indy talked to student Sandy to know what the students want
  eDialog_MulbrayTopic,                 //Indy talked to Mulbray about the telegram
  eDialog_Student2gaveHisPreference,    //Student02 number told Indy what's his favorite topic
  eDialog_Student5gaveHisPreference,    //Student05 number told Indy what's his favorite topic
  eDialog_Student6gaveHisPreference,    //Student06 number told Indy what's his favorite topic
  eDialog_Student7gaveHisPreference,    //Student07 number told Indy what's his favorite topic
  eDialog_LookedAtCompassTag,           //Indy has found the compass tag in his desk, and looked at it
  eDialog_ShowedCompassToStudents,      //Indy has shown the compass at least once to Sandy
  eDialog_FoundProperSubject,           //Indy has managed to suggest a subject that suits every students
  eDialog_StudentsPuzzleFullyResolved,  //Indy has fully managed to satisfy the students
  eDialog_IndyConfusedHammers,          //Indy has tried at least once to bang something with the hammers, and realized he doesn't know which one is which one
  eDialog_IndySortedHammers             //Indy has resolved the Barnett hammers puzzle
};


struct DialogsLogic {
 
  import static void SetVar(DialogVars var,  int value);
  import static bool GetVar(DialogVars var);
  
  
};
