//WARNING : this enum must match EXACTLY the enum "Action" from the 9-verb module
enum Action_7CoG {
  eGA_7CoG_LookAt,
  eGA_7CoG_TalkTo,
  eGA_7CoG_GiveTo,
  eGA_7CoG_PickUp,
  eGA_7CoG_Use,
  eGA_7CoG_Open,
  eGA_7CoG_Close,
  eGA_7CoG_Push,
  eGA_7CoG_Pull,
  eGA_7CoG_UseInv,
  eMA_7CoG_Default,
  eMA_7CoG_WalkTo
};

import String Sentence(Action_7CoG mode, eObjectType objectType);
