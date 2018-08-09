enum InteractionsStyles
{
    eStyle_9Verb, 
    eStyle_Coin, 
    eStyle_Simple
};

enum TapStyles
{
    eTapStyle_Desktop, 
    eTapStyle_Tap
};

struct InteractionsSetup
{
    import static void SetStyle(InteractionsStyles style);
    import static InteractionsStyles GetStyle();
    
    import static void SetTap(TapStyles tapStyle);
    import static TapStyles GetTap();
    
    import static void EchoInteractionsStyle();
};
