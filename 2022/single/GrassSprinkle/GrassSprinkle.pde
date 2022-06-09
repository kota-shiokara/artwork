void setup() {
    size(800, 600, P3D);
    joonsSetup();
}

void draw() {
    joonsBeginRender();
    jr.background(0, 255, 255); //background(gray), or (r, g, b), like Processing.
    jr.background("gi_instant"); //Global illumination, normal mode.
    //jr.background("gi_ambient_occlusion"); //Global illumination, ambient occlusion mode.

    jr.fill("diffuse", 120, 120, 120);
    int floorSize = 10000;
    int floorZ = -150;
    beginShape(QUADS);
    vertex(floorSize, -floorSize, floorZ);
    vertex(-floorSize, -floorSize, floorZ);
    vertex(-floorSize, floorSize, floorZ);
    vertex(floorSize, floorSize, floorZ);
    endShape();

    jr.fill("light", 30, 30, 30, 64);
    int lightSize = 50;
    int lightZ = 100;
    beginShape(QUADS);
    vertex(lightSize, -lightSize, lightZ);
    vertex(-lightSize, lightSize, lightZ);
    vertex(-lightSize, lightSize, lightZ);
    vertex(lightSize, lightSize, lightZ);
    endShape();

    int planeSize = 50;
    for(int i = 0; i < 100; i++) {
        jr.fill("glass", 255, 255, 255);
        pushMatrix();
        float randomX = random(-planeSize, planeSize);
        float randomY = random(-planeSize, planeSize);
        float randomZ = random(-140, 50);
        translate(randomX, randomY, randomZ);
        sphere(1);
        popMatrix();
    }
  
    joonsEndRender();
}