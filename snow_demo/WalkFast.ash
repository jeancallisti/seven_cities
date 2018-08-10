struct WalkFast {
 import static void OnMouseClick_left(); //manages left click
 import static void ManageTimer(); //manages the timer for the double-click. Must be called in repeatedly_execute
 import static void SwitchWalkfastFeature(); //turns it on or off
};

import void StopWalkFast(this Character*); //returns to normal walk speed of the player was using our "walk fast" feature
import void StartWalkFast(this Character*); //goes to higher walk speed if the player uses our "walk fast" feature



