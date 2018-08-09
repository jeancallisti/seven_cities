

//
//    CHANGES MADE FOR Seven Cities of Gold:
//    - renamed macro "NONE" to "NO_WIND" to avoid collision with our own macro
//
//
//


///////////////////////////////////////////////////////////


/*
 * SnowRainPS module script
 * AGS Version: 3.0 and later.
 * Author: Aditya Jaieel (helios123)
 * Version: 1.0
 * Copyright (C) 2010 Aditya Jaieel (helios123)
 *
 * Module Info:
 * ------------
 * This module will generate snow/rain effect.
 * It makes use of the room background's drawing surface as well as graphical overlay to achieve this.
 * The overlay gives the effect of snow/rain falling in front of the character, object, etc.
 *
 * The idea behind providing a separate function is to allow the user more control rendering of particles
 * based on certain conditions, etc.
 *
 * NOTE: Only one effect can be used at a time.
 *
 * IMPORTANT: 1) Try to avoid calling Room.SetBackgroundFrame from some other script when this module is being used, 
 *               as it may cause problems. Instead, the ChangeRoomBackground function provided in this module may
 *               be used.
 *               The default background cycling logic of AGS should not cause any problems.
 *            2) This script creates one overlay.
 *               There is a limit to the number of overlays that can be created (maximum 20).
 *            3) For best results, ensure that the color depth of the sprite and game is the same.
 *            4) Transparency may not work properly on overlays. Hence, it is disabled for overlay particles. 
 *               See line 766 in SnowRain.asc.
 *
 * Changelog:
 * ----------
 * v0.1: Initial
 * v0.2: Updated use of overlays based on ParticleSystemManager by Miguel García Díaz (Jerakeen)
 * v0.3: Added ability to add/remove rectangles/room regions for particles to disappear.
 *       Added SetParticleSystemOverlayPercent to control the percentage of particles drawn on the overlay.
 *       Added facility to provide rotation for particles if required.
 * v0.4: Added logic for removing background particles obscured by character or object
 * v0.5: Moved all exported functions inside a struct to prevent name collisions. Moved some configuration
 *       parameters as struct properties
 * v1.0: Updated logic in IsParticleInRect and IsParticleInRegion to set particle life in rect/region.
 *       IsParticleInRect and IsParticleInRegion now affect all particles.
 *       New System type: SNOW_AND_RAIN. (experimental)
 *       xInc, yInc and rotInc are now READ ONLY.
 *       Collision Detection now uses the Solid property of object and character to check for collision.
 *       Character.Solid and Object.Solid has to be true for collision detection to work.
 *       Everything except arrays is now moved in the struct.
 *       Transparency. Each background particle is MIN_TRANSPARENCY (25 percent) transparent. 
 *       Background particles slowly become more transparent after entering a region or rect.
 *
 *
 * License: 
 * --------
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to
 * deal in the Software without restriction, including without limitation the
 * rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
 * sell copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
 * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 * DEALINGS IN THE SOFTWARE.
 *
 */

// Check for correct AGS version
#ifdef AGS_SUPPORTS_IFVER
#ifnver 3.00
#error Module SnowRainPS requires AGS V3.00 or above
#endif
#endif

/* SetInitialCoordinates requires SNOW=0 and RAIN=1.
 * Any change below should be accompanied by a proper change in SetInitialCoordinates.
 */
enum SnowRainPS_ParticleSystemType  //The type of the system
{
  SNOW, 
  RAIN,
  SNOW_AND_RAIN, 
  NO_CHANGE_PARTICLE
};

enum SnowRainPS_WindDirectionType //The type of wind
{
  LEFT_TO_RIGHT_DIAGONAL,
  LEFT_TO_RIGHT_HORIZONTAL, 
  RIGHT_TO_LEFT_DIAGONAL,
  RIGHT_TO_LEFT_HORIZONTAL, 
  NO_WIND, 
  NO_CHANGE_WIND
};

struct SnowRainPS_Data
{
  /*
   * true when the particle system is active, false otherwise. This is also updated by the functions, 
   * setting this to false will stop the rendering of particles if the system is running.
   * This can be used for pause/unpause like behavior.
   */
  bool active;
  
