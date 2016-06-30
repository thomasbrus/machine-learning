@categories = <<-CATEGORIES.split(',').map(&:strip)
  ARSON,ASSAULT,BAD CHECKS,BRIBERY,BURGLARY,DISORDERLY CONDUCT,
  DRIVING UNDER THE INFLUENCE,DRUG/NARCOTIC,DRUNKENNESS,EMBEZZLEMENT,
  EXTORTION,FAMILY OFFENSES,FORGERY/COUNTERFEITING,FRAUD,GAMBLING,
  KIDNAPPING,LARCENY/THEFT,LIQUOR LAWS,LOITERING,MISSING PERSON,
  NON-CRIMINAL,OTHER OFFENSES,PORNOGRAPHY/OBSCENE MAT,PROSTITUTION,
  RECOVERED VEHICLE,ROBBERY,RUNAWAY,SECONDARY CODES,SEX OFFENSES FORCIBLE,
  SEX OFFENSES NON FORCIBLE,STOLEN PROPERTY,SUICIDE,SUSPICIOUS OCC,
  TREA,TRESPASS,VANDALISM,VEHICLE THEFT,WARRANTS,WEAPON LAWS
CATEGORIES

puts <<-SCRIPT
#!/usr/bin/env bash

set -e
SCRIPT

@categories.each do |category|
  filename = category.downcase.gsub(/(\s|\/)/, '-')

  puts <<-SCRIPT
head -n 1 datasets/train/b/enriched.csv | awk '{print $1",#{category}"}' > datasets/train/b/#{filename}.csv

NUMBER_OF_LINES=$(grep ',#{category},' datasets/train/b/enriched.csv | wc -l)

grep ',#{category},' datasets/train/b/enriched.csv | sed 's/.*/&,TRUE/' >> datasets/train/b/#{filename}.csv

grep -v ',#{category},' datasets/train/b/enriched.csv \
  | sed 's/.*/&,FALSE/' \
  | ruby -e "puts ARGF.readlines.drop(1).shuffle.take($NUMBER_OF_LINES)" \
  >> datasets/train/b/#{filename}.csv
  SCRIPT
end
