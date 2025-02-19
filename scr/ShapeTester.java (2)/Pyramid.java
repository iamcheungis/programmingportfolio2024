public class Pyramid {
  
  int baseLength;
  int baseWidth;
  int height;
  
  Pyramid(int baseLength, int baseWidth, int height) {
      this.baseLength = baseLength;
      this.baseWidth = baseWidth;
      this.height = height;
  }

   
  public double calcVol() {
    double vol = (1.0 / 3.0) * baseLength * baseWidth * height;
    return vol;
  }
  public double calcSurfArea() {
      double slantHeight = Math.sqrt(Math.pow((baseLength / 2.0), 2) + Math.pow(height, 2));
      return baseLength * baseWidth + 2 * baseLength * slantHeight + 2 * baseWidth * slantHeight;
  }
  
}