class Pointer {

  int Shape, drwngT, rr, rri, s2d,K, K2;
  float X, Y, x, y, dir, r = 50, speed, thickness,Size, thOff;
  boolean Repeat, Draw, first;
  Pointer shapMid, myP;

  Pointer(float th, float x$, float y$, boolean a, boolean b, float c, boolean fi) {
    Shape = 1;
    thickness = th;
    X = x$;
    Y = y$;
    Repeat = a;
    Draw = b;
    Size = c;
    first = fi;
    K = (int)random(2, 10);
    K2 = (int)random(4, 16);
    
    circles.add(this);
    rr = (int)random(4, 6);
    s2d = (int)(random(1, 3));
    if (s2d == 1 ) {
      shapMid = new Pointer(2, X, Y, false, false, Size*0.9, (int)random(2, 10), dir, true, this);
      pointers.add(shapMid);
    } else {
      shapMid = new Pointer(2, X, Y, false, false, Size*0.9, (int)random(2, 10), dir,(int)random(2, 10), true, this);
      pointers.add(shapMid);
    }
  }

  Pointer(float th, float x$, float y$, boolean a, boolean b, float c, int d, float e, boolean fi, Pointer _myP) {
    Shape = 2;
    thickness = th;
    X = x$;
    Y = y$;
    Repeat = a;
    Draw = b;
    Size = c;
    K =d;
    thOff = e;
    first = fi;
    myP = _myP;
  }

  Pointer(float th, float x$, float y$, boolean a, boolean b, float c, int d, float e, int f, boolean fi, Pointer _myP) {
    Shape = 3;
    thickness = th;
    X = x$;
    Y = y$;
    Repeat = a;
    Draw = b;
    Size = c;
    K =d;
    K2 =f;
    thOff = e;
    first = fi;
    myP = _myP;
  }

  void move() {

    switch(Shape) {
    case 1:
      speed = 7 / r;
      dir += speed;
      Circle();
      if (dir > 1*drwngT/pow(Size, .5) && !CheckHit()) {
        ellipse(x, y, thickness, thickness);
      }
      break;
    case 2:
      speed = 0.2/sqrt(Size);
      dir += speed;
      Rose();
      if (first) {
        if (dir > 1*drwngT/pow(Size, .5)&& !CheckHitR()) {
          ellipse(x, y, thickness, thickness);
        }
      } else {
        if (dir-thOff > -PI/2 && dir-thOff <PI/2||(dir-thOff > PI/2*3 && dir-thOff <2*PI))
          if (dir > 1*drwngT/pow(Size, .5)&& !CheckHitR()) {
            ellipse(x, y, thickness, thickness);
          }
      }
      break;
    case 3:
      speed = 0.1/sqrt(Size);
      dir += speed;
      Rose2();
      if (first) {
        if (dir > 1*drwngT/pow(Size, .5)&& !CheckHitR()) {
          ellipse(x, y, thickness, thickness);
        }
      } else {
        if (dir-thOff > -PI/2 && dir-thOff <PI/2||(dir-thOff > PI/2*3 && dir-thOff <2*PI))
          if (dir > 1*drwngT/pow(Size, .5)&& !CheckHitR()) {
            ellipse(x, y, thickness, thickness);
          }
      }
      break;
    }

    if (Draw && dir > 10*drwngT/pow(Size, .5) && rri != rr-1) {
      drawShape(s2d);
      drwngT++;
    }



    if (Repeat) {
      if (dir >= 2 * PI)
      {
        dir -=2 * PI;
        Size *= 1.4;
        drwngT = 0;
        s2d = round(random(1, 5));
        K = (int)random(2, 10);
        K2 = (int)random(4, 16);
        rri++;
        if (rri==rr) {
          for (int i=0; i<1; i++) {
            pointer = new Pointer(3, random(-width/2, width/2), random(-height/2, height/2), true, true, random(50, 100), false);
            pointers.add(pointer);
          }
          if (pointers.contains(this))
            pointers.remove(this);
        }
      }
    } else {
      if ((dir-thOff) >= 2 * PI)
      {
        if (pointers.contains(this))
          pointers.remove(this);
      }
    }
  }

  void Circle() {
    r = Size;
    x = r * cos(dir) + X;
    y = r * sin(dir) + Y;
  }

  void Rose() {
    r = pow(cos(K*(dir-thOff)), 2)*Size;
    x = r * cos(dir) + X;
    y = r * sin(dir) + Y;
  }

  void Rose2() {
    r = pow(cos(K*(dir-thOff)), 2)*pow(cos(K2*(dir-thOff)), 2)*Size;
    x = r * cos(dir) + X;
    y = r * sin(dir) + Y;
  }

  void drawShape(int s) {
    Pointer shape;
    switch (s) {
    case 1:
      shape = new Pointer(2, x, y, false, false, r*0.4, K, dir, false, this);
      pointers.add(shape);
      break;
    case 2:
      shape = new Pointer(2, x, y, false, false, r*0.4, K, dir,K2, false, this);
      pointers.add(shape);
      break;
      case 3:
      
      break;
       case 4:
      shape = new Pointer(2, x, y, false, false, r*0.4, K, dir, false, this);
      pointers.add(shape);
      break;
      case 5:
      shape = new Pointer(2, x, y, false, false, r*0.4, K, dir,K2, false, this);
      pointers.add(shape);
      break;
    }
  }

  boolean CheckHit() {
    for (Pointer P : circles) {
      if (P != this) {
        if (pow(pow(x-P.X, 2)+pow(y-P.Y, 2), 0.5)<P.Size*.72)
          return true;
      }
    }
    return false;
  }
  boolean CheckHitR() {
    for (Pointer P : circles) {
      if (P != myP) {
        if (pow(pow(x-P.X, 2)+pow(y-P.Y, 2), 0.5)<P.Size*.72)
          return true;
      }
    }
    return false;
  }
}