int indigo = #4b0082;
int darkPurple = #0f001a;
int pumpkin = #e6a34f;

void setup() {
    size(600, 600);
    background(0);
}

void draw() {
    background(darkPurple);
    translate(width / 2, height / 2);
    blendMode(ADD);


    centerCircle();
    capsulePumpkin();
    stars();
    ghosts();
}

void centerCircle() {
    noStroke();
    fill(indigo);
    ellipseMode(CENTER);
    ellipse(0, 0, width * 2 / 3, height * 2 / 3);
}

void capsulePumpkin() {
    float rot = PI / 18;
    float rotTwo = -PI / 6;
    float capsuleX = 40;
    float capsuleWidth = 40;
    float capsuleHeight = height - height / 18;
    float cupsuleRad = 40;

    noStroke();
    fill(pumpkin);
    rotate(rot);
    rectMode(CENTER);
    rect(capsuleX, 0, capsuleWidth, capsuleHeight, cupsuleRad);
    rect(capsuleX + capsuleWidth + 10, 0, capsuleWidth, capsuleHeight, cupsuleRad);
    rotate(-rot);

    rotate(rotTwo);
    rect(- capsuleX * 3, 0, capsuleWidth, capsuleHeight, cupsuleRad);
    rotate(-rotTwo);
}

void stars() {
    float scaleValue = 5.0;
    float rot = PI / 6;

    scale(1 / scaleValue);

    fill(255);
    star(-160 * scaleValue, -160 * scaleValue, 30, 70, 5);
    rotate(rot);
    star(-100 * scaleValue, -240 * scaleValue, 30, 70, 5);
    rotate(-rot);

    scale(scaleValue);
}

// This function was borrowed from a Processing Foundation example
// https://processing.org/examples/star.html
void star(float x, float y, float radius1, float radius2, int npoints) {
  float angle = TWO_PI / npoints;
  float halfAngle = angle/2.0;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius2;
    float sy = y + sin(a) * radius2;
    vertex(sx, sy);
    sx = x + cos(a+halfAngle) * radius1;
    sy = y + sin(a+halfAngle) * radius1;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}

void ghosts() {
    ghost(-width / 2 + 40, height / 2 - 25, PI / 6);

    ghost(width / 2 - 40, -height / 2 + 40, -PI / 4);
}

void ghost(float ghostX, float ghostY, float rot) {
    blendMode(BLEND);
    float ghostSize = 50;

    fill(255);
    translate(ghostX, ghostY);
    rotate(rot);

    // head and body
    ellipse(0, -ghostSize / 2, ghostSize, ghostSize);
    rect(0, 0, ghostSize, ghostSize);
    
    // legs
    float ghostLegSize = ghostSize / 3;
    ellipse(-ghostLegSize, ghostSize / 2, ghostLegSize, ghostLegSize);
    ellipse(0, ghostSize / 2, ghostLegSize, ghostLegSize);
    ellipse(ghostLegSize, ghostSize / 2, ghostLegSize, ghostLegSize);

    // eyes
    float ghostEyeSize = ghostLegSize * 2 / 3;
    fill(0);
    ellipse(-ghostLegSize, -ghostSize / 2, ghostEyeSize, ghostEyeSize);
    ellipse(0, -ghostSize / 2, ghostEyeSize, ghostEyeSize);
    rotate(-rot);
    translate(-ghostX, -ghostY);
}

void ghost() {
    blendMode(BLEND);
    float ghostSize = 50;

    fill(255);

    float ghostX = -width / 2 + 40;
    float ghostY = height / 2 - 25;
    float rot = PI / 6;
    translate(ghostX, ghostY);
    rotate(rot);

    // head and body
    ellipse(0, -ghostSize / 2, ghostSize, ghostSize);
    rect(0, 0, ghostSize, ghostSize);
    
    // legs
    float ghostLegSize = ghostSize / 3;
    ellipse(-ghostLegSize, ghostSize / 2, ghostLegSize, ghostLegSize);
    ellipse(0, ghostSize / 2, ghostLegSize, ghostLegSize);
    ellipse(ghostLegSize, ghostSize / 2, ghostLegSize, ghostLegSize);

    // eyes
    float ghostEyeSize = ghostLegSize * 2 / 3;
    fill(0);
    ellipse(-ghostLegSize, -ghostSize / 2, ghostEyeSize, ghostEyeSize);
    ellipse(0, -ghostSize / 2, ghostEyeSize, ghostEyeSize);

    translate(-ghostX, -ghostY);
    rotate(-rot);
}


int frame = 1;
void keyPressed() {
    if(key == 's') {
        save("frame/" + frame++ + ".png");
    }
}