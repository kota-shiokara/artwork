import java.time.LocalDate;
import java.time.DayOfWeek;
import java.util.Map;

public class GetDayOfWeekUseCase {
    private LocalDate currentDate;

    public GetDayOfWeekUseCase() {
        currentDate = LocalDate.now();
    }

    public Map<Integer, DayOfWeek> getDayOfWeekCurrentMonth() {
        int currentYear = currentDate.getYear();
        int currentMonth = currentDate.getMonthValue();
        return getDayOfWeekSomeMonth(currentYear, currentMonth);
    }

    // <Day: int, DayOfWeek: DayOfWeek>
    public Map<Integer, DayOfWeek> getDayOfWeekSomeMonth(int someYear, int someMonth) {
        Map<Integer, DayOfWeek> map = new HashMap();
        int lastDayOfMonth = currentDate.lengthOfMonth();
        
        for (int i = 1; i <= lastDayOfMonth; i++) {
            LocalDate firstDayOfMonth = LocalDate.of(someYear, someMonth, i);
            DayOfWeek firstDayOfWeek = firstDayOfMonth.getDayOfWeek();
            // println(i + " is " + firstDayOfWeek + "(" + firstDayOfWeek.getValue() + ")");
            map.put(i, firstDayOfWeek);
        }
        return map;
    }

    private void println(Object content) {
        System.out.println(this.getClass().getSimpleName() +  ": " + content.toString());
    }
}