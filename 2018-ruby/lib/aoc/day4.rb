require 'time'

module AOC
  module Day4
    def self.part1(input)
      guard_id, minute_counts = guard_sleep_minutes(input).max { |(_, minute_counts_a), (_, minute_counts_b)|
        minute_counts_a.values.sum <=> minute_counts_b.values.sum
      }
      minute, _count = minute_counts.max { |(_, count_a), (_, count_b)| count_a <=> count_b }
      guard_id * minute
    end

    def self.part2(input)
      _count, minute, guard_id = guard_sleep_minutes(input).map { |guard_id, minute_counts|
        minute, count = minute_counts.max { |(_, count_a), (_, count_b)| count_a <=> count_b }
        [count, minute, guard_id]
      }.max
      guard_id * minute
    end

    # Returns state in this form: {guard_id => {minute => count}}
    def self.guard_sleep_minutes(input)
      input.map { |line|
        match = /^\[(?<time>.+)\] (?<log>.*)$/.match(line)
        time = Time.strptime(match[:time], '%Y-%m-%d %H:%M')
        event, data = case match[:log]
                      when /^Guard #(\d+) begins shift$/ then [:shift_start, {id: $1.to_i}]
                      when 'falls asleep' then [:sleep, {}]
                      when 'wakes up' then [:wake, {}]
                      end
        [time, event, data]
      }.sort.reduce({sleep_minutes: {}}) { |state, (time, event, data)|
        case event
        when :shift_start then state[:guard_id] = data[:id]
        when :sleep then state[:sleep_start] = time
        when :wake
          minute_counts = state[:sleep_minutes][state[:guard_id]] ||= Hash.new(0)
          (state[:sleep_start].to_i...time.to_i).step(60) { |time_i|
            t = Time.at(time_i)
            minute_counts[t.min] += 1 if t.hour == 0
          }
        end
        state
      }[:sleep_minutes]
    end
  end
end
