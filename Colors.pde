int getColorIndex() {
  return floor(random(COLORS.length));
}

color getColor() {
  return COLORS[getColorIndex()];
}

color getColor(String value) {
  int r = Integer.parseInt(value.substring(0, 2), 16);
  int g = Integer.parseInt(value.substring(2, 4), 16);
  int b = Integer.parseInt(value.substring(4, 6), 16);
  return color(r, g, b);
}

JSONArray values;

void loadColors() {
  values = loadJSONArray(COLORS_FILE_PATH);
  COLORS = new color[values.size()];
  for (int i = 0; i < values.size(); i++) {
    COLORS[i] = getColor(values.getString(i));
  }

  println("Colors Array: " + COLORS.toString());
  for (int i = 0; i < values.size(); i++) {
    println("Color " + i + ": " + COLORS[i]);
  }
}
