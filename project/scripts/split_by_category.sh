#!/usr/bin/env bash

set -e
head -n 1 datasets/train/b/enriched.csv | awk '{print $1",ARSON"}' > datasets/train/b/arson.csv

NUMBER_OF_LINES=$(grep ',ARSON,' datasets/train/b/enriched.csv | wc -l)

grep ',ARSON,' datasets/train/b/enriched.csv | sed 's/.*/&,TRUE/' >> datasets/train/b/arson.csv

grep -v ',ARSON,' datasets/train/b/enriched.csv   | sed 's/.*/&,FALSE/'   | ruby -e "puts ARGF.readlines.drop(1).shuffle.take($NUMBER_OF_LINES)"   >> datasets/train/b/arson.csv
head -n 1 datasets/train/b/enriched.csv | awk '{print $1",ASSAULT"}' > datasets/train/b/assault.csv

NUMBER_OF_LINES=$(grep ',ASSAULT,' datasets/train/b/enriched.csv | wc -l)

grep ',ASSAULT,' datasets/train/b/enriched.csv | sed 's/.*/&,TRUE/' >> datasets/train/b/assault.csv

grep -v ',ASSAULT,' datasets/train/b/enriched.csv   | sed 's/.*/&,FALSE/'   | ruby -e "puts ARGF.readlines.drop(1).shuffle.take($NUMBER_OF_LINES)"   >> datasets/train/b/assault.csv
head -n 1 datasets/train/b/enriched.csv | awk '{print $1",BAD CHECKS"}' > datasets/train/b/bad-checks.csv

NUMBER_OF_LINES=$(grep ',BAD CHECKS,' datasets/train/b/enriched.csv | wc -l)

grep ',BAD CHECKS,' datasets/train/b/enriched.csv | sed 's/.*/&,TRUE/' >> datasets/train/b/bad-checks.csv

grep -v ',BAD CHECKS,' datasets/train/b/enriched.csv   | sed 's/.*/&,FALSE/'   | ruby -e "puts ARGF.readlines.drop(1).shuffle.take($NUMBER_OF_LINES)"   >> datasets/train/b/bad-checks.csv
head -n 1 datasets/train/b/enriched.csv | awk '{print $1",BRIBERY"}' > datasets/train/b/bribery.csv

NUMBER_OF_LINES=$(grep ',BRIBERY,' datasets/train/b/enriched.csv | wc -l)

grep ',BRIBERY,' datasets/train/b/enriched.csv | sed 's/.*/&,TRUE/' >> datasets/train/b/bribery.csv

grep -v ',BRIBERY,' datasets/train/b/enriched.csv   | sed 's/.*/&,FALSE/'   | ruby -e "puts ARGF.readlines.drop(1).shuffle.take($NUMBER_OF_LINES)"   >> datasets/train/b/bribery.csv
head -n 1 datasets/train/b/enriched.csv | awk '{print $1",BURGLARY"}' > datasets/train/b/burglary.csv

NUMBER_OF_LINES=$(grep ',BURGLARY,' datasets/train/b/enriched.csv | wc -l)

grep ',BURGLARY,' datasets/train/b/enriched.csv | sed 's/.*/&,TRUE/' >> datasets/train/b/burglary.csv

grep -v ',BURGLARY,' datasets/train/b/enriched.csv   | sed 's/.*/&,FALSE/'   | ruby -e "puts ARGF.readlines.drop(1).shuffle.take($NUMBER_OF_LINES)"   >> datasets/train/b/burglary.csv
head -n 1 datasets/train/b/enriched.csv | awk '{print $1",DISORDERLY CONDUCT"}' > datasets/train/b/disorderly-conduct.csv

NUMBER_OF_LINES=$(grep ',DISORDERLY CONDUCT,' datasets/train/b/enriched.csv | wc -l)

grep ',DISORDERLY CONDUCT,' datasets/train/b/enriched.csv | sed 's/.*/&,TRUE/' >> datasets/train/b/disorderly-conduct.csv

