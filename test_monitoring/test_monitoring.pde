// simple meter

//import meter lib
import meter.*;
import processing.serial.*;

PFont font ;
boolean overButton = false;
String title ="CITARUM HARUM";
String title2 ="Sektor VI";
//String nilai;
String tim = " - Tim INACOS Telkom University - ";
float i , speed = 20;

PImage map, citarum, telu, bg,banner;

int mnt = minute();  // Values from 0 - 59
int jam = hour();    // Values from 0 - 23
int hari = day();    // Values from 1 - 31
int bln = month();  // Values from 1 - 12
int thn = year();   // 2003, 2004, 2005, etc.

Serial port;

Meter m, m2, m3, m4;

void setup(){
  // create empty window
   size(1900,1020);
  //surface.setSize(1800,1000);
  //surface.setResizable(true);
  surface.setLocation(5,0);
  //surface.setAlwaysOnTop(true);
 
  font= loadFont("PalatinoLinotype-Bold-48.vlw");
 
  //port
  port = new Serial(this,"COM6", 9600);

  banner = loadImage("banner.png");
  banner.resize(900,180);
  telu = loadImage("telulogo.png");
  telu.resize(120,160);
  citarum = loadImage("maung.png");
  citarum.resize(150,150);
  bg = loadImage("bg.jpg");
  bg.resize(width,height);
  map = loadImage("maps.png");
  map.resize(40, 40);
 
  //String[] lines = loadStrings("xxx.txt");
  //String txt = join(lines, " ");
  //println(txt);
  //printArray(lines);
 
 
 
 
 
  //add default meter
  //TDS kayak
  m = new Meter(this, 260,260); // x and y coordinates of meter's upper left corner
  m.setMeterWidth(400);
  m.setTitleFontSize(20);
  m.setTitleFontName("Arial");
  m.setTitle("Total Dissolve Solids (ppm)");
  m.getMeterHeight();
 
  //change meter scale values
  String[] scaleLabels = {"0","300","600","900","1200"};
  m.setScaleLabels(scaleLabels);
  m.setScaleFontSize(18);
  m.setScaleFontName("Arial");
  m.setScaleFontColor(color(8, 9, 77));
 
  //we can also display the value of meter
  m.setDisplayDigitalMeterValue(true);
 
  //more modifications on meter
  m.setArcColor(color(40, 209, 201));
  m.setArcThickness(15);
 
  m.setMaxScaleValue(1200);
  m.setMinInputSignal(0);
  m.setMaxInputSignal(1200);
 
  m.setNeedleThickness(5);
 
   //M2 ph
  int mx = m.getMeterX(); // c coordinate
  int my = m.getMeterY(); //y coordinate
  int mw = m.getMeterWidth();
  int mz = m.getMeterHeight();
 
  m2 = new Meter(this, mx  , my + mz + 100);
  m2.setMeterWidth(400);
  m2.setTitleFontSize(20);
  m2.setTitleFontName("Arial");
  m2.setTitle("Ph Value");
 
  //change meter scale values
  String[] scaleLabels2 = {"0","2","4","6","8","10","12","14"};
  m2.setScaleLabels(scaleLabels2);
  m2.setScaleFontSize(18);
  m2.setScaleFontName("Arial");
  m2.setScaleFontColor(color(8, 9, 77));
 
    // Set a warning if sensor value is too low.
  m2.setLowSensorWarningActive(true);
  m2.setLowSensorWarningValue((float)4.0);
  // Set a warning if sensor value is too high.
  m2.setHighSensorWarningActive(true);
  m2.setHighSensorWarningValue((float)10.0);
 
  //we can also display the value of meter
  m2.setDisplayDigitalMeterValue(true);
 
  //more modifications on meter
  m2.setArcColor(color(40, 209, 201));
  m2.setArcThickness(15);
 
  m2.setMaxScaleValue(15);
  m2.setMinInputSignal(-15);
  m2.setMaxInputSignal(20);
 
  m2.setNeedleThickness(5);
 
 
  //M3 TDS Drone
  m3 = new Meter(this,(width/2) + mx  , my ); // x and y coordinates of meter's upper left corner
  m3.setMeterWidth(400);
  m3.setTitleFontSize(20);
  m3.setTitleFontName("Arial");
  m3.setTitle("Total Dissolve Solids (ppm)");
  m3.getMeterHeight();
 
  //change meter scale values
  String[] scaleLabels3 = {"0","300","600","900","1200"};
  m3.setScaleLabels(scaleLabels3);
  m3.setScaleFontSize(18);
  m3.setScaleFontName("Arial");
  m3.setScaleFontColor(color(8, 9, 77));
 
  //we can also display the value of meter
  m3.setDisplayDigitalMeterValue(true);
 
  //more modifications on meter
  m3.setArcColor(color(40, 209, 201));
  m3.setArcThickness(15);
 
  m3.setMaxScaleValue(1200);
  m3.setMinInputSignal(0);
  m3.setMaxInputSignal(1200);
 
  m3.setNeedleThickness(5);
 
  //m4 Ph Drone
  m4 = new Meter(this, (width/2) + mx  , my + mz + 100);
  m4.setMeterWidth(400);
  m4.setTitleFontSize(20);
  m4.setTitleFontName("Arial");
  m4.setTitle("Ph Value");
 
  //change meter scale values
  String[] scaleLabels4 = {"0","2","4","6","8","10","12","14"};
  m4.setScaleLabels(scaleLabels4);
  m4.setScaleFontSize(18);
  m4.setScaleFontName("Arial");
  m4.setScaleFontColor(color(8, 9, 77));
 
    // Set a warning if sensor value is too low.
  m4.setLowSensorWarningActive(true);
  m4.setLowSensorWarningValue((float)4.0);
  // Set a warning if sensor value is too high.
  m4.setHighSensorWarningActive(true);
  m4.setHighSensorWarningValue((float)10.0);
 
  //we can also display the value of meter
  m4.setDisplayDigitalMeterValue(true);
 
  //more modifications on meter
  m4.setArcColor(color(40, 209, 201));
  m4.setArcThickness(15);
 
  m4.setMaxScaleValue(15);
  m4.setMinInputSignal(-15);
  m4.setMaxInputSignal(120);
 
  m4.setNeedleThickness(5);
 
 
 
 frameRate(3);
}

