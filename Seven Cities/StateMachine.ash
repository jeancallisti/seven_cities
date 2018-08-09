/*







          THIS MODULE IS NOT USED FOR NOW







*/






/*
Note: Credit for the module below goes to Monkey_05_06 and HeirOfNorton
*/

/******************************************\

             AGS Script Module
                StateMachine
      aka, the Flying Spaghetti Module
                   v1.0
      --------------------------------
      A Finite State Machine system by
                monkey_05_06

-******************************************-

Description:

  Provides functions to implement finite state machines within your AGS scripts.

-******************************************-

FAQs:

  Q. What is a finite state machine?
    A. A finite state machine, or FSM, is quite simply a way of looking at something
       as a set of "states" and the relation between those states.

  Q. What is an FSM good for, really?
    A. An FSM is great for storing the relations between two or more given states.
       For example, your living room may be to the west of your bedroom (and
       therefore your bedroom to the east of your living room). A "state" can be
       virtually any type of condition, location, etc. The FSM just stores the
       relation between these states.

  Q. What is an FSM *NOT* for?
    A. An FSM is great at storing the relation between different states, but it is
       not designed for storing arbitrary data. That is, an FSM could be used for
       determining whether the player has picked up the key, been in room X or done
       Y. However, it's designed and aimed more toward defining more complex
       relations rather than just boolean data. If that's what you want, then this
       module isn't really what you're looking for.

  Q. I'm pretty new at this. Is this going to hurt?
    A. Preferably. The Spaghetti Monster always needs another human sacrifice. But
       if you are of the disposition that you like your insides in, then we may
       have to negotiate on the terms.
       
       The module provides methods that are easy to pick up and use whether you've
       been dealing with FSMs for the last X-teen years or just using them for the
       first time. The module is designed to function as painlessly as possible.

-******************************************-

Module dependencies:

  - AGS v3.1 or higher

-******************************************-

Macros (#define-s) and enums:

  - StateMachine_VERSION
      Defines the current version of the module, formatted as a float variable.

  - StateMachine_VERSION_100
      Defines version 1.0 of the module.

  - enum StateMachine_Settings:
      * eStateMachine_MaxMachines
          Defines the maximum number of machines that can be created and used. The
          default setting is 200.

      * eStateMachine_MaxStates
          Defines the maximum number of states that can be applied to each machine.
          The default setting is 150.

      * eStateMachine_MaxTransitions
          Defines the maximum number of transitions that can be applied to each
          machine. The default setting is 150.

      * eStateMachine_AutoCreate
          Sets whether machines will automatically be created when loaded. The
          default setting is TRUE. If set to FALSE then you must manually create
          the machines before they can be loaded into an instance.

-******************************************-

Functions and properties:

static int StateMachine.Clone(String donorName, String cloneName)

  Creates a new copy of the machine named DONORNAME called CLONENAME. All of the
  states and transitions currently applied to the DONORNAME machine will be copied
  into the CLONENAME machine. Returns the index at which the new machine was
  created, or -1 if there were any errors such as invalid DONORNAME or CLONENAME.
  If a machine called CLONENAME already exists it will be overwritten.
  
  See Also: StateMachine.Create

static int StateMachine.Create(String machine, String state, optional int ID)

  Creates a new machine named MACHINE with one state, STATE. You may optionally
  provide an alternate index ID at which to create the machine (i.e., for
  overwriting existing machines). If ID is less than zero or higher than the
  current number of existing machines it will be set to the first open index.
  Returns the index at which the machine was created, or -1 if there were any
  errors (such as invalid MACHINE or STATE names).
  
  See Also: StateMachine.Clone

static int StateMachine.GetMachineCount()

  Returns the current number of machines in use. Once this reaches the value of
  eStateMachine_MaxMachines you will no longer be able to create new machines with
  StateMachine.Create or StateMachine.Clone, though overwriting existing machines
  with these functions will still be possible.
  
  See Also: StateMachine.Clone, StateMachine.Create

static int StateMachine.GetMachineID(String machine)

  Returns the index of the specified MACHINE. Returns -1 if the machine does not
  exist.
  
  See Also: StateMachine.Create, StateMachine.GetMachineCount

static String StateMachine.GetMachineNameByID(int ID)

  Returns the name of the machine at the specified index ID or NULL if an invalid
  index was given.
  
  See Also: StateMachine.Create, StateMachine.GetMachineID

static int StateMachine.LoadMachinesFromFile(String filename)

  Replaces all existing machines with the machine data from FILENAME. An example
  is provided below, and you may also use StateMachine.SaveMachinesToFile. Returns
  the number of machines loaded.
  
  See Also: StateMachine.SaveMachinesToFile

static bool StateMachine.SaveMachinesToFile(String filename)

  Saves all existing machines to FILENAME. Returns FALSE if any error occurs. The
  file is written in plain-text, an example will be provided below.
  
  See Also: StateMachine.LoadMachinesFromFile

bool StateMachine.AddState(String state)

  Adds a new STATE to the machine. Returns FALSE if this instance has not yet had
  a machine loaded or if STATE is invalid (null, empty, or existing).
  
  See Also: StateMachine.AddTransition, StateMachine.Load, StateMachine.RemoveState

bool StateMachine.AddTransition(String fromState, String input, String toState)

  Adds a new transition from the FROMSTATE to the TOSTATE upon given INPUT. Returns
  FALSE if any of the parameters are invalid. Can be used to change existing
  transition to new TOSTATE. FROMSTATE and TOSTATE must be valid states for the
  machine.
  
  See Also: StateMachine.AddState, StateMachine.DoTransition

void StateMachine.DoTransition(String input)

  Provides the machine with the given INPUT so a transition may be performed. If
  the transition has already been set from the existing machine state for the INPUT
  then the machine state will be set to the new state. Otherwise nothing happens.
  
  See Also: StateMachine.AddTransition

String StateMachine.GetMachineName()

  Returns the name of this machine or NULL if no machine has been loaded into this
  instance.

String StateMachine.GetStateByID(int ID)

  Returns the state at the specified index ID, or NULL for invalid IDs.
  
  See Also: StateMachine.GetStateID

int StateMachine.GetStateID(String state)

  Returns the index of the given STATE, or -1 for invalid STATEs.
  
  See Also: StateMachine.GetStateByID

String StateMachine.GetTransitionFromStateByID(int ID)

  Returns the "from" state for the specified index ID, or NULL for invalid
  IDs.

  See Also: StateMachine.GetTransitionID, StateMachine.GetTransitionInputByID,
    StateMachine.GetTransitionToStateByID

int StateMachine.GetTransitionID(String fromState, String input)

  Returns the index of the given transition upon given INPUT from FROMSTATE or
  -1 for invalid parameters.
  
  See Also: StateMachine.GetTransitionFromStateByID,
    StateMachine.GetTransitionInputByID, StateMachine.GetTransitionToStateByID

String StateMachine.GetTransitionInputByID(int ID)

  Returns the input for the specified index ID or NULL for invalid IDs.
  
  See Also: StateMachine.GetTransitionFromStateByID, StateMachine.GetTransitionID,
    StateMachine.GetTransitionToStateByID

String StateMachine.GetTransitionToStateByID(int ID)

  Returns the "to" state for the specified index ID or NULL for invalid IDs.
  
  See Also: StateMachine.GetTransitionFromStateByID, StateMachine.GetTransitionID,
    StateMachine.GetTransitionInputByID

bool StateMachine.Load(String machine, optional String state)

  Loads the MACHINE into this instance. You may optionally provide the STATE to
  start the machine at. If eStateMachine_AutoCreate is TRUE then you can use this
  function by itself instead of first having to call StateMachine.Create. If the
  machine does not exist returns FALSE, otherwise returns TRUE.
  
  See Also: StateMachine.Create

void StateMachine.RemoveState(String state)

  Removes the specified STATE from the loaded machine.
  
  See Also: StateMachine.AddState, StateMachine.RemoveTransition

void StateMachine.RemoveTransition(String fromState, String input)

  Removes the transition from FROMSTATE upon given INPUT from the loaded machine.
  
  See Also: StateMachine.AddTransition, StateMachine.RemoveState

writeprotected String StateMachine.CurrentState

  Returns the current state of the loaded machine. This is set by performing a
  transition on the machine. Although you can load the same machine into multiple
  instances and they will all share the same states and transitions, the current
  state is instance-specific. Performing a transition on this instance will not
  affect any other instances which may have loaded the same machine.
  
  See Also: StateMachine.AddState, StateMachine.AddTransition, StateMachine.DoTransition

-******************************************-

Examples:

  In addition to the provided demo, here's a few examples of how to use this
  module. Let's take a simple house plan as an example of a state machine. We'll
  start by creating the machine.

    StateMachine.Create("house", "living room");

  There that was easy enough. We now have a finite state machine (FSM) called
  "house" with one state called "living room". Now if we want to add some other
  states we have to create an instance of our machine:

    StateMachine house;
    house.Load("house");

  Okay so now we've loaded the FSM "house" into the script instance with the same
  name. This allows us to actually perform actions on the machine such as adding
  new states, adding transitions, performing transitions, etc. Let's add some more
  states to our machine:

    house.AddState("bedroom");
    house.AddState("kitchen");
    house.AddState("bathroom");
    house.AddState("guest room");

  There, we now have a total of five different states in our "house" machine which
  we're accessing via the house script instance. Next we need to define the relation
  between these states. For example the bedroom could be east of the living room:

    house.AddTransition("living room", "east", "bedroom");

  This tells our machine that if we go east from the living room we are in the
  bedroom. When we created our machine we started off in the living room. So we
  could now go into the bedroom like this:

    house.DoTransition("east");

  Now if we check the current state we will find ourselves in the living room:

    if (house.CurrentState == "bedroom") Display("We're in the bedroom!");

  We'll need more transitions than just that though for our FSM to fully function.
  For example the way we have it set up right now there's no transitions available
  FROM the bedroom. We're trapped! Let's resolve that:

    house.AddTransition("bedroom", "west", "living room");

  We can now travel freely between the bedroom and the living room, but what if
  you're feeling the call of nature? Let's set up the rest of our relationships:

    house.AddTransition("living room", "west", "bathroom");
    house.AddTransition("bathroom", "east", "living room");
    house.AddTransition("living room", "south", "kitchen");
    house.AddTransition("kitchen", "north", "living room");
    house.AddTransition("living room", "north", "guest room");
    house.AddTransition("guest room", "south", "living room");

  That's a pretty basic idea of what you'd need to do. Now with the way it's
  currently set up you would have to go through the living room to get to any
  other room in the house. So I'm not an architect. If you'd like to see further
  scripting examples (and see them in action) check out the provided demo.

-******************************************-

File structure:

  The module makes it possible to export your machines to a file and import them
  back in. As denoted above these files are written in plain-text so you could
  easily set up your machines in Notepad (or any other text editor) if it's
  easier for you than actually typing the script. The formatting of the file is
  as follows:

    MACHINE:SomeMachineName

  Denotes the beginning of a machine named "SomeMachineName". This will be
  followed by the states and transitions to be implemented for the machine:

    STATE:SomeState1
    STATE:SomeState2

  Implements states "SomeState1" and "SomeState2" for the currently loading
  machine (here it would be "SomeMachineName"). Next, now that we have some
  states implemented we can add a transition or two:

    FROM:SomeState1
    INPUT:SomeInput1
    TO:SomeState2
    FROM:SomeState2
    INPUT:SomeInput2
    TO:SomeState1

  We now have transitions defined from "SomeState1" to "SomeState2" (upon input
  of "SomeInput1") and from "SomeState2" back to "SomeState1" (upon input of
  "SomeInput2").
  
  It is also possible to perform clone operations so you don't have to duplicate
  the same code over and over:

    CLONE:SomeMachineName
    NEW:SomeOtherName

  Creates a clone of "SomeMachineName" called "SomeOtherName".
  
  Bringing it all together, you can load this file:

    MACHINE:SomeMachineName
    STATE:SomeState1
    STATE:SomeState2
    FROM:SomeState1
    INPUT:SomeInput1
    TO:SomeState2
    FROM:SomeState2
    INPUT:SomeInput2
    TO:SomeState1
    CLONE:SomeMachineName
    NEW:SomeOtherName

  Which is equivalent to the following script:

    StateMachine.Create("SomeMachineName", "SomeState1");
    StateMachine SomeMachine;
    SomeMachine.AddState("SomeState2");
    SomeMachine.AddTransition("SomeState1", "SomeInput1", "SomeState2");
    SomeMachine.AddTransition("SomeState2", "SomeInput2", "SomeState1");
    StateMachine.Clone("SomeMachineName", "SomeOtherName");

  Feel free to use whichever method comes more naturally to you. However do take
  note that loading the machines from a file is notably slower than creating
  them directly within the script (since the file must be loaded, parsed, and
  then call the exact same functions anyway).

-******************************************-

Licensing:

  This AGS Script Module is hereby released to public domain with
  restriction as follows: the module may be modified and released in any
  fashion such that modifications do not nullify this license, and any
  subsequent versions (in whole or in part) of this module must be released
  using the same license, and may not be relicensed (as a stand-alone module
  in whole or part; it may be subject to relicensing as part of inclusion in
  a game project or otherwise which may make use of the module). This module
  is released without any warranty of any kind implicit or otherwise, and by
  using this module you agree to waive liability of the author of any and all
  subsequent consequence(s) of using this module. The original author reserves
  the right at any time to void and revoke this license in favor of another
  license only provided the subsequently chosen license submits this module to
  public domain in some fashion. Furthermore, lol. That is all.

-******************************************-

Changelog:

  Version:     1.0
  Author:      monkey_05_06
  Date:        21 October 2009 (actually I don't know this information..but this is when the documentation was written :P)
  Description: First public release.

-******************************************-

Questions, Comments, Technical Help?

  Feel free to contact me on the AGS forums for help. I'd love to hear from you
  even if it's just to say you'll be using the module!

  -monkey_05_06

\******************************************/

