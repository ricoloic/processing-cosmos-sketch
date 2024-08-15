float lineNoise = 2143.1234;

class Line {
  void show() {
    float h = random(LINE_MIN_LENGTH, LINE_MAX_LENGTH);
    PVector s = new PVector(
      random(100, width - 100),
      noise(lineNoise) * height - h
    );
    float ex = s.x;
    float ey = s.y + h;
    int index = getColorIndex();
    strokeWeight(random(3, 10));
    stroke(COLORS[index]);
    point(lerp(s.x, ex, 0.5), lerp(s.y, ey, 0.5));
    strokeWeight(1);
    stroke(COLORS[(index + (COLORS.length / 2)) % COLORS.length]);
    line(s.x, s.y, ex, ey);
    lineNoise += 0.005;
  }
}
