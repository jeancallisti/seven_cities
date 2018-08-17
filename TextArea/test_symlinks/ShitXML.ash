//////////////////////////////////////////////////
//
//  Module: ShitXML
//
//  Auteur: The "Indiana Jones and the Seven Cities of Gold" development team. 
//          Specifically: Monsieur Ouxx
//  Hauteur: Approximately 17 centimeters.
//
//  Version: 1.0.x (sorry, I might forget to update this info)
//  License: absolutely free to use, copy, modify, whatever.
//
//  What does it do:  Allows you to load, create and save simple XML files from/to
//                    disk, and manipulate the XML document tree.
//
//  How to use: Here is a snippet:
//                [snippet 1 : load a file from disk]
//                XMLNODE myRoot = ShitXML.NewNode("mydocument"); //Creates a root node to store the XML tree
//                ShitXML.Parse(myRoot,"xmlfile.xml"); //load an xml file from disk and store it into the tree. It will automatically load xmlfile1.xml or xmlfile2.xml (see the note below)
//
//
//                [snippet 2 : build a tree manually]
//                //(first, repeat the steps from snippet 1 to get an actual tree)
//                ShitXML fooNode = ShitXML.NewNode("fooNode"); //[just for demo] Create a new node.
//                ShitXML.SetText(fooNode, "this text will appear between the tags");
//                ShitXML.AddChild(myRoot,fooNode); //the root has now one more child, our foo node.
//
//                [snippet 3 : save an XML document tree to disk]
//                //(first, repeat the steps from snippet 1 to get an actual tree)
//                ShitXML.Dump(myRoot,"xmlfile.xml"); //this will create xmlfile1.xml or xmlfile2.xml -- see the note below)
//
//
//                ------------------
//
//                NOTE: This module makes use of the "SafeFile" module. At all times (except game startup)
//                      you might find TWO xml files with a similar name in your game folder
//                      (e.g. xmlfile1.txt and xmlfile2.txt). If the game crashes, go into your game folder
//                      and keep only one fo the two files (the one that didn't get corrupted, obviously). 
//                      Delete the other file.
//
////////////////////////////////////////////////////


#define XMLNODE int
#define NONE -1




//these are used only for readibility of XML files by humans. Use "One line" if you're not sure.
enum XMLFormattingStyle {
  eXMLStyle_OneLine,  //The node will be stroed in one line in the file: <tag>66[6</tag>
  eXMLStyle_Block //The node will be stored in several lines: <tag>
                  //                                              66<br>
                  //                                              6<br>
                  //                                          </tag>
};

struct ShitXML
{
  //if you want to create a node meant for your XML document tree. 
  //Note: The node will be useless until you attach it with "AddChild", or use it as a root.
  //That's handy when you need to create a root to start off your XML document, or load it from file.
  //'name' is what comes between < and >, or < and />.
  import static XMLNODE NewNode(String name);

  //Set the formatting style for a node you created. 
  import static void SetFormattingStyle(XMLNODE node,  XMLFormattingStyle style);

  //Open an XML file and load it into a tree document (you need to provide the root, created beforehand with NewNode)
  import static void Parse(XMLNODE root,  String fileName);
  
  //Save an XML document tree into a file
  import static bool Dump(XMLNODE root,  String fileName);
  
  //Add a child node to a parent node, in your XML document tree.
  //Theoritically, you can add as many children as you want.
  import static void AddChild(XMLNODE parent, XMLNODE child) ;
  
  //use these two to iterate on the children of a node.
  //WARNING: Don't try to do it without these functions, as the internal structure is quite tricky
  import static XMLNODE FirstChild(XMLNODE parent);
  import static XMLNODE NextChild(XMLNODE currentChild);
  
  //Delete all the XML document tree, starting from "root" (thus freeing the structure in memory).
  //Be careful not to use "root" after that.
  import static void DeleteAll(XMLNODE root);

  //Set and get the text of a node (between <tag> and </tag>). The _i version is for integers.
  import static void SetParams(XMLNODE node,  String params);
  import static String GetParams(XMLNODE node);
  import static void SetText(XMLNODE node,  String txt);
  import static void SetText_i(XMLNODE node,  int value);
  import static String GetText(XMLNODE node);
  import static int GetText_i(XMLNODE node);
  
  //Get the name of a node's tag. (What comes between < and >, or < and />)
  import static String GetName(XMLNODE node);

};
