// gridlines

// grid specific vars
// grid spacing in pixels
int GRID_MINOR_SPACING = 10;
int GRID_MAJOR_SPACING = 100;
// gridline colors
color GRID_MINOR_COLOR = color(147, 161, 247, 127);
color GRID_MAJOR_COLOR = color(0, 19, 137, 127);
// gridline weights in pixels
int GRID_MINOR_WEIGHT = 1;
int GRID_MAJOR_WEIGHT = 2;
// when true, grid is drawn, else grid is not
boolean GRID_DRAW = true;

// sketch vars go here
int background_color = 255; //white

// grid code
public void drawGrid() {
  if (GRID_DRAW) {
    int num_minor_x = width/GRID_MINOR_SPACING;
    int num_minor_y = height/GRID_MINOR_SPACING;
    int num_major_x = width/GRID_MAJOR_SPACING;
    int num_major_y = height/GRID_MAJOR_SPACING;
    pushStyle();
    strokeCap(PROJECT);
    strokeWeight(GRID_MINOR_WEIGHT);
    stroke(GRID_MINOR_COLOR);
    for (int i = 0; i < num_minor_y; i++) {
      int y = i * GRID_MINOR_SPACING;
      line(0, y, width, y);
    }
    for (int i = 0; i < num_minor_x; i++) {
      int x = i * GRID_MINOR_SPACING;
      line(x, 0, x, height);
    }
    strokeWeight(GRID_MAJOR_WEIGHT);
    stroke(GRID_MAJOR_COLOR);
    for (int i = 0; i < num_major_y; i++) {
      int y = i * GRID_MAJOR_SPACING;
      line(0, y, width, y);
    }
    for (int i = 0; i < num_major_x; i++) {
      int x = i * GRID_MAJOR_SPACING;
      line(x, 0, x, height);
    }
    popStyle();
  }
}

public void setup() {
  size(400,600);
  background(background_color);
}

public void draw() {
  background(background_color);
  
  // do your stuff here
  fill(0);
  rect(40,35, 234,34);
  
  // draw grid on top -- won't draw when GRID_DRAW == false
  drawGrid();
}
