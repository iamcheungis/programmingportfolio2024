class Powerup {
  // Member Variables
  int x,y,diam,speed;
  char type;
  PImage r1, r2, r3;
  
  // Constructor
  Powerup() {
    x = int(random(width));
    y = -300;
    diam  = int(random(70, 140));
    speed = int(random(1, 5));
    int rand = int(random(4));
    if(rand == 0) {
      r1 = loadImage("redbox.png");
      if (r1 != null) {
        r1.resize(diam, diam);
      }
      
      type = 'h';
    } else if(rand == 1) {
      r2 = loadImage("ammobox.png");
      if(r2 != null) {
        r2.resize(diam, diam);
      }
      type = 'a';
    } if(rand == 2) {
      r3 = loadImage("turret.png");
      if(r3 != null) {
        r3.resize(diam, diam);
      }
      type = 't';
    } 
  }
  
  //Member Method
  void display() {
    if(type == 'h' && r1 != null) {
      image(r1, x, y);
    } else {
      if(type == 'a') {
        image(r2, x, y);
    } else if(type == 't') {
        image(r3, x, y);
    }
    
    //ellipse(x, y, 30, 30);
    
  }
 } 
  void move() {
    y += speed;
  }
  
  boolean reachedBottom() {
    if(y>height+50) {
      return true;
    } else {
      return false;
    }
  }
  
  boolean intersect(Spaceship s) {
    float d = dist(x, y, s.x, s.y);
    if(d<50) {
      return true;
    } else {
      return false;
    }
  }
}
