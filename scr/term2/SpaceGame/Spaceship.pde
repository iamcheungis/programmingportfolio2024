class Spaceship {
  // Member Variables
  int x, y, w, laserCount, turretCount, health;
  PImage imag;
  // Constructor
  Spaceship() {
    x = width/2;
    y = height/2;
    w = 100;
    laserCount = 200000;
    turretCount = 1;
    health = 100;
  }

  //Member Methods
  void display() {
    imag = loadImage("imageg.png");
    imag.resize(160, 130);
    //strokeWeight(2);
    //fill(50);
    //thruster
    //stroke(100);
    //fill(100);
    //rect(x+10, y+20, 15, 20);
    //rect(x-25, y+20, 15, 20);
    //stroke(80);
    //fill(127);
    //wing
    //fill(#E85252);
    //triangle(x, y-5, x+55, y+30, x-55, y+30);
    //fill(255);
    //triangle(x, y-3, x+40, y-3, x, y+30);
    //triangle(x, y-3, x-40, y-3, x, y+30);
    //fill(99);
    //center
    //fill(#89D1AD);
    //ellipse(x, y, 20, 80);
    //cockpit
    //fill(210);
    //ellipse(x, y-25, 15, 30);
    //missles
    //strokeWeight(3);
    //stroke(200);
    //line(x+51, y+4, x+51, y+25);
    //line(x-51, y+4, x-51, y+25);

    //line(x+25, y-3, x+25, y-15);
    //line(x-25, y-3, x-25, y-15);
    //flames
    //fill(255, 255, 0);
    //stroke(255, 100, 0);
    //triangle(x+10, y+50, x+25, y+50, x+17, y+75);
    //triangle(x-10, y+50, x-25, y+50, x-17, y+75);
  }

  void move(int tempX, int tempY) {
    image(imag, mouseX, mouseY);
    x = tempX;
    y = tempY;
  }

  boolean fire() {
    if (laserCount > 0) {
      return true;
    } else {
      return false;
    }
  }

  boolean intersect(Rock r) {
    float d = dist(x, y, r.x, r.y);
    if (d<50) {
      return true;
    } else {
      return false;
    }
  }
}