grep -v ',DISORDERLY CONDUCT,' datasets/train/b/enriched.csv   | sed 's/.*/&,FALSE/'   | ruby -e "puts ARGF.readlines.drop(1).shuffle.take($NUMBER_OF_LINES)"   >> datasets/train/b/disorderly-conduct.csv
head -n 1 datasets/train/b/enriched.csv | awk '{print $1",DRIVING UNDER THE INFLUENCE"}' > datasets/train/b/driving-under-the-influence.csv

NUMBER_OF_LINES=$(grep ',DRIVING UNDER THE INFLUENCE,' datasets/train/b/enriched.csv | wc -l)

grep ',DRIVING UNDER THE INFLUENCE,' datasets/train/b/enriched.csv | sed 's/.*/&,TRUE/' >> datasets/train/b/driving-under-the-influence.csv

grep -v ',DRIVING UNDER THE INFLUENCE,' datasets/train/b/enriched.csv   | sed 's/.*/&,FALSE/'   | ruby -e "puts ARGF.readlines.drop(1).shuffle.take($NUMBER_OF_LINES)"   >> datasets/train/b/driving-under-the-influence.csv
head -n 1 datasets/train/b/enriched.csv | awk '{print $1",DRUG/NARCOTIC"}' > datasets/train/b/drug-narcotic.csv

NUMBER_OF_LINES=$(grep ',DRUG/NARCOTIC,' datasets/train/b/enriched.csv | wc -l)

grep ',DRUG/NARCOTIC,' datasets/train/b/enriched.csv | sed 's/.*/&,TRUE/' >> datasets/train/b/drug-narcotic.csv

grep -v ',DRUG/NARCOTIC,' datasets/train/b/enriched.csv   | sed 's/.*/&,FALSE/'   | ruby -e "puts ARGF.readlines.drop(1).shuffle.take($NUMBER_OF_LINES)"   >> datasets/train/b/drug-narcotic.csv
head -n 1 datasets/train/b/enriched.csv | awk '{print $1",DRUNKENNESS"}' > datasets/train/b/drunkenness.csv

NUMBER_OF_LINES=$(grep ',DRUNKENNESS,' datasets/train/b/enriched.csv | wc -l)

grep ',DRUNKENNESS,' datasets/train/b/enriched.csv | sed 's/.*/&,TRUE/' >> datasets/train/b/drunkenness.csv

grep -v ',DRUNKENNESS,' datasets/train/b/enriched.csv   | sed 's/.*/&,FALSE/'   | ruby -e "puts ARGF.readlines.drop(1).shuffle.take($NUMBER_OF_LINES)"   >> datasets/train/b/drunkenness.csv
head -n 1 datasets/train/b/enriched.csv | awk '{print $1",EMBEZZLEMENT"}' > datasets/train/b/embezzlement.csv

NUMBER_OF_LINES=$(grep ',EMBEZZLEMENT,' datasets/train/b/enriched.csv | wc -l)

grep ',EMBEZZLEMENT,' datasets/train/b/enriched.csv | sed 's/.*/&,TRUE/' >> datasets/train/b/embezzlement.csv

grep -v ',EMBEZZLEMENT,' datasets/train/b/enriched.csv   | sed 's/.*/&,FALSE/'   | ruby -e "puts ARGF.readlines.drop(1).shuffle.take($NUMBER_OF_LINES)"   >> datasets/train/b/embezzlement.csv
head -n 1 datasets/train/b/enriched.csv | awk '{print $1",EXTORTION"}' > datasets/train/b/extortion.csv

NUMBER_OF_LINES=$(grep ',EXTORTION,' datasets/train/b/enriched.csv | wc -l)

grep ',EXTORTION,' datasets/train/b/enriched.csv | sed 's/.*/&,TRUE/' >> datasets/train/b/extortion.csv

grep -v ',EXTORTION,' datasets/train/b/enriched.csv   | sed 's/.*/&,FALSE/'   | ruby -e "puts ARGF.readlines.drop(1).shuffle.take($NUMBER_OF_LINES)"   >> datasets/train/b/extortion.csv
head -n 1 datasets/train/b/enriched.csv | awk '{print $1",FAMILY OFFENSES"}' > datasets/train/b/family-offenses.csv

