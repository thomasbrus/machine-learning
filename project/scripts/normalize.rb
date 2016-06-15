require 'csv'

# $ ruby scripts/normalize.rb datasets/a/train.csv > datasets/a/train-normalized.csv
filename = ARGV.fetch(0)

table = CSV.table(filename, header_converters: [])

normalized_rows = table.reduce([]) do |rows, row|
  timestamp = DateTime.parse(row.fetch('Dates')).to_time.to_i
  day_of_week = row.fetch('DayOfWeek')
  # pd_district = row.fetch('PdDistrict')
  # address = row.fetch('Address')
  x = row.fetch('X')
  y = row.fetch('Y')
  category = row.fields.last

  rows + [[timestamp, day_of_week, x, y, category]]
end

normalized_output = CSV.generate do |csv|
  csv << %w(Timestamp DayOfWeek X Y) + [table.headers.last]
  normalized_rows.each { |row| csv << row }
end

puts normalized_output
