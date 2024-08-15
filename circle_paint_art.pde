int STAR_AMOUNT = 200;

color[] COLORS;
String COLORS_FILE_PATH = "colors/blue-red.json";

int CONTOUR_MARGIN = 100;
boolean CONTOUR_ROTATE = true;
int CONTOUR_MIN_THICKNESS = 10;
int CONTOUR_MAX_THICKNESS = 20;
int CONTOUR_MIN_LENGTH = 40;
int CONTOUR_MAX_LENGTH = 220;
float CONTOUR_MIN_ANGLE = -QUARTER_PI / 5;
float CONTOUR_MAX_ANGLE = QUARTER_PI / 5;

int LINE_MIN_LENGTH = 50;
int LINE_MAX_LENGTH = 300;

boolean SAVE_IMAGES = true;

int NB_1 = 3;
int NB_2 = 10;
int NB_3 = 10;
int NB_4 = 500;
int NB_5 = 200;

void setup() {
  size(1080, 1920);
  loadColors();
  
  gradientBackground();
  for (int i = 0; i < STAR_AMOUNT; i++) {
    new Star().show();
  }
}

int  i = 0;
void draw() {
  if (i <= NB_1) {
    new Circle().filled();
  } else if (i <= NB_1 + NB_2) {
    new Circle().stroked();
  } else if (i <= NB_1 + NB_2 + NB_3) {
    new Tube().show();
  } else if (i <= NB_1 + NB_2 + NB_3 + NB_4) {
    new Contour(getContourSide(), getColor()).show();
  } else if (i < NB_1 + NB_2 + NB_3 + NB_4 + NB_5) {
    new Line().show();
  } else {
    noLoop();   
  }
   
  if (SAVE_IMAGES) {
    save(String.format("images/%d.png", i));
  }

  i++;
}

void keyPressed() {
  if (keyCode == 82) {
    gradientBackground();
    for (int i = 0; i < STAR_AMOUNT; i++) {
      new Star().show();
    }
  } else if (keyCode == 83) {
    save("image.png");
  }
}

void gradientBackground() {
  int max = COLORS.length - 1;
  for (int i = 0; i < max; i++) {
    for (int y = 0; y <= height / max; y++) {
      stroke(lerpColor(COLORS[i], COLORS[i + 1], (float) y / (height / max)));
      line(0, y + (i * height / max), width, y + (i * height / max));
    }
  }
}
