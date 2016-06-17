require 'csv'
require 'pry'

input_filename = ARGV.fetch(0)
output_filename = ARGV.fetch(1)

table = CSV.table(input_filename, header_converters: [])

included_headers = %w(Dates Category DayOfWeek PdDistrict Address X Y)
additional_headers = %w(Timestamp MonthName HourOfDay PartOfDay Trend TrendSize NormalizedTrend)

rows = []

table.reverse_each.each_with_index do |row, index|
  parsed_time = DateTime.parse(row.fetch('Dates')).to_time

  timestamp = parsed_time.to_i
  month_name = parsed_time.strftime('%B')
  hour_of_day = parsed_time.hour

  part_of_days = {
    5...12 => 'Morning',
    12...17 => 'Afternoon',
    17...21 => 'Evening',
    21...24 => 'Night',
    0...5 => 'Night'
  }

  _, part_of_day = part_of_days.find { |range, name| range.include?(hour_of_day) }

  included_attributes = included_headers.reduce({}) do |hsh, header|
    hsh[header] = row.fetch(header)
    hsh
  end

  candidate_rows = rows.select do |r|
    r.values_at('Category', 'PdDistrict') == row.values_at('Category', 'PdDistrict')
  end

  rows_by_time = candidate_rows.select { |r| r.fetch('Timestamp') >= timestamp - (60 * 60 * 24 * 30 * 6) }
  rows_by_index = candidate_rows.reverse.take(100).reverse

  selected_rows = (rows_by_time | rows_by_index).sort_by { |r| r.fetch('Timestamp') }

  trend, trend_size, normalized_trend = if selected_rows.count >= 2
    timeseries_start = selected_rows.first.fetch('Timestamp')
    timeseries_end = selected_rows.last.fetch('Timestamp')
    timeseries_size = (timeseries_end - timeseries_start) / 15.0

    timeseries1 = selected_rows.select do |r|
      (timeseries_start...(timeseries_start + timeseries_size * 8)).include?(r.fetch('Timestamp'))
    end

    timeseries2 = selected_rows.select do |r|
      ((timeseries_start + timeseries_size * 8)...(timeseries_start + timeseries_size * 12)).include?(r.fetch('Timestamp'))
    end

    timeseries3 = selected_rows.select do |r|
      ((timeseries_start + timeseries_size * 12)...(timeseries_start + timeseries_size * 14)).include?(r.fetch('Timestamp'))
    end

    timeseries4 = selected_rows.select do |r|
      ((timeseries_start + timeseries_size * 14)..(timeseries_start + timeseries_size * 15)).include?(r.fetch('Timestamp'))
    end

    delta1 = (timeseries1.count / 8.0) - (timeseries2.count / 4.0)
    delta2 = (timeseries2.count / 4.0) - (timeseries3.count / 2.0)
    delta3 = (timeseries3.count / 2.0) - (timeseries4.count / 1.0)

    trend = ((delta1 + delta2 + delta3) / 3.0)
    trend_size = selected_rows.count
    normalized_trend = trend * trend_size

    [trend, trend_size, normalized_trend]
  else
    [0, 0, 0]
  end

  additional_attributes = {
    'Timestamp' => timestamp,
    'MonthName' => month_name,
    'HourOfDay' => hour_of_day,
    'PartOfDay' => part_of_day,
    'Trend' => trend,
    'TrendSize' => trend_size,
    'NormalizedTrend' => normalized_trend
  }

  if rand > 0.99
    puts "\n===================== %d%% of %d ============================" % [rows.count / table.count.to_f * 100, table.count]
    puts "Current row: %s" % included_attributes.merge(additional_attributes)
  end

  rows << included_attributes.merge(additional_attributes)
end

CSV.open(output_filename, "wb") do |csv|
  csv << (included_headers + additional_headers)
  rows.each { |row| csv << row.values }
end
