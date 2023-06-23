String tim = " - Tim INACOS Telkom University - ";
float i , speed = 30;
String ph;


void setup(){
  fullScreen();
  surface.setSize(415,70);
  surface.setResizable(true);
  surface.setLocation(0,600);
  surface.setAlwaysOnTop(true);
 
}

void draw(){
  background(240);
 
  int value1 = (int)random(300,400);
  int value2 = (int)random(6,14);
 
  stroke(140, 0, 0);
  strokeWeight(3.5);
  line(360, height-120, 360, height-23);
  stroke(50);
  strokeWeight(1.5);
  line(20, height-60, 335, height-60);
 
 
  //TEXT STYLE
  fill(50); //color
  textSize(30);
  text(" PH :     "  + "| TDS :        ppm"  ,0 ,height-95);
  fill(200,0,0);
  text( value2 , 70 ,height-95);
  text( value1 , 220 ,height-95);
  fill(50);

  //RUNNING TEXT
  textSize(15);
  text(tim ,i,height-5);
  i = i + speed;
  if(i > 75) {
  speed=speed*-1 ;
  } if( i < 0){
  speed=speed*-1;
  }
 delay(1000);
}
