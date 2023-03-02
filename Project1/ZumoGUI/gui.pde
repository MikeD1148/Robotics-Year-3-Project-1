/* =========================================================
 * ====                   WARNING                        ===
 * =========================================================
 * The code in this tab has been generated from the GUI form
 * designer and care should be taken when editing this file.
 * Only add/edit code inside the event handlers i.e. only
 * use lines between the matching comment tags. e.g.

 void myBtnEvents(GButton button) { //_CODE_:button1:12356:
     // It is safe to enter your event code here  
 } //_CODE_:button1:12356:
 
 * Do not rename this tab!
 * =========================================================
 */

public void imgButton3_click1(GImageButton source, GEvent event) { //_CODE_:imgButton3:410383:
  println("imgButton3 - GImageButton >> GEvent." + event + " @ " + millis());
} //_CODE_:imgButton3:410383:

public void button1_click1(GButton source, GEvent event) { //_CODE_:button1:747197:
  println("button1 - GButton >> GEvent." + event + " @ " + millis());
  connexion.write("w");
} //_CODE_:button1:747197:

public void button2_click1(GButton source, GEvent event) { //_CODE_:button2:448939:
  println("button2 - GButton >> GEvent." + event + " @ " + millis());
  connexion.write("d");
} //_CODE_:button2:448939:

public void button3_click1(GButton source, GEvent event) { //_CODE_:button3:631177:
  println("button3 - GButton >> GEvent." + event + " @ " + millis());
  connexion.write("a");
} //_CODE_:button3:631177:

public void button4_click1(GButton source, GEvent event) { //_CODE_:button4:699175:
  println("button4 - GButton >> GEvent." + event + " @ " + millis());
  connexion.write("e");
} //_CODE_:button4:699175:

public void button5_click1(GButton source, GEvent event) { //_CODE_:button5:349104:
  println("button5 - GButton >> GEvent." + event + " @ " + millis());
  connexion.write("s");
} //_CODE_:button5:349104:

public void button6_click1(GButton source, GEvent event) { //_CODE_:button6:661260:
  println("button6 - GButton >> GEvent." + event + " @ " + millis());
  connexion.write("q");
} //_CODE_:button6:661260:

public void button7_click1(GButton source, GEvent event) { //_CODE_:button7:275198:
  println("button7 - GButton >> GEvent." + event + " @ " + millis());
  connexion.write("x");
} //_CODE_:button7:275198:

public void button8_click1(GButton source, GEvent event) { //_CODE_:button8:320046:
  println("button8 - GButton >> GEvent." + event + " @ " + millis());
  connexion.write("z");
} //_CODE_:button8:320046:

public void button9_click1(GButton source, GEvent event) { //_CODE_:button9:691528:
  println("button9 - GButton >> GEvent." + event + " @ " + millis());
  connexion.write(" ");
} //_CODE_:button9:691528:

synchronized public void win_draw2(PApplet appc, GWinData data) { //_CODE_:window1:962878:
  appc.background(230);
} //_CODE_:window1:962878:

public void textarea1_change1(GTextArea source, GEvent event) { //_CODE_:textarea1:982875:
  println("textarea1 - GTextArea >> GEvent." + event + " @ " + millis());
} //_CODE_:textarea1:982875:

synchronized public void win_draw3(PApplet appc, GWinData data) { //_CODE_:window2:599974:
  appc.background(230);
} //_CODE_:window2:599974:

public void imgButton4_click1(GImageButton source, GEvent event) { //_CODE_:imgButton4:488877:
  println("imgButton4 - GImageButton >> GEvent." + event + " @ " + millis());
} //_CODE_:imgButton4:488877:

public void textfield1_change1(GTextField source, GEvent event) { //_CODE_:textfield1:255966:
  println("textfield1 - GTextField >> GEvent." + event + " @ " + millis());
  String inputs = textfield1.getText();
  char instruction = inputs.charAt(inputs.length() - 1);
  connexion.write(instruction);
} //_CODE_:textfield1:255966:



