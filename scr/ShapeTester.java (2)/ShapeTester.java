import java.util.Scanner;

public class ShapeTester {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        
        System.out.println("Welcome to Shape Tester! Let's find the volume and surface area for boxes, spheres, pyramids, and prisms.");
        while(true){
        System.out.println("To build a box, press 1");
        System.out.println("To build a sphere, press 2");
        System.out.println("To build a pyramid, press 3");
        System.out.println("To build a rectangular prism, press 4");
        
        int number = scanner.nextInt();
        
        if (number == 1) {
            
            System.out.println("Let's start with a box! Please enter the length of the box.");
            int length = scanner.nextInt();
            System.out.println("Please enter the width of the box:");
            int width = scanner.nextInt();
            System.out.println("Please enter the height of the box:");
            int height = scanner.nextInt();
            
            
            Box box = new Box(length, width, height);
            int volume = box.calcVol();
            int surfaceArea = box.calSurfArea();
            
            
            System.out.println("The volume of your box is: " + volume);
            System.out.println("The surface area of your box is: " + surfaceArea);
        } 
        
        if (number == 2){
            System.out.println("Let's start with a sphere! Please enter the radius.");
            int radius = scanner.nextInt();
            
            Sphere sphere = new Sphere(radius);
            double volume = sphere.calcVol();
            double sa = sphere.calcSurfArea();
            
            System.out.println("The volume of your sphere is: " + volume);
            System.out.println("The surface area of your sphere is: " + sa);
        }
        
        if (number == 3) {
            System.out.println("Let's start with a pyramid! Please enter the base length.");
            int baseLength = scanner.nextInt();
            System.out.println("Please enter the base width.");
            int baseWidth = scanner.nextInt();
            System.out.println("Please enter the height.");
            int height = scanner.nextInt();
            
            Pyramid pyramid = new Pyramid(baseLength, baseWidth, height);
            double volume = pyramid.calcVol();
            double surfaceArea = pyramid.calcSurfArea();
            
            System.out.println("The volume of your pyramid is: " + volume);
            System.out.println("The surface area of your box is: " + surfaceArea);
            
        }
        
        if (number == 4) {
            System.out.println("Let's start with a rectangular prism! Please enter the width.");
            int width = scanner.nextInt();
            System.out.println("Please enter the length of the box:");
            int length = scanner.nextInt();
            System.out.println("Please enter the height of the box:");
            int height = scanner.nextInt();
            
            
            Box box = new Box(length, width, height);
            int volume = box.calcVol();
            int surfaceArea = box.calSurfArea();
            
            
            System.out.println("The volume of your rectangular prism is: " + volume);
            System.out.println("The surface area of your rectangular prism is: " + surfaceArea);
        }
        
        
        
        
    }
    }
}