#ifdef AGS_SUPPORTS_IFVER
#ifver 3.1               
#define StateMachine_VERSION 1.0
#define StateMachine_VERSION_100
#endif                   
#endif                   
#ifndef StateMachine_VERSION
#error StateMachine module error! AGS version 3.1 or higher is required! Please upgrade to a higher version of AGS to use this module.
#endif                      

enum StateMachine_Settings {
  eStateMachine_MaxMachines = 200,
  eStateMachine_MaxStates = 150,
  eStateMachine_MaxTransitions = 150,
  eStateMachine_AutoCreate = true
};

struct StateMachine {
  ///StateMachine module: Changes the specified machine's name to NEWNAME.
  import static bool ChangeMachineName(String oldName, String newName);
  ///StateMachine module: Creates a new machine named MACHINESTATE with one state, STATE.
  import static int Create(String machine, String state, int ID=-1); // $AUTOCOMPLETESTATICONLY$
  ///StateMachine module: Creates a copy of an existing machine, all of its states, and transitions.
  import static int Clone(String donorName, String cloneName); // $AUTOCOMPLETESTATICONLY$
  ///StateMachine module: Imports machine info stored in an external file.
  import static int LoadMachinesFromFile(String filename); // $AUTOCOMPLETESTATICONLY$
  ///StateMachine module: Exports all machine info to an external file.
  import static bool SaveMachinesToFile(String filename); // $AUTOCOMPLETESTATICONLY$
  ///StateMachine module: Returns the index that MACHINE is stored at, or -1 if it doesn't exist.
  import static int GetMachineID(String machine); // $AUTOCOMPLETESTATICONLY$
  ///StateMachine module: Returns the name of the machine at the specified index.
  import static String GetMachineNameByID(int ID); // $AUTOCOMPLETESTATICONLY$
  ///StateMachine module: Returns the number of machines currently in use.
  import static int GetMachineCount(); // $AUTOCOMPLETESTATICONLY$
  ///StateMachine module: Loads a machine's data into an instance of the struct.
  import bool Load(String machine, String state=0);
  ///StateMachine module: Returns the name of the loaded machine.
  import String GetMachineName();
  ///StateMachine module: Returns the current state this instance is in.
  writeprotected String CurrentState;
  ///StateMachine module: Adds a new state to this machine.
  import bool AddState(String state);
  ///StateMachine module: Returns the index of the specified state.
  import int GetStateID(String state);
  ///StateMachine module: Returns the state at the specified index.
  import String GetStateByID(int ID);
  ///StateMachine module: Removes the specified state from this machine.
  import void RemoveState(String state);
  ///StateMachine module: Adds a new transition from FROMSTATE to TOSTATE upon given INPUT for this machine.
  import bool AddTransition(String fromState, String input, String toState);
  ///StateMachine module: Returns the index for the specified transition.
  import int GetTransitionID(String fromState, String input);
  ///StateMachine module: Gets the transtion FROM state for the specified index.
  import String GetTransitionFromStateByID(int ID);
  ///StateMachine module: Gets the transition INPUT for the specified index.
  import String GetTransitionInputByID(int ID);
  ///StateMachine module: Gets the transition TO state for the specified index.
  import String GetTransitionToStateByID(int ID);
  ///StateMachine module: Removes the specified transition from this machine.
  import void RemoveTransition(String fromState, String input);
  ///StateMachine module: Performs a transition on this instance of this machine with the given input.
  import void DoTransition(String input);
  protected int MachineID;
  protected bool Valid;
};
