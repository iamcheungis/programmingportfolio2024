public class RectangularPrism {
  
  int rl;
  int rw;
  int rh;
  
  RectangularPrism(int rl, int rw, int rh) {
      this.rl = rl;
      this.rw = rw;
      this.rh = rh;
  }

   
  public int calcVol() {
    int vol = rl*rw*rh;
    return vol;
  }
  public int calSurfArea() {
    //calculate surface area
    int sa = 2*rl*rw + 2*rl*rh + 2*rh*rw;
    return sa;
  }
  
}