  /*
   * The new sprite slot number. 
   * Use this to change the starting sprite number for drawing the particles, while the system is running.
   * This attribute is ignored by InitParticleSystem.
   * See also SetParticleSystemSpriteData.
   */
  int newSpriteSlot;
  
  /*
   * The new sprite count.
   * Use this to change the number of sprite images used, while the system is running.
   * This attribute is ignored by InitParticleSystem.
   * See also SetParticleSystemSpriteData
   */
  int newSpriteCount;
  
  /*
   * Sets the collision detection flag.
   * If set to true, all background particles will be removed when they come in contact with any object
   * or character in the room.
   *
   * WARNING: If the room has a lot of objects, or characters, or particles, this might slow the game down.
   */
  bool collisionDetect;
  
  /*
   * Enables transparency.
   * If set to true, all particles will slowly become transparent once they enter a rect or region.
   * Default is false.
   * Transparency does not appear to work well with overlays. So transparency will be applied only to background
   * particles.
   */
  bool enableTransParency;
  
  /*
   * Initializes the particle system. This method should be called before using the particle system.
   * Place this method in the function that runs when the room loads.
   * This method can be called repeatedly, even when the system is running. This can be used to simulate
   * sudden climate changes.
   * Passing negative value for any integer parameter will result in the defaults being used.
   *
   * Arguments:
   * ps - the type of particle system (cannot be NO_CHANGE_PARTICLE)
   * spriteNumber - the sprite slot number (must be greater than 0)
   * numSprites - the number of sprites to use (default is 1). This is combined with spriteNumber as follows:
   * If spriteNumber is 2 and numSprites is 5, then images in slot numbers from 2 to (2+5-1=)6, both 2 and 6 inclusive
   * will be used.
   * windDirection - the nature of wind (default is NO_WIND. This cannot be NO_CHANGE_WIND)
   * numParticles - the total number of particles required (default is 50).
   * overlayPerc - percentage of the total number of particles to be drawn on the overlay (default is 50)
   * xIncrement - amount in pixels by which the x co-ordinate of each particle should change between two successive states (default is 1)
   * yIncrement - amount in pixels by which the y co-ordinate of each particle should change between two successive states (default is 1)
   * rotIncrement - amount in degrees by which the particle is rotated between two successive states (default is 0)
   */
  import function InitParticleSystem(SnowRainPS_ParticleSystemType ps,  int spriteNumber, int numSprites = 1, SnowRainPS_WindDirectionType windDirection = NO_WIND, int numParticles = 50, int overlayPerc=50, int xIncrement = 1, int yIncrement = 1,  int rotIncrement = 0);
  
  /*
   * Renders the particles on the screen. Call this in the room's repeatedly execute 
   * (or repeatedly execute always) function.
   */
  import function RenderParticles();
  
  /*
   * Shuts down the particle system.
   * Call this function when the room unloads or when you want to stop the effect.
   */
  import function ShutdownParticleSystem();
  
  /*
   * Method to change the room's background. This can be used as an alternative to Room.SetBackgroundFrame.
   *
   * Arguments:
   * backgroundNumber - the new background number
   */
  import function ChangeRoomBackground(int backgroundNumber);
  
  /*
   * Sets the increments in co-ordinates of x and y axes. Use this to change the increments when the system is running
   * Passing 0 or a negative value will not update the corresponding increment value.
   * Passing 0 for the rotation increment will effectively stop rotation.
   * These values will be immediately after this function is called.
   *
   * NOTE: The increment values are always positive. The wind direction will determine how they are used to modify
   *       the co-ordinates.
   *
   * Arguments:
   * xIncrement - amount in pixels by which the x co-ordinate of each particle should change between two successive states (default is 1)
   * yIncrement - amount in pixels by which the y co-ordinate of each particle should change between two successive states (default is 1)
   * rotIncrement - the amount of rotation in degrees between two successive states (default is 0)
   */
  import function SetParticleSystemIncrements(int xIncrement = 1, int yIncrement = 1, int rotIncrement = 0);
  
