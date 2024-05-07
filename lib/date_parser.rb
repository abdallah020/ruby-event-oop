# lib/date_parser.rb

require 'date'

class DateParser
  def self.parse(date_string)
    today = Date.today
    date_string.downcase!

    if date_string.include? "prochain"
      today += 7
      date_string.sub!("prochain", "")
    end

    if date_string.include? "à"
      date_string, time = date_string.split("à")
      time.strip!
      hour, minute = time.split("h").map(&:to_i)
    end

    day, month_name = date_string.split(" ")
    month = Date::MONTHNAMES.index(month_name.capitalize)
    year = today.year

    if month.nil?
      month = today.month
      day = date_string.to_i
    end

    year += 1 if today.month > month

    puts "Day: #{day}"
    puts "Month name: #{month_name}"

    DateTime.new(year, month, day.to_i, hour || 0, minute || 0)
  end
end

