// Script header for module 'Timer'
//This module is by Monkey_05_06 on the forums

enum Timer_AutoRemoveType {
  eTimer_AutoRemove = 1,
  eTimer_NoAutoRemove = 0
  };

enum Timer_RunAlwaysType {
  eTimer_NotRunAlways = 0,
  eTimer_RunAlways = 1
  };

struct TimerType {
  protected String __buffer;
  protected String __names;
  writeprotected int Count;
  import bool Exists(String timer);
  import Timer_AutoRemoveType GetAutoRemoveType(String timer);
  import int GetLoopsRemaining(String timer);
  import String GetNameByID(int ID);
  import Timer_RunAlwaysType GetRunAlwaysType(String timer);
  import bool IsAutoRemoved(String timer);
  import bool IsExpired(String time);
  import bool IsNameValid(String name);
  import bool IsPaused(String timer);
  import bool IsRunAlways(String timer);
  import void Pause(String timer);
  import void Remove(String timer);
  protected import void Reset(String timer);
  import void Set(String timer, int loops, Timer_RunAlwaysType runalways=eTimer_RunAlways, Timer_AutoRemoveType autoremove=eTimer_AutoRemove, bool paused=false);
  import void UnPause(String timer);
  };

import TimerType Timer;

#define TIMER_VERSION 201  
#define TIMER_VERSION_201  
#define TIMER_VERSION_200  
#define TIMER_VERSION_100  
