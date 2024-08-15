class Star {
  void show() {
    stroke(random(0, 1) > 0.5 ? 255 : 220, random(0, 255));
    strokeWeight(random(1, 5));
    float x = random(0, width);
    float y = random(0, 1) > 0.5 ?  random(0, height / 2) : random(0, height / 3);
    point(x, y);
  }
}