NUMBER_OF_LINES=$(grep ',FAMILY OFFENSES,' datasets/train/b/enriched.csv | wc -l)

grep ',FAMILY OFFENSES,' datasets/train/b/enriched.csv | sed 's/.*/&,TRUE/' >> datasets/train/b/family-offenses.csv

grep -v ',FAMILY OFFENSES,' datasets/train/b/enriched.csv   | sed 's/.*/&,FALSE/'   | ruby -e "puts ARGF.readlines.drop(1).shuffle.take($NUMBER_OF_LINES)"   >> datasets/train/b/family-offenses.csv
head -n 1 datasets/train/b/enriched.csv | awk '{print $1",FORGERY/COUNTERFEITING"}' > datasets/train/b/forgery-counterfeiting.csv

NUMBER_OF_LINES=$(grep ',FORGERY/COUNTERFEITING,' datasets/train/b/enriched.csv | wc -l)

grep ',FORGERY/COUNTERFEITING,' datasets/train/b/enriched.csv | sed 's/.*/&,TRUE/' >> datasets/train/b/forgery-counterfeiting.csv

grep -v ',FORGERY/COUNTERFEITING,' datasets/train/b/enriched.csv   | sed 's/.*/&,FALSE/'   | ruby -e "puts ARGF.readlines.drop(1).shuffle.take($NUMBER_OF_LINES)"   >> datasets/train/b/forgery-counterfeiting.csv
head -n 1 datasets/train/b/enriched.csv | awk '{print $1",FRAUD"}' > datasets/train/b/fraud.csv

NUMBER_OF_LINES=$(grep ',FRAUD,' datasets/train/b/enriched.csv | wc -l)

grep ',FRAUD,' datasets/train/b/enriched.csv | sed 's/.*/&,TRUE/' >> datasets/train/b/fraud.csv

grep -v ',FRAUD,' datasets/train/b/enriched.csv   | sed 's/.*/&,FALSE/'   | ruby -e "puts ARGF.readlines.drop(1).shuffle.take($NUMBER_OF_LINES)"   >> datasets/train/b/fraud.csv
head -n 1 datasets/train/b/enriched.csv | awk '{print $1",GAMBLING"}' > datasets/train/b/gambling.csv

NUMBER_OF_LINES=$(grep ',GAMBLING,' datasets/train/b/enriched.csv | wc -l)

grep ',GAMBLING,' datasets/train/b/enriched.csv | sed 's/.*/&,TRUE/' >> datasets/train/b/gambling.csv

grep -v ',GAMBLING,' datasets/train/b/enriched.csv   | sed 's/.*/&,FALSE/'   | ruby -e "puts ARGF.readlines.drop(1).shuffle.take($NUMBER_OF_LINES)"   >> datasets/train/b/gambling.csv
head -n 1 datasets/train/b/enriched.csv | awk '{print $1",KIDNAPPING"}' > datasets/train/b/kidnapping.csv

NUMBER_OF_LINES=$(grep ',KIDNAPPING,' datasets/train/b/enriched.csv | wc -l)

grep ',KIDNAPPING,' datasets/train/b/enriched.csv | sed 's/.*/&,TRUE/' >> datasets/train/b/kidnapping.csv

grep -v ',KIDNAPPING,' datasets/train/b/enriched.csv   | sed 's/.*/&,FALSE/'   | ruby -e "puts ARGF.readlines.drop(1).shuffle.take($NUMBER_OF_LINES)"   >> datasets/train/b/kidnapping.csv
head -n 1 datasets/train/b/enriched.csv | awk '{print $1",LARCENY/THEFT"}' > datasets/train/b/larceny-theft.csv

NUMBER_OF_LINES=$(grep ',LARCENY/THEFT,' datasets/train/b/enriched.csv | wc -l)

grep ',LARCENY/THEFT,' datasets/train/b/enriched.csv | sed 's/.*/&,TRUE/' >> datasets/train/b/larceny-theft.csv

