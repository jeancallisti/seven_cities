AGSScriptModule        �  #define MAX_FRAMES_PIXELS 630000 //(3 values per pixel, 10000 pixels per frame, 7 frames per loop, 3 loops)
float unpacked[]; //where we store all the pixels of the unpacked view
export unpacked;

int unpacked_last; //last cell used
int unpacked_size;


//////////////////////////////////////////////////
//
//        UNPACKING SPACE
//
//////////////////////////////////////////////////

  //File* log; //DEBUG
  
  
function resetUnpackedArray()
{
  unpacked = new float[MAX_FRAMES_PIXELS]; //size by default
  unpacked_last = 0;
  unpacked_size = MAX_FRAMES_PIXELS;
}

function deleteUnpackedArray()
{
    unpacked = null;
    unpacked_last = -1;
    unpacked_size=0;
}

function noloopcheck expandUnpackedArray(int additionalSize) {

/*
  //// DEBUG /////
  log= File.Open("sprites.txt",eFileAppend);
  log.WriteRawLine(String.Format("expandUnpackedArray : %d to %d", unpacked_size, unpacked_size+additionalSize ));
  log.Close();
  //// ~~DEBUG ////
  */
  float temp[] = new float[unpacked_size+additionalSize];
  int i=0;
  while (i<unpacked_size)
  {
    temp[i] = unpacked[i];
    i++;
  }
  unpacked = temp;
  unpacked_size+=additionalSize;
  
}


static void UnpackedSprites::DeleteAll()
{
  deleteUnpackedArray();
}
  

//////////////////////////////////////////////////
//
//        UNPACKING PROCESSING
//
//////////////////////////////////////////////////



int howManySprites; //debug

//Returns how many cells it took to unpack it
static int UnpackedSprites::Unpack(DynamicSprite* spr,  bool flip)
{
  
  //very first time:make sure we created the dynamic array to store all that stuff
  if (unpacked==null)
  {
    resetUnpackedArray();
    
    /*
    //////// DEBUG //////
    log = File.Open("sprites.txt",eFileWrite);
    log.WriteRawLine("");
    log.Close();
    //// ~~DEBUG ////  
    */
  }
  
  int color; float r, g, b;

  
  DrawingSurface* ds = spr.GetDrawingSurface(); 
  int projectedSize = ds.Height*ds.Width*3 ;
  
  //Safety: make sure there's enough room in the array:
  if (unpacked_last+projectedSize>= unpacked_size)
    expandUnpackedArray(20000);
  
  int start = unpacked_last;
  
  /*
  //// DEBUG /////
  log= File.Open("sprites.txt",eFileAppend);
  log.WriteRawLine(String.Format("sprite %d: (%dx%d), size=%d, unpacked_last=%d", howManySprites, ds.Width, ds.Height,  projectedSize,  unpacked_last ));
  log.Close();
  howManySprites++;
  //// ~~DEBUG ////
  */
  
  int size=0;
  
  int j=0;
  while (j<ds.Height)
  {
    int i=0;
    while (i<ds.Width)
    {
      if (!flip)
        color = ds.GetPixel(i, j);
      else  
        color = ds.GetPixel(ds.Width-i, j);
        
        
      if (color == COLOR_TRANSPARENT)
      {
          r = -1.0;
          g = -1.0;
          b = -1.0;       
      }
      else
      {
        ///////// RGB EXTRACTION /////////////
        
          if (color > 65535) color-=65536;
             
          r = IntToFloat(((color >> 11) & 31) << 3);
          g = IntToFloat(((color >> 6) & 31) << 3);
          b = IntToFloat((color & 31) << 3);
        ///////// END OF RGB EXTRACTION /////////////  
      }  
      
      unpacked[unpacked_last+size+0] = r;
      unpacked[unpacked_last+size+1] = g;
      unpacked[unpacked_last+size+2] = b;
      size+=3;
      
      i++;
    }    
    j++;
  }
  unpacked_last+=size;
  
  /*
  //// DEBUG /////
  log= File.Open("sprites.txt",eFileAppend);
  log.WriteRawLine(String.Format("sprite %d: (%dx%d), size=%d, unpacked_last=%d", howManySprites, ds.Width, ds.Height,  projectedSize,  unpacked_last ));
  log.Close();
  howManySprites++;
  //// ~~DEBUG //// 
  */
  
  return start;
}






 [  import float unpacked[];


struct UnpackedSprites
{
  //Takes a DynamicSprite and "unpacks" it as an array of 'float', row by row
  //Each pixel of the sprite takes 3 floats (R,G,B).
  //A pixel with color COLOR_TRANSPARENT becomes (-1.0,-1.0,-1.0)
  //The function returns the index of the first cell occupied by the sprite within "unpacked[]"
  //If 'flip' is true, then the sprite will be unpacked flipped horizontally
  import static int Unpack(DynamicSprite* spr,  bool flip=false);


  //deletes unpacked[] and sets all according variables
  import static void DeleteAll();
  
};
 ���        ej��