  /*
   * Sets the type of particle system and wind direction. Use this to change the details when the system is running.
   *
   * Arguments:
   * ps - the type of particle system
   * windDirection - the nature of wind (default is NO_CHANGE_WIND)
   *
   * Passing corresponding NO_CHANGE_ option for any parameter will retain the existing setting.
   */
  import function SetParticleSystemData(SnowRainPS_ParticleSystemType ps, SnowRainPS_WindDirectionType direction = NO_CHANGE_WIND);
  
  /*
   * Changes the starting sprite slot and number of images used.
   * If any parameter is less than 1, it will be ignored.
   * Any new particle created after this function call will use the data passed in arguments.
   *
   * Arguments:
   * slotNumber - the slot number of the first sprite
   * imageCount - the number of sprites (default is 1)
   *
   * This is used as follows:
   * If slotNumber is 2 and imageCount is 5, then images in slot numbers from 2 to (2+5-1=)6, both 2 and 6 inclusive
   * will be used.
   */
  import function SetParticleSystemSpriteData(int slotNumber, int imageCount = 1);
  
  /*
   * Changes the percentage of particles on the overlay.
   *
   * Arguments:
   * overlayPerc - the percentage of particles to put on overlay (default is 50).
   */
  import function SetParticleSystemOverlayPercent(int overlayPerc=50);
  
  /*
   * Adds a rectangle where a particle may disappear.
   * This can be used to create the effect of ground or some other surface.
   * For regions that are not rectangles, create a region in the room editor 
   * and pass its id to ParticleSystemEnableRegion function.
   * A maximum of MAX_RECT_COUNT (which is 50) rectangles can be added. (This may change later)
   * 
   * Arguments:
   * left - x co-ordinate of top left corner of the rectangle
   * top - y co-ordinate of the top left corner of the rectangle
   * right - x co-ordinate of bottom right corner of the rectangle
   * bottom - y co-ordinate of the bottom right corner of the rectangle
   *
   * NOTE: All values must be greater than zero, otherwise the rectangle will not be added.
   * This will only apply to particles drawn on the background. So make sure that overlayPercent is not 100.
   */
  import function ParticleSystemAddRect(int left, int top, int right, int bottom);
  
  /*
   * Removes the last rectangle added using ParticleSystemAddRect
   */
  import function ParticleSystemRemoveLastRect();
  
  /*
   * Makes a particular room region active for particles to disappear on.
   * It is suggested that regions should be used for irregularly shaped areas, or areas which cannot be
   * represented as a rect, e.g. roof of a house, treetops, etc.
   *
   * Arguments:
   * regionID - the id of the region. Any value less than 1 and greater than 15 will be ignored.
   * lifeInRegion - the maximum number of loops for which a particle can remain visible after entering a region
   * (default is 25). 
   *
   * This is used as follows:
   * Each particle has a value named 'particleLifeInRectOrRegion' associated with it, which is basically the 
   * number of loops the particle remains visible after entering a region (or a rect). This is initially -1.
   * Suppose lifeInRegion for a particular region id 2 is 30. Now when the particle arrives in a region
   * (or a rect), it is first checked whether particleLifeInRectOrRegion is -1 for that particle.
   * If it is, then it is assigned a random number between MIN_PARTICLE_LIFE (which is 5) and 
   * lifeInRegion. Then this is decremented by 1 every time the particle is drawn on the screen. 
   * When particleLifeInRectOrRegion becomes zero, the particle is removed from the screen.
   *
   * The lifeInRegion argument is redundant in ParticleSystemAddRect as it can be readily calculated as the difference
   * between the two y co-ordinates of the rectangle. However, this is not possible in regions, and hence a separate
   * argument is needed.
   */
  import function ParticleSystemEnableRegion(int regionID, int lifeInRegion = 25);
  
  /*
   * Makes a particular room region inactive for particles to disappear on.
   *
   * Arguments:
   * regionID - the id of the region. Any value less than 1 and greater than 15 will be ignored.
   */
  import function ParticleSystemDisableRegion(int regionID);
  
  //START SEVEN CITIES MODIFICATIONS
  /*
   * Instead of rendering onto an overlay we render onto a dynamic sprite, as if it was a "window" located at the position given in parameters.
   * However it is then the responsibility of the scripter to display and position that window properly, for expample by setting it as the Graphic
   * of a room object.
   * Once this function has been called, then this specific particle system will only render onto that sprite.
   * 
   * IMPORTANT: some of the sprites are STILL rendered onto the background, in the same "window". that's how the module works: 
   *            some sprites are rendered "below" (onto the background) while some sprites are rendered "above" (onto an obverlay or our sprite)
   */
  import function SetRenderRegion(int top,  int left,  int bottom,  int right);
  
  //END SEVEN CITIES MODIFICATIONS
  
  /*
   * The maximum possible increments for x, y and rotation. These are read only.
   * Use SetParticleSystemIncrements to set these values.
   */
  writeprotected int xInc; //increment on x-axis
  writeprotected int yInc; //increment on y-axis
  writeprotected int rotInc; //rotation increment in degrees
  
  /*
   * The percentage of particles to put on overlay. This is for information purpose only.
   * Changing this property is not allowed. To change the overlay percent, use SetParticleSystemOverlayPercent.
   */
  writeprotected int overlayPerc;
  
  
  /**********************PRIVATE DATA AND FUNCTIONS**********************/
  
  /*
   * Checks if a particle is in a rect. Returns true when the particle is to be removed from the rect.
   * This will apply to all particles.
   *
   * Arguments:
   * index - the index of the particle
   *
   * Returns:
   * true or false if particle is to be removed from room, else false
   */
  protected import function IsParticleInRect(int index);
  
  /*
   * Checks if a particle is in the room
   *
   * Arguments:
   * index - the index of the particle
   *
   * Returns:
   * true if particle is in room, else false
   */
  protected import function IsParticleInRoom(int index);
  
  /*
   * Internal function to check whether a particle is obscured by a room character or object
   * or object
   */
  protected import function IsObscuredBy(int index);
  
  /*
   * returns a sprite number
   */
  protected import function RandomSpriteNumber();
  
  /*
   * Updates the sprites array.
   * Arguments:
   * index - the index in the array to update. If this is less than 0, the entire array is updated.
   */
  protected import function UpdateSpritesArray(int index);
  
  /*
   * Sets the initial x and y co-ordinates based on the wind direction.
   * Also sets the sprite image and the initial rotation
   *
   * Arguments:
   * index - the array index to update
   * ignoreWindDirection - if true, the wind direction is not considered while generating the coordinares.
   */
  protected import function SetInitialCoordinates(int index, bool ignoreWindDirection);
  
  /*
   * Checks if a particle is in any region where particles can disappear.
   * Returns true when the particle is to be removed from the rect.
   * This will apply to all particles.
   *
   * Arguments:
   * index - the index of the particle
   *
   * Returns:
   * true if particle is to be removed from region, else false
   */
  protected import function IsParticleInRegion(int index);
  
  /*
   * Internal function to update co-ordinates for particle system
   *
   * Arguments:
   * index - the index of the array to update
   */
  protected import function UpdateCoords(int index);
  
  //START SEVEN CITIES MODIFICATIONS
  protected int render_top;
  protected int render_left;
  protected int render_bottom;
  protected int render_right;
  protected bool renderToRegion;
  //END SEVEN CITIES MODIFICATIONS
      
  protected int rectCount; //the number of rectangles where particles can disappear
  protected bool bgChanged; //set to true by ChangeRoomBackground. Used to update the room's background.
  protected int xincflag; //multiplier for x axis
  //protected int yincflag ; //multiplier for y axis (not needed as of now)
  protected int spriteSlot; //the number of sprite to be used
  protected int spriteImages; //the number of sprite images
  protected int particleCount; //the number of particles that will be drawn on the room background
  protected int overlayCount; //the number of particles on the overlay
  protected int totalParticleCount; //the total number of particles
  protected int newBgNo; //the new room background. Used to update the room's background.
  
  protected SnowRainPS_ParticleSystemType systemType; //the type of particle system
  protected SnowRainPS_WindDirectionType windDirection; //the wind direction
  
  protected DrawingSurface* dsRoom; //pointer to the DrawingSurface for room background
  protected DrawingSurface* dsBackup[5]; //pointer to store original unchanged background
  protected DrawingSurface* dsSprite; //used for drawing to the dynamic sprite
  protected Overlay *theOverlay; //overlay
  DynamicSprite *theSprite; //sprite to be drawn on the overlay
  
};