grep -v ',LARCENY/THEFT,' datasets/train/b/enriched.csv   | sed 's/.*/&,FALSE/'   | ruby -e "puts ARGF.readlines.drop(1).shuffle.take($NUMBER_OF_LINES)"   >> datasets/train/b/larceny-theft.csv
head -n 1 datasets/train/b/enriched.csv | awk '{print $1",LIQUOR LAWS"}' > datasets/train/b/liquor-laws.csv

NUMBER_OF_LINES=$(grep ',LIQUOR LAWS,' datasets/train/b/enriched.csv | wc -l)

grep ',LIQUOR LAWS,' datasets/train/b/enriched.csv | sed 's/.*/&,TRUE/' >> datasets/train/b/liquor-laws.csv

grep -v ',LIQUOR LAWS,' datasets/train/b/enriched.csv   | sed 's/.*/&,FALSE/'   | ruby -e "puts ARGF.readlines.drop(1).shuffle.take($NUMBER_OF_LINES)"   >> datasets/train/b/liquor-laws.csv
head -n 1 datasets/train/b/enriched.csv | awk '{print $1",LOITERING"}' > datasets/train/b/loitering.csv

NUMBER_OF_LINES=$(grep ',LOITERING,' datasets/train/b/enriched.csv | wc -l)

grep ',LOITERING,' datasets/train/b/enriched.csv | sed 's/.*/&,TRUE/' >> datasets/train/b/loitering.csv

grep -v ',LOITERING,' datasets/train/b/enriched.csv   | sed 's/.*/&,FALSE/'   | ruby -e "puts ARGF.readlines.drop(1).shuffle.take($NUMBER_OF_LINES)"   >> datasets/train/b/loitering.csv
head -n 1 datasets/train/b/enriched.csv | awk '{print $1",MISSING PERSON"}' > datasets/train/b/missing-person.csv

NUMBER_OF_LINES=$(grep ',MISSING PERSON,' datasets/train/b/enriched.csv | wc -l)

grep ',MISSING PERSON,' datasets/train/b/enriched.csv | sed 's/.*/&,TRUE/' >> datasets/train/b/missing-person.csv

grep -v ',MISSING PERSON,' datasets/train/b/enriched.csv   | sed 's/.*/&,FALSE/'   | ruby -e "puts ARGF.readlines.drop(1).shuffle.take($NUMBER_OF_LINES)"   >> datasets/train/b/missing-person.csv
head -n 1 datasets/train/b/enriched.csv | awk '{print $1",NON-CRIMINAL"}' > datasets/train/b/non-criminal.csv

NUMBER_OF_LINES=$(grep ',NON-CRIMINAL,' datasets/train/b/enriched.csv | wc -l)

grep ',NON-CRIMINAL,' datasets/train/b/enriched.csv | sed 's/.*/&,TRUE/' >> datasets/train/b/non-criminal.csv

grep -v ',NON-CRIMINAL,' datasets/train/b/enriched.csv   | sed 's/.*/&,FALSE/'   | ruby -e "puts ARGF.readlines.drop(1).shuffle.take($NUMBER_OF_LINES)"   >> datasets/train/b/non-criminal.csv
head -n 1 datasets/train/b/enriched.csv | awk '{print $1",OTHER OFFENSES"}' > datasets/train/b/other-offenses.csv

NUMBER_OF_LINES=$(grep ',OTHER OFFENSES,' datasets/train/b/enriched.csv | wc -l)

grep ',OTHER OFFENSES,' datasets/train/b/enriched.csv | sed 's/.*/&,TRUE/' >> datasets/train/b/other-offenses.csv

grep -v ',OTHER OFFENSES,' datasets/train/b/enriched.csv   | sed 's/.*/&,FALSE/'   | ruby -e "puts ARGF.readlines.drop(1).shuffle.take($NUMBER_OF_LINES)"   >> datasets/train/b/other-offenses.csv
head -n 1 datasets/train/b/enriched.csv | awk '{print $1",PORNOGRAPHY/OBSCENE MAT"}' > datasets/train/b/pornography-obscene-mat.csv

NUMBER_OF_LINES=$(grep ',PORNOGRAPHY/OBSCENE MAT,' datasets/train/b/enriched.csv | wc -l)

