class GetCalendarLayerUseCase {
    private PGraphics calendarLayer;

    GetCalendarLayerUseCase(int contentWidth, int contentHeight) {
        calendarLayer = setupCalendar(contentWidth, contentHeight);
    }

    public PGraphics getCalendarLayer() {
        return this.calendarLayer;
    }
    
    private PGraphics setupCalendar(int contentWidth, int contentHeight) {
        // Setup
        GetDayOfWeekUseCase getDayOfWeekUseCase = new GetDayOfWeekUseCase();
        Map<Integer, DayOfWeek> calendarMap = getDayOfWeekUseCase.getDayOfWeekCurrentMonth();
        PGraphics calendarLayer = createGraphics(contentWidth, contentHeight);
        
        final int widthCell = contentWidth / 9;
        final int heightCell = contentHeight / 7;
        
        int weekCount = 1;
        int normalDayColor = 255;
        color sundayColor = color(255, 0, 0);
        DayOfWeek[] dayOfWeek = DayOfWeek.values();
        
        // layerの描画開始
        calendarLayer.beginDraw();
        
        // 日曜日から土曜日までの描画
        for (int i = 0; i < 7; i++) {
            int ordinal = (i + 1) % 7;
            if (ordinal == 0) calendarLayer.fill(sundayColor);
            else calendarLayer.fill(normalDayColor);        
            calendarLayer.text(dayOfWeek[i].toString().substring(0, 3), widthCell + (ordinal * widthCell), heightCell);
        }
        
        // 曜日に合わせて日付を描画
        for (int i = 1; i <= calendarMap.size(); i++) {
            calendarLayer.fill(normalDayColor);
            int dayOfWeekNumber = calendarMap.get(i).getValue() % 7;
            if (dayOfWeekNumber == 0) {
                calendarLayer.fill(sundayColor);
                weekCount++;
            }
            
            int textWidth = (calendarMap.get(i).getValue() % 7);
            calendarLayer.text(i, widthCell + (textWidth * widthCell), weekCount * heightCell);
        }
        
        calendarLayer.endDraw();
        return calendarLayer;
    }
}