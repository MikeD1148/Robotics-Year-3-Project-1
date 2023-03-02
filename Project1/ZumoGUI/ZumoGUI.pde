import g4p_controls.*;
import processing.serial.*;
// You can remove the PeasyCam import if you are not using
// the GViewPeasyCam control or the PeasyCam library.
//import peasy.*;

Serial connexion;;

public void setup(){
  String portName = Serial.list()[0];
  connexion = new Serial(this, portName, 9600);
  size(500, 500, JAVA2D);
  createGUI();
  customGUI();
  // Place your setup code here
  
}

public void draw(){
  background(230);
  
  while (connexion.available() > 0)
  {
  String msg = connexion.readStringUntil('.');
  if (msg != null)
    {
    textarea1.appendText(msg + "\n\n");
    }
  } 
  
}

// Use this method to add additional statements
// to customise the GUI controls
public void customGUI(){

}
