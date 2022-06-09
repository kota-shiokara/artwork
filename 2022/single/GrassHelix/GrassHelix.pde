void setup() {
    size(800, 600, P3D);
    joonsSetup();
}

void draw() {
    joonsBeginRender();

    jr.background(255, 255, 255); //background(gray), or (r, g, b), like Processing.
    // jr.background("gi_instant");

    jr.fill("diffuse", 120, 120, 120);
    int floorSize = 10000;
    int floorY = 120;
    beginShape(QUADS);
    vertex(floorSize, floorY, -floorSize);
    vertex(-floorSize, floorY, -floorSize);
    vertex(-floorSize, floorY, floorSize);
    vertex(floorSize, floorY, floorSize);
    endShape();

    jr.fill("light", 30, 30, 30, 64);
    int lightSize = 80;
    int lightY = -80;
    beginShape(QUADS);
    vertex(lightSize, lightY, -lightSize);
    vertex(-lightSize, lightY, lightSize);
    vertex(-lightSize, lightY, lightSize);
    vertex(lightSize, lightY, lightSize);
    endShape();

    int sphereSize = 3;
    for(int i = floorY - sphereSize; i > lightY; i -= 2) {
        jr.fill("glass", 255, 255, 255);
        float x = 30 * sin(i);
        float z = 30 * cos(i);
        pushMatrix();
        translate(x, i, z);
        sphere(sphereSize);
        popMatrix();

        pushMatrix();
        translate(-x, i, -z);
        sphere(sphereSize);
        popMatrix();
    }
    
    joonsEndRender();
}
