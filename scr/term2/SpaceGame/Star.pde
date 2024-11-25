class Star {
  // Member Variables
  int x,y,diam,speed;
  
  // Constructor
  Star() {
    x = int(random(width));
    y = int(random(height));
    diam = 5;
    speed = int(random(1, 4));
  }
  
  //Member Methods
  void move() {
    y += speed;
    if (y>height) {
      y = 0;
      x = int(random(width));
    }
  }
  
  void display() {
    noStroke();
    fill(255);
    ellipse(x, y, diam, diam);
  }
  
  
  
  boolean reachedBottom() {
    return true;
  }
}
