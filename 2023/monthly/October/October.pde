import java.time.DayOfWeek;
import java.util.Map;

PGraphics calendarLayer;

void setup() {
    size(360, 800); // Pixel 7aの大きさ 9:20
    background(0);

    calendarLayer = (new GetCalendarLayerUseCase(width, height / 2, 2023, 8)).getCalendarLayer();
}

void draw() {
    image(calendarLayer, 0, height / 2);
}