grep ',PORNOGRAPHY/OBSCENE MAT,' datasets/train/b/enriched.csv | sed 's/.*/&,TRUE/' >> datasets/train/b/pornography-obscene-mat.csv

grep -v ',PORNOGRAPHY/OBSCENE MAT,' datasets/train/b/enriched.csv   | sed 's/.*/&,FALSE/'   | ruby -e "puts ARGF.readlines.drop(1).shuffle.take($NUMBER_OF_LINES)"   >> datasets/train/b/pornography-obscene-mat.csv
head -n 1 datasets/train/b/enriched.csv | awk '{print $1",PROSTITUTION"}' > datasets/train/b/prostitution.csv

NUMBER_OF_LINES=$(grep ',PROSTITUTION,' datasets/train/b/enriched.csv | wc -l)

grep ',PROSTITUTION,' datasets/train/b/enriched.csv | sed 's/.*/&,TRUE/' >> datasets/train/b/prostitution.csv

grep -v ',PROSTITUTION,' datasets/train/b/enriched.csv   | sed 's/.*/&,FALSE/'   | ruby -e "puts ARGF.readlines.drop(1).shuffle.take($NUMBER_OF_LINES)"   >> datasets/train/b/prostitution.csv
head -n 1 datasets/train/b/enriched.csv | awk '{print $1",RECOVERED VEHICLE"}' > datasets/train/b/recovered-vehicle.csv

NUMBER_OF_LINES=$(grep ',RECOVERED VEHICLE,' datasets/train/b/enriched.csv | wc -l)

grep ',RECOVERED VEHICLE,' datasets/train/b/enriched.csv | sed 's/.*/&,TRUE/' >> datasets/train/b/recovered-vehicle.csv

grep -v ',RECOVERED VEHICLE,' datasets/train/b/enriched.csv   | sed 's/.*/&,FALSE/'   | ruby -e "puts ARGF.readlines.drop(1).shuffle.take($NUMBER_OF_LINES)"   >> datasets/train/b/recovered-vehicle.csv
head -n 1 datasets/train/b/enriched.csv | awk '{print $1",ROBBERY"}' > datasets/train/b/robbery.csv

NUMBER_OF_LINES=$(grep ',ROBBERY,' datasets/train/b/enriched.csv | wc -l)

grep ',ROBBERY,' datasets/train/b/enriched.csv | sed 's/.*/&,TRUE/' >> datasets/train/b/robbery.csv

grep -v ',ROBBERY,' datasets/train/b/enriched.csv   | sed 's/.*/&,FALSE/'   | ruby -e "puts ARGF.readlines.drop(1).shuffle.take($NUMBER_OF_LINES)"   >> datasets/train/b/robbery.csv
head -n 1 datasets/train/b/enriched.csv | awk '{print $1",RUNAWAY"}' > datasets/train/b/runaway.csv

NUMBER_OF_LINES=$(grep ',RUNAWAY,' datasets/train/b/enriched.csv | wc -l)

grep ',RUNAWAY,' datasets/train/b/enriched.csv | sed 's/.*/&,TRUE/' >> datasets/train/b/runaway.csv

grep -v ',RUNAWAY,' datasets/train/b/enriched.csv   | sed 's/.*/&,FALSE/'   | ruby -e "puts ARGF.readlines.drop(1).shuffle.take($NUMBER_OF_LINES)"   >> datasets/train/b/runaway.csv
head -n 1 datasets/train/b/enriched.csv | awk '{print $1",SECONDARY CODES"}' > datasets/train/b/secondary-codes.csv

NUMBER_OF_LINES=$(grep ',SECONDARY CODES,' datasets/train/b/enriched.csv | wc -l)

grep ',SECONDARY CODES,' datasets/train/b/enriched.csv | sed 's/.*/&,TRUE/' >> datasets/train/b/secondary-codes.csv

