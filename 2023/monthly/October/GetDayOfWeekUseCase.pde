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
        
        // 1: Monday, 2: Tuesday, 3: Wednesday, 4: Thursday, 5: Friday, 6: Saturday, 7: Sunday
        for (int i = 1; i <= lastDayOfMonth; i++) {
            LocalDate firstDayOfMonth = LocalDate.of(someYear, someMonth, i);
            DayOfWeek firstDayOfWeek = firstDayOfMonth.getDayOfWeek();
            map.put(i, firstDayOfWeek);
        }
        return map;
    }

    private void println(Object content) {
        System.out.println(this.getClass().getSimpleName() +  ": " + content.toString());
    }
}