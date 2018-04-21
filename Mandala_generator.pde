Pointer pointer;
int stepsPerFrame;

ArrayList<Pointer> pointers= new ArrayList<Pointer>();
ArrayList<Pointer> circles= new ArrayList<Pointer>();
void setup() {

  fullScreen(0);
  pointer = new Pointer(3, random(-width/2,width/2), random(-height/2,height/2), true, true, random(50, 100),true);
  background(20);
  pointer.move();
  stepsPerFrame = 5;
  pointers.add(pointer);
}

void draw() {

  translate(width/2, height/2);
  scale(1, -1);
  noStroke();
  fill(255);


  for (int i = 0; i<stepsPerFrame; i++) {
    for (int a = 0; a<pointers.size(); a++) {
      if (pointers.get(a) != null)
        pointers.get(a).move();
    }
  }
}


void keyReleased() {
  if (keyCode == 'S') {
    int s = second();  // Values from 0 - 59
    int m = minute();  // Values from 0 - 59
    int h = hour();    // Values from 0 - 23
    int d = day();    // Values from 1 - 31
    int mo = month();  // Values from 1 - 12
    int y = year();   // 2003, 2004, 2005, etc.

    save("Mandala "+ y + "-" + mo + "-" + d + "  " + h + "h" + m + "m" + s +  "s" + ".png");
  }
}