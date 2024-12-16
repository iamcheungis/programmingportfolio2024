//Isaac Cheung | ColDet | 09 Sept 2024
int xspeed, yspeed, xpos, ypos, wdth, ht;

void setup() {
  size(1000, 1000); //size(displayWidth,displayHeight); doesn't work
  background(0);
  xspeed = 3;
  yspeed = 10;
  wdth = 20;
  ht = 20;
  noStroke();
  xpos = width/2;
  ypos = height/2;
  frameRate(90);
} //<>//

void draw() {
  background(0);
  fill(255);
  ellipse(xpos, ypos, wdth, ht);
  //ellipse(xpos-50, ypos, wdth, ht);
  xpos = xpos + xspeed;
  ypos = ypos + yspeed;
  if (xpos >= width-wdth/2 || xpos <= wdth/2) {
    xspeed = xspeed * -1;
  }
  if (ypos >= height-ht/2 || ypos <= ht/2) {
    yspeed = yspeed * -1;
  }
}
