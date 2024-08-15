class Tube {
  void show() {
    PVector s = new PVector(random(200, width - 200), random(200, height - 200));
    PVector e = s.copy().add(PVector.random2D().setMag(random(70, 300)));
    float sr = random(15, 400);
    float er = random(70, 300);

    if (abs(sr - er) > 150) {
      if (sr < er) er = sr + 100;
      else er = max(sr - 100, 50);
    }

    int index = getColorIndex();
    noStroke();
    fill(COLORS[index], 100);
    ellipse(s.x, s.y, sr, sr);
    strokeWeight(2);
    stroke(COLORS[index], random(8, 15));
    noFill();
    int amount = 201;
    for (int i = 0; i < amount; i++) {
      float r = lerp(sr, er, i / (float) amount);
      float x = lerp(s.x, e.x, i / (float) amount);
      float y = lerp(s.y, e.y, i / (float) amount);
      ellipse(x, y, r, r);
    }
    e = s.copy().add(PVector.random2D().setMag(random(70, 300)));
    stroke(COLORS[(index + (COLORS.length / 2)) % COLORS.length]);
    strokeWeight(random(5, 20));
    point(s.x, s.y);
    strokeWeight(2);
    line(s.x, s.y, e.x, e.y);
  }
}