//=======================================================================================

void draw(){
   background(bg); // background color
   //int value2 = (int)random(0,800);
   //int value = (int)random(0,14);
   
  image(telu, 20, 10);
  image(citarum, width-160, 10);
 

 
  //Running text
  fill(50); //color
  textSize(20);
  text(tim ,i,height-30);
   i = i + speed;
   if(i > width) {
     i=-380 ;
   }
   
  //title window
   image(banner, 486, 0);
   textFont(font);
   textSize(50); //size
   fill(240); //color
   textAlign(CENTER);
   text(title ,width/2,65);
   text(title2 ,width/2,115);
   
    //Date&Time
  fill(50); //color
  textSize(25);
  textAlign(CENTER);
  text(  hari + " / " + bln + " / " + thn ,width/2 ,190);
  if(jam < 10) {
  text( "0"+jam + ":" + mnt , width/2  ,220);
  }else if (mnt < 10){
  text( jam + ":" + "0"+mnt , width/2  ,220);
  }else if((jam < 10) && (mnt<10)){
  text( "0"+jam + ":" +"0"+ mnt , width/2  ,220);  
  }else {
   text( jam + ":" + mnt , width/2  ,220);  
  }
   
  int mx = m.getMeterX(); // c coordinate
  int my = m.getMeterY();
  int mw = m.getMeterWidth();
  int mz = m.getMeterHeight();
   
  //LINE    
   stroke(150);
   strokeWeight(10);
   line(width/2,260,width/2,height-150);
   
   //GMAPS LOCATION
 image(map, 50, height-95);
  noStroke();
 if (overButton == true) {
    fill(0,0,250,50);
  } else {
    noFill();
  }
  ellipse(70,height-75,40,40);
  fill(50);
  textAlign(LEFT);
  textSize(15);
  text("Koordinat (Kayak) : " +"x"+" , "+"y",100,height-70);
 
   
   textSize(40); //size
   fill(40); //color
   text(" Kadar Logam (Kayak) = "  , mx-100 , my+mz+50);
   
   text(" Kadar Logam (Drone) = " , (width/2)+160 , my+mz+50);
   
   text(" Ph Air (Kayak) = " , mx , my+mz+400);
   
   text(" Ph Air (Drone) = " , (width/2)+200, my+mz+400);
   
   
     if(port.available() > 0){
     String val = port.readString(); //read value arduino
     String[] list = split(val, ',');
     int ph = int(list[0]) ;
     int tds = int(list[1]) ;
     int value = ph;
     int value2 = tds;
     
      m2.updateMeter(value);
      m.updateMeter(value2);
      m4.updateMeter(value);
      m3.updateMeter(value2);
     
      println("Ph (kayak): " + value + "  TDS (kayak): " + value2);
      println("Ph (Drone): " + value + "  TDS (Drone): " + value2 );
   
   textSize(40); //size
   if ((value2 >= 300) && (value2 <500)) {
  fill(255,187,0);
  } else if (value2 >= 500) {
  fill(250,0,0);
  }else if ((value2 >= 150) && (value2 <300)) {
  fill(28,176,43);
  } else {
   fill(42, 252, 10);
  }
   text( value2 , mx + 380, my+mz+50);
   text( value2 , (width/2)+ 380 + mx , my+mz+50);
   
   
   if ((value >= 9 && value <= 11) || (value >= 3 && value <= 4)) {
  fill(255,187,0);
  } else if (value > 11 ) {
  fill(250,0,0);
  }else if(value < 3){
   fill(0,0,250);
  }else {
   fill(28,176,43);
  }
   textSize(40); //size
   text(value, mx + 350, my+mz+400);
   text(value, mx + (width/2)+290, my+mz+400);


 
 }else {
   m.updateMeter(0);
   m2.updateMeter(7);
   m3.updateMeter(0);
   m4.updateMeter(7);
   
   println("Ph (kayak): none " +  "  TDS (kayak): none " );
   println("Ph (Drone): none " + "  TDS (Drone): none "  );
   
   textSize(40); //size
   fill(250,0,0);
   text( "-Lost-" , mx + 380, my+mz+50);
   text( "-Lost-" , (width/2)+ 380 + mx , my+mz+50);
   
   textSize(40); //size
   text("-Lost-", mx + 350, my+mz+400);
   text("-Lost-", mx + (width/2)+290, my+mz+400);
 }

}
 
 void mousePressed() {
  if (overButton) {
    link("https://www.google.co.id/maps/@"+"-6.9739193,"+","+"107.6306716"+",16z?hl=id");
  }
}

void mouseMoved() {
  checkButtons();
}
 
void mouseDragged() {
  checkButtons();
}


 
void checkButtons() {
  if (mouseX > 50 && mouseX < 90 && mouseY > height-95 && mouseY < height-55) {
    overButton = true;  
  } else {
    overButton = false;
  }}
