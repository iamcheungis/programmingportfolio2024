class Laser {
  // Member Variables
  int x,y,w,h,speed;
  PImage l1;
  // Constructor
  Laser(int x, int y) {
    this.x = x;
    this.y = y;
    w = 5;
    h = 15;
    speed = 20;
    l1 = loadImage("imageb.png");
  }
  
  //Member Methods
  void display() {
    image(l1, x, y, 100, 70);
  }
  
  void move() {
    y -= speed;
  }
  
  boolean reachedTop() {
    if(y<-20) {
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
