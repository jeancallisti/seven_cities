
struct ActionsLogic {
    import static CursorMode DetectAvailableRightClick(); //should be called once per loop, to save resources
    import static CursorMode GetAvailableRightClick();    //can be called as often as needed
    import static void ResetCursor();

    //these two functions are a hack to force the call on "other click" for EVERY click on objects, including the 4 built-in modes (look at, talk to, useInv, interact)
    import static void        ItemClick_TriggerRealMode(CursorMode mode);
    import static CursorMode  ItemClick_GetRealMode();
    
    import static void Items_OnRightClick();
    import static void Items_OnLeftClick();
};

//go back to "walk to" with no inventory item selected



// USE/GIVE functions
import function SetGiveItem(int itemID); //sets the id of the item that the player is currently trying to "give"
import function SetUseItem(int itemID);//sets the id of the item that the player is currently trying to "use"
import function ResetGiveItem(); //Resets it to 0
import function ResetUseItem(); //Resets it to 0
import function GetGiveItem(); //gives the value previously set with SetGiveItem
import function GetUseItem(); //gives the value previously set with SetUseItem

