enum EnumDirections {
  eUp, 
  eDown, 
  eLeft, 
  eRight
};

//extenders to the Character type
//import function FaceDirection(this Character*,  EnumDirections direction) ;
import function FaceAndSay(this Character*,  EnumDirections direction,  String sentence) ;
import function FaceAndSay2(this Character*,  int x,  int y,  String sentence);

struct Directions {
    import static EnumDirections OppositeDirection(EnumDirections direction);
    import static EnumDirections FromInt(int direction); //0=up, 1=right, 2=down, 3=left
    
};

