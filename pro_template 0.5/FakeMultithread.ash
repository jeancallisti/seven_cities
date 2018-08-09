/*
#define TASKID int

struct FakeMultithread {
  
  //'estimate' is any arbitrary value that will correspond to the maximum possible progress.
  //E.g. if you're loading a file, then you can pass the file size as 'estimate'
  import static TASKID New(String name,  int estimate = 100);
  
  //'progress' is any arbitrary value. Note: it's incremental (it's ADDED to the
  //previous progress you gave).
  //The module compares that sum to 'estimate', converts it to percents, and returns
  //that value. If the module returns 100%, it doesn't mean the task is finished.
  //I just means the estimate has been reached. The task is truly finished only when
  //you call 'Finish'
  import static int IncreaseProgress(TASKID id,  int progress);
  
  //Finished the task
  import static void Finish(TASKID id);
  
  //Is this task set? Maybe it was but now it's finished, or maybe it never was
  import static bool TaskExists(TASKID id);
};
*/