// Create all the GUI controls. 
// autogenerated do not edit
public void createGUI(){
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.BLUE_SCHEME);
  G4P.setMouseOverEnabled(false);
  surface.setTitle("Sketch Window");
  imgButton3 = new GImageButton(this, 119, 141, 250, 225, new String[] { "car5.jpg", "car5.jpg", "car5.jpg" } );
  imgButton3.addEventHandler(this, "imgButton3_click1");
  button1 = new GButton(this, 174, 39, 130, 103);
  button1.setIcon("uparrow.png", 1, GAlign.EAST, GAlign.RIGHT, GAlign.MIDDLE);
  button1.setText("Face text");
  button1.setLocalColorScheme(GCScheme.SCHEME_8);
  button1.addEventHandler(this, "button1_click1");
  button2 = new GButton(this, 342, 208, 130, 105);
  button2.setIcon("rightarrow.png", 1, GAlign.EAST, GAlign.RIGHT, GAlign.MIDDLE);
  button2.setText("Face text");
  button2.setLocalColorScheme(GCScheme.SCHEME_8);
  button2.addEventHandler(this, "button2_click1");
  button3 = new GButton(this, 7, 199, 130, 105);
  button3.setIcon("leftarrow.png", 1, GAlign.EAST, GAlign.RIGHT, GAlign.MIDDLE);
  button3.setText("Face text");
  button3.setLocalColorScheme(GCScheme.SCHEME_8);
  button3.addEventHandler(this, "button3_click1");
  button4 = new GButton(this, 318, 69, 130, 104);
  button4.setIcon("uprightarrow.png", 1, GAlign.EAST, GAlign.RIGHT, GAlign.MIDDLE);
  button4.setText("Face text");
  button4.setLocalColorScheme(GCScheme.SCHEME_8);
  button4.addEventHandler(this, "button4_click1");
  button5 = new GButton(this, 174, 361, 130, 103);
  button5.setIcon("downarrow.png", 1, GAlign.EAST, GAlign.RIGHT, GAlign.MIDDLE);
  button5.setText("Face text");
  button5.setLocalColorScheme(GCScheme.SCHEME_8);
  button5.addEventHandler(this, "button5_click1");
  button6 = new GButton(this, 28, 75, 130, 103);
  button6.setIcon("upleftarrow.png", 1, GAlign.EAST, GAlign.RIGHT, GAlign.MIDDLE);
  button6.setText("Face text");
  button6.setLocalColorScheme(GCScheme.SCHEME_8);
  button6.addEventHandler(this, "button6_click1");
  button7 = new GButton(this, 317, 334, 130, 103);
  button7.setIcon("downrightarrow.png", 1, GAlign.EAST, GAlign.RIGHT, GAlign.MIDDLE);
  button7.setText("Face text");
  button7.setLocalColorScheme(GCScheme.SCHEME_8);
  button7.addEventHandler(this, "button7_click1");
  button8 = new GButton(this, 26, 331, 130, 105);
  button8.setIcon("downleftarrow.png", 1, GAlign.EAST, GAlign.RIGHT, GAlign.MIDDLE);
  button8.setText("Face text");
  button8.setLocalColorScheme(GCScheme.SCHEME_8);
  button8.addEventHandler(this, "button8_click1");
  button9 = new GButton(this, 10, 6, 80, 54);
  button9.setIcon("stop.png", 1, GAlign.EAST, GAlign.RIGHT, GAlign.MIDDLE);
  button9.setText("Face text");
  button9.setLocalColorScheme(GCScheme.SCHEME_8);
  button9.addEventHandler(this, "button9_click1");
  window1 = GWindow.getWindow(this, "Window title", 600, -100, 500, 500, JAVA2D);
  window1.noLoop();
  window1.setActionOnClose(G4P.KEEP_OPEN);
  window1.addDrawHandler(this, "win_draw2");
  textarea1 = new GTextArea(window1, 48, 37, 376, 405, G4P.SCROLLBARS_NONE);
  textarea1.setOpaque(true);
  textarea1.addEventHandler(this, "textarea1_change1");
  label2 = new GLabel(window1, 51, 9, 369, 25);
  label2.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label2.setText("Body Location Log");
  label2.setOpaque(false);
  window2 = GWindow.getWindow(this, "Window title", 0, -100, 500, 500, JAVA2D);
  window2.noLoop();
  window2.setActionOnClose(G4P.KEEP_OPEN);
  window2.addDrawHandler(this, "win_draw3");
  imgButton4 = new GImageButton(window2, 44, 93, 408, 369, new String[] { "black.png", "black.png", "black.png" } );
  imgButton4.addEventHandler(this, "imgButton4_click1");
  textfield1 = new GTextField(window2, 224, 419, 52, 42, G4P.SCROLLBARS_NONE);
  textfield1.setLocalColorScheme(GCScheme.SCHEME_15);
  textfield1.setOpaque(true);
  textfield1.addEventHandler(this, "textfield1_change1");
  label1 = new GLabel(window2, 200, 366, 100, 41);
  label1.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label1.setText("Click Box To Use Controller");
  label1.setOpaque(false);
  window1.loop();
  window2.loop();
}

// Variable declarations 
// autogenerated do not edit
GImageButton imgButton3; 
GButton button1; 
GButton button2; 
GButton button3; 
GButton button4; 
GButton button5; 
GButton button6; 
GButton button7; 
GButton button8; 
GButton button9; 
GWindow window1;
GTextArea textarea1; 
GLabel label2; 
GWindow window2;
GImageButton imgButton4; 
GTextField textfield1; 
GLabel label1; 