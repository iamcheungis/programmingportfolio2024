class Rock {
  // Member Variables
  int x,y,diam,speed;
  PImage r1, r2;
  
  // Constructor
  Rock() {
    x = int(random(width));
    y = -100;
    diam = int(random(20,80));
    speed = int(random(1,5));
    r1 = loadImage("imagestar.png");
    r2 = loadImage("imagestar.png");
  }
  
    
  
  
  //Member Method
  void display() {
    imageMode(CENTER);
    r1.resize(diam, diam);
    image(r1, x, y);
    //r2.resize(diam, diam);
    //image(r2, x+10, y-30);
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
}
