/**
 Gamepad processing
 */

import org.gamecontrolplus.gui.*;
import org.gamecontrolplus.*;
import net.java.games.input.*;

ControlIO control;
Configuration config;
ControlDevice gpad;

String data = "", s = "|";  //data string and separator char

public void setup() {
  size(500, 200);
  control = ControlIO.getInstance(this);  // Initialise the ControlIO
  gpad = control.getMatchedDevice("config.txt");  // Find a device that matches the configuration file
  if (gpad == null) {
    println("No suitable device configured");
    System.exit(-1);  // End the program NOW!
  }
}

public void draw() {
  background(200);
  
  /* format for gamepad input variables */
  //boolean button = gpad.getButton("B4").pressed();    //button state:  true || false
  //float slider = gpad.getSlider("RLT").getValue();    //slider value:  -1 to 1
  //int hat = gpad.getHat("HT").getPos();              //hat value:      0 || 1 to 8
  
  int xl = int(map(gpad.getSlider("XL").getValue(),-1,1,0,100));
  int yl = int(map(gpad.getSlider("YL").getValue(),-1,1,0,100));
  int rlt = int(map(gpad.getSlider("RLT").getValue(),-1,1,0,100));    //map slider value to int, 0 to 100
  int xr = int(map(gpad.getSlider("XR").getValue(),-1,1,0,100));
  int yr = int(map(gpad.getSlider("YR").getValue(),-1,1,0,100));
  int b1 = gpad.getButton("B1").pressed() ? 1 : 0;
  int b2 = gpad.getButton("B2").pressed() ? 1 : 0;
  int b3 = gpad.getButton("B3").pressed() ? 1 : 0;
  int b4 = gpad.getButton("B4").pressed() ? 1 : 0;
  int lb = gpad.getButton("LB").pressed() ? 1 : 0;          //map button value to int, 0 or 1
  int rb = gpad.getButton("RB").pressed() ? 1 : 0;
  int sl = gpad.getButton("SL").pressed() ? 1 : 0;
  int st = gpad.getButton("ST").pressed() ? 1 : 0;
  int bl = gpad.getButton("BL").pressed() ? 1 : 0;
  int br = gpad.getButton("BR").pressed() ? 1 : 0;
  int ht = gpad.getHat("HT").getPos();
  
  //background(map(xl, 0, 100, 0, 255), map(yl, 0, 100, 0, 255), map(rlt, 0, 100, 0, 255));
  
  data = xl+s+yl+s+rlt+s+xr+s+yr+s+b1+s+b2+s+b3+s+b4+s+lb+s+rb+s+sl+s+st+s+bl+s+br+s+ht; //combine input into one data variable

  fill(0);
  textAlign(CENTER, CENTER);
  int txt = 25;
  textSize(txt);
  text("Gamepad values", width/2, height/2 - txt * 2);
  text(data, width/2, height/2);
}
