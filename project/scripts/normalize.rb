require 'csv'

# $ ruby scripts/normalize.rb datasets/a/train.csv > datasets/a/train-normalized.csv
filename = ARGV.fetch(0)

CATEGORIES = <<-CATEGORIES.split(',').map(&:strip)
  ARSON,ASSAULT,BAD CHECKS,BRIBERY,BURGLARY,DISORDERLY CONDUCT,
  DRIVING UNDER THE INFLUENCE,DRUG/NARCOTIC,DRUNKENNESS,EMBEZZLEMENT,
  EXTORTION,FAMILY OFFENSES,FORGERY/COUNTERFEITING,FRAUD,GAMBLING,
  KIDNAPPING,LARCENY/THEFT,LIQUOR LAWS,LOITERING,MISSING PERSON,
  NON-CRIMINAL,OTHER OFFENSES,PORNOGRAPHY/OBSCENE MAT,PROSTITUTION,
  RECOVERED VEHICLE,ROBBERY,RUNAWAY,SECONDARY CODES,SEX OFFENSES FORCIBLE,
  SEX OFFENSES NON FORCIBLE,STOLEN PROPERTY,SUICIDE,SUSPICIOUS OCC,
  TREA,TRESPASS,VANDALISM,VEHICLE THEFT,WARRANTS,WEAPON LAWS
CATEGORIES

normalized_rows = CSV.table(filename, header_converters: []).reduce([]) do |rows, row|
  timestamp = DateTime.parse(row.fetch('Dates')).to_time.to_i
  day_of_week = row.fetch('DayOfWeek')
  pd_district = row.fetch('PdDistrict')
  address = row.fetch('Address')
  x = row.fetch('X')
  y = row.fetch('Y')
  category = row.fetch('Category')

  rows + [[timestamp, day_of_week, pd_district, address, x, y, category]]
end

normalized_output = CSV.generate do |csv|
  csv << %w(Timestamp DayOfWeek PdDistrict Address X Y Category)
  normalized_rows.each { |row| csv << row }
end

puts normalized_output
