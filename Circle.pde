class Circle {
  Circle() {}
  
  void filled() {
    color c = color(getColor(), 20);
    float x = random(0, width);
    float y = random(0, height);
    float r = random(500, min(width, height));

    noStroke();
    translate(x, y);
    fill(c);
    ellipse(0, 0, r, r);
  }
  
  void stroked() {
    color c = getColor();
    float x = random(0, width);
    float y = random(0, height);
    float r = random(75, 300);

    stroke(c);
    noFill();
    ellipse(x, y, r, r);
  }
}