grep -v ',SECONDARY CODES,' datasets/train/b/enriched.csv   | sed 's/.*/&,FALSE/'   | ruby -e "puts ARGF.readlines.drop(1).shuffle.take($NUMBER_OF_LINES)"   >> datasets/train/b/secondary-codes.csv
head -n 1 datasets/train/b/enriched.csv | awk '{print $1",SEX OFFENSES FORCIBLE"}' > datasets/train/b/sex-offenses-forcible.csv

NUMBER_OF_LINES=$(grep ',SEX OFFENSES FORCIBLE,' datasets/train/b/enriched.csv | wc -l)

grep ',SEX OFFENSES FORCIBLE,' datasets/train/b/enriched.csv | sed 's/.*/&,TRUE/' >> datasets/train/b/sex-offenses-forcible.csv

grep -v ',SEX OFFENSES FORCIBLE,' datasets/train/b/enriched.csv   | sed 's/.*/&,FALSE/'   | ruby -e "puts ARGF.readlines.drop(1).shuffle.take($NUMBER_OF_LINES)"   >> datasets/train/b/sex-offenses-forcible.csv
head -n 1 datasets/train/b/enriched.csv | awk '{print $1",SEX OFFENSES NON FORCIBLE"}' > datasets/train/b/sex-offenses-non-forcible.csv

NUMBER_OF_LINES=$(grep ',SEX OFFENSES NON FORCIBLE,' datasets/train/b/enriched.csv | wc -l)

grep ',SEX OFFENSES NON FORCIBLE,' datasets/train/b/enriched.csv | sed 's/.*/&,TRUE/' >> datasets/train/b/sex-offenses-non-forcible.csv

grep -v ',SEX OFFENSES NON FORCIBLE,' datasets/train/b/enriched.csv   | sed 's/.*/&,FALSE/'   | ruby -e "puts ARGF.readlines.drop(1).shuffle.take($NUMBER_OF_LINES)"   >> datasets/train/b/sex-offenses-non-forcible.csv
head -n 1 datasets/train/b/enriched.csv | awk '{print $1",STOLEN PROPERTY"}' > datasets/train/b/stolen-property.csv

NUMBER_OF_LINES=$(grep ',STOLEN PROPERTY,' datasets/train/b/enriched.csv | wc -l)

grep ',STOLEN PROPERTY,' datasets/train/b/enriched.csv | sed 's/.*/&,TRUE/' >> datasets/train/b/stolen-property.csv

grep -v ',STOLEN PROPERTY,' datasets/train/b/enriched.csv   | sed 's/.*/&,FALSE/'   | ruby -e "puts ARGF.readlines.drop(1).shuffle.take($NUMBER_OF_LINES)"   >> datasets/train/b/stolen-property.csv
head -n 1 datasets/train/b/enriched.csv | awk '{print $1",SUICIDE"}' > datasets/train/b/suicide.csv

NUMBER_OF_LINES=$(grep ',SUICIDE,' datasets/train/b/enriched.csv | wc -l)

grep ',SUICIDE,' datasets/train/b/enriched.csv | sed 's/.*/&,TRUE/' >> datasets/train/b/suicide.csv

grep -v ',SUICIDE,' datasets/train/b/enriched.csv   | sed 's/.*/&,FALSE/'   | ruby -e "puts ARGF.readlines.drop(1).shuffle.take($NUMBER_OF_LINES)"   >> datasets/train/b/suicide.csv
head -n 1 datasets/train/b/enriched.csv | awk '{print $1",SUSPICIOUS OCC"}' > datasets/train/b/suspicious-occ.csv

NUMBER_OF_LINES=$(grep ',SUSPICIOUS OCC,' datasets/train/b/enriched.csv | wc -l)

grep ',SUSPICIOUS OCC,' datasets/train/b/enriched.csv | sed 's/.*/&,TRUE/' >> datasets/train/b/suspicious-occ.csv

grep -v ',SUSPICIOUS OCC,' datasets/train/b/enriched.csv   | sed 's/.*/&,FALSE/'   | ruby -e "puts ARGF.readlines.drop(1).shuffle.take($NUMBER_OF_LINES)"   >> datasets/train/b/suspicious-occ.csv
head -n 1 datasets/train/b/enriched.csv | awk '{print $1",TREA"}' > datasets/train/b/trea.csv

