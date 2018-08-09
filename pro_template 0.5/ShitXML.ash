#define XMLNODE int
#define NONE -1

enum XMLFormattingStyle {
  eXMLStyle_OneLine, 
  eXMLStyle_Block
};

struct ShitXML
{
  import static XMLNODE NewNode(String name);

  import static void SetFormattingStyle(XMLNODE node,  XMLFormattingStyle style);

  import static void Parse(XMLNODE root,  String fileName);
  import static void AddChild(XMLNODE parent, XMLNODE child) ;
  
  //use these two to iterate on the children of a node
  import static XMLNODE FirstChild(XMLNODE parent);
  import static XMLNODE NextChild(XMLNODE currentChild);
  
  import static void DeleteAll(XMLNODE root);
  import static bool Dump(XMLNODE root,  String fileName);
  
  import static void SetText(XMLNODE node,  String txt);
  import static void SetText_i(XMLNODE node,  int value);
  import static String GetText(XMLNODE node);
  import static int GetText_i(XMLNODE node);
  
  import static String GetName(XMLNODE node);

};
