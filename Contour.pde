enum ContourSide {
  NONE,
  TOP,
  RIGHT,
  BOTTOM,
  LEFT
}

ContourSide[] CONTOUR_SIDES = {ContourSide.TOP, ContourSide.RIGHT, ContourSide.BOTTOM, ContourSide.LEFT};

ContourSide getContourSide() {
  return CONTOUR_SIDES[floor(random(CONTOUR_SIDES.length))];
}

class Contour {
  ContourSide side = ContourSide.NONE;
  color c = color(255);
  float x = 0;
  float y = 0;
  float w = 0;
  float h = 0;
  
  Contour(ContourSide side, color c) {
    this.side = side;
    this.c = c;
  }
  
  void top() {
    w = getLength();
    h = getThickness();
    x = random(CONTOUR_MARGIN + w / 2, width - CONTOUR_MARGIN - w / 2);
    y = CONTOUR_MARGIN + getWiggle();
  }
  
  void left() {
    w = getThickness();
    h = getLength();
    y = random(CONTOUR_MARGIN + h / 2, height - CONTOUR_MARGIN - h / 2);
    x = CONTOUR_MARGIN + getWiggle();
  }
  
  void right() {
    w = getThickness();
    h = getLength();
    y = random(CONTOUR_MARGIN + h / 2, height - CONTOUR_MARGIN - h / 2);
    x = width - CONTOUR_MARGIN + getWiggle();
  }
  
  void bottom() {
    w = getLength();
    h = getThickness();
    x = random(CONTOUR_MARGIN + w / 2, width - CONTOUR_MARGIN - w / 2);
    y = height - CONTOUR_MARGIN + getWiggle();
  }
  
  void show() {
    if (side == ContourSide.NONE) return;
    
    if (side == ContourSide.TOP) top();
    else if (side == ContourSide.RIGHT) right();
    else if (side == ContourSide.BOTTOM) bottom();
    else if (side == ContourSide.LEFT) left();
    
    pushMatrix();
    rectMode(CENTER);
    translate(x, y);
    rotate(getAngle());
    fill(c, random(30, 70));
    noStroke();
    rect(0, 0, w, h);
    popMatrix();
  }
  
  float getAngle() {
    return random(CONTOUR_MIN_ANGLE, CONTOUR_MAX_ANGLE);
  }
  
  float getWiggle() {
    return random(-5, 5);
  }
  
  float getLength() {
    return random(CONTOUR_MIN_LENGTH, CONTOUR_MAX_LENGTH);
  }
  
  float getThickness() {
    return random(CONTOUR_MIN_THICKNESS, CONTOUR_MAX_THICKNESS);
  }
}
