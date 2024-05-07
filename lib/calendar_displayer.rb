class CalendarDisplayer
  def initialize(events)
    @events = events
  end

  def display_month(year, month)
    puts "Calendrier en ASCII pour #{Date::MONTHNAMES[month]} #{year}"

    days_in_month = Date.new(year, month, -1).day
    weeks = (1..days_in_month).each_slice(7).to_a

    weeks.each do |week|
      display_week(week)
      display_events_for_week(week)
      puts "\n"
    end
  end

  private

  def display_week(week)
    week.each { |day| print "|#{day.to_s.ljust(8)}" }
    puts "|"
  end

  def display_events_for_week(week)
    (1..7).each do |day|
      events_for_day = @events.select { |event| event.start_date.day == week[day - 1] }

      if events_for_day.any?
        events_for_day.each do |event|
          puts "|".ljust((day - 1) * 8) + "|".ljust(8) + "#{event.title}"
          puts "|".ljust((day - 1) * 8) + "|".ljust(8) + "#{format_time(event.start_date.hour, event.start_date.min)}"
        end
      else
        puts "|".ljust(16)
      end
    end
  end

  def format_time(hour, minute)
    "#{hour.to_s.rjust(2, '0')}:#{minute.to_s.rjust(2, '0')}"
  end
end

