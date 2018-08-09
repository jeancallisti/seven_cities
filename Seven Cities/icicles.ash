#define ICICLE int

struct Icicles
{
    // x_center :  //where the center of the reflection will be rendered, inside the object sprite (object coordinates)
    // y_top :  //where the top of the reflection will be rendered, inside the object sprite (object coordinates)
    // reg: region that triggers the reflection on
    // sprite_has_alpha: set to true if the object's sprite was imported with alpha channel. If it relies on magic pink, then set to false
    import static ICICLE NewIcicle(Object* o,  int x_center,  int y_top,  Region* reg,  bool sprite_has_alpha);
    
    
    import static void SetProportions(ICICLE icicle,    int x3_width,  int x2_width,  int x1_width);
    import static void SetScale(ICICLE icicle,    float horiz,  float vertic);
    
    
    import static void Enable(ICICLE icicle);
    
    
    import static void DisableAll();
 
};