NUMBER_OF_LINES=$(grep ',TREA,' datasets/train/b/enriched.csv | wc -l)

grep ',TREA,' datasets/train/b/enriched.csv | sed 's/.*/&,TRUE/' >> datasets/train/b/trea.csv

grep -v ',TREA,' datasets/train/b/enriched.csv   | sed 's/.*/&,FALSE/'   | ruby -e "puts ARGF.readlines.drop(1).shuffle.take($NUMBER_OF_LINES)"   >> datasets/train/b/trea.csv
head -n 1 datasets/train/b/enriched.csv | awk '{print $1",TRESPASS"}' > datasets/train/b/trespass.csv

NUMBER_OF_LINES=$(grep ',TRESPASS,' datasets/train/b/enriched.csv | wc -l)

grep ',TRESPASS,' datasets/train/b/enriched.csv | sed 's/.*/&,TRUE/' >> datasets/train/b/trespass.csv

grep -v ',TRESPASS,' datasets/train/b/enriched.csv   | sed 's/.*/&,FALSE/'   | ruby -e "puts ARGF.readlines.drop(1).shuffle.take($NUMBER_OF_LINES)"   >> datasets/train/b/trespass.csv
head -n 1 datasets/train/b/enriched.csv | awk '{print $1",VANDALISM"}' > datasets/train/b/vandalism.csv

NUMBER_OF_LINES=$(grep ',VANDALISM,' datasets/train/b/enriched.csv | wc -l)

grep ',VANDALISM,' datasets/train/b/enriched.csv | sed 's/.*/&,TRUE/' >> datasets/train/b/vandalism.csv

grep -v ',VANDALISM,' datasets/train/b/enriched.csv   | sed 's/.*/&,FALSE/'   | ruby -e "puts ARGF.readlines.drop(1).shuffle.take($NUMBER_OF_LINES)"   >> datasets/train/b/vandalism.csv
head -n 1 datasets/train/b/enriched.csv | awk '{print $1",VEHICLE THEFT"}' > datasets/train/b/vehicle-theft.csv

NUMBER_OF_LINES=$(grep ',VEHICLE THEFT,' datasets/train/b/enriched.csv | wc -l)

grep ',VEHICLE THEFT,' datasets/train/b/enriched.csv | sed 's/.*/&,TRUE/' >> datasets/train/b/vehicle-theft.csv

grep -v ',VEHICLE THEFT,' datasets/train/b/enriched.csv   | sed 's/.*/&,FALSE/'   | ruby -e "puts ARGF.readlines.drop(1).shuffle.take($NUMBER_OF_LINES)"   >> datasets/train/b/vehicle-theft.csv
head -n 1 datasets/train/b/enriched.csv | awk '{print $1",WARRANTS"}' > datasets/train/b/warrants.csv

NUMBER_OF_LINES=$(grep ',WARRANTS,' datasets/train/b/enriched.csv | wc -l)

grep ',WARRANTS,' datasets/train/b/enriched.csv | sed 's/.*/&,TRUE/' >> datasets/train/b/warrants.csv

grep -v ',WARRANTS,' datasets/train/b/enriched.csv   | sed 's/.*/&,FALSE/'   | ruby -e "puts ARGF.readlines.drop(1).shuffle.take($NUMBER_OF_LINES)"   >> datasets/train/b/warrants.csv
head -n 1 datasets/train/b/enriched.csv | awk '{print $1",WEAPON LAWS"}' > datasets/train/b/weapon-laws.csv

NUMBER_OF_LINES=$(grep ',WEAPON LAWS,' datasets/train/b/enriched.csv | wc -l)

grep ',WEAPON LAWS,' datasets/train/b/enriched.csv | sed 's/.*/&,TRUE/' >> datasets/train/b/weapon-laws.csv

grep -v ',WEAPON LAWS,' datasets/train/b/enriched.csv   | sed 's/.*/&,FALSE/'   | ruby -e "puts ARGF.readlines.drop(1).shuffle.take($NUMBER_OF_LINES)"   >> datasets/train/b/weapon-laws.csv
