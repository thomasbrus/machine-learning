#!/usr/bin/env bash

set -e
head -n 1 datasets/train.csv | awk '{print $1",ARSON"}' > datasets/categories/arson.csv

NUMBER_OF_LINES=$(grep ',ARSON,' datasets/train.csv | wc -l)

grep ',ARSON,' datasets/train.csv | sed 's/.*/&,TRUE/' >> datasets/categories/arson.csv

grep -v ',ARSON,' datasets/train.csv   | sed 's/.*/&,FALSE/'   | ruby -e "puts ARGF.readlines.drop(1).shuffle.take($NUMBER_OF_LINES)"   >> datasets/categories/arson.csv
head -n 1 datasets/train.csv | awk '{print $1",ASSAULT"}' > datasets/categories/assault.csv

NUMBER_OF_LINES=$(grep ',ASSAULT,' datasets/train.csv | wc -l)

grep ',ASSAULT,' datasets/train.csv | sed 's/.*/&,TRUE/' >> datasets/categories/assault.csv

grep -v ',ASSAULT,' datasets/train.csv   | sed 's/.*/&,FALSE/'   | ruby -e "puts ARGF.readlines.drop(1).shuffle.take($NUMBER_OF_LINES)"   >> datasets/categories/assault.csv
head -n 1 datasets/train.csv | awk '{print $1",BAD CHECKS"}' > datasets/categories/bad-checks.csv

NUMBER_OF_LINES=$(grep ',BAD CHECKS,' datasets/train.csv | wc -l)

grep ',BAD CHECKS,' datasets/train.csv | sed 's/.*/&,TRUE/' >> datasets/categories/bad-checks.csv

grep -v ',BAD CHECKS,' datasets/train.csv   | sed 's/.*/&,FALSE/'   | ruby -e "puts ARGF.readlines.drop(1).shuffle.take($NUMBER_OF_LINES)"   >> datasets/categories/bad-checks.csv
head -n 1 datasets/train.csv | awk '{print $1",BRIBERY"}' > datasets/categories/bribery.csv

NUMBER_OF_LINES=$(grep ',BRIBERY,' datasets/train.csv | wc -l)

grep ',BRIBERY,' datasets/train.csv | sed 's/.*/&,TRUE/' >> datasets/categories/bribery.csv

grep -v ',BRIBERY,' datasets/train.csv   | sed 's/.*/&,FALSE/'   | ruby -e "puts ARGF.readlines.drop(1).shuffle.take($NUMBER_OF_LINES)"   >> datasets/categories/bribery.csv
head -n 1 datasets/train.csv | awk '{print $1",BURGLARY"}' > datasets/categories/burglary.csv

NUMBER_OF_LINES=$(grep ',BURGLARY,' datasets/train.csv | wc -l)

grep ',BURGLARY,' datasets/train.csv | sed 's/.*/&,TRUE/' >> datasets/categories/burglary.csv

grep -v ',BURGLARY,' datasets/train.csv   | sed 's/.*/&,FALSE/'   | ruby -e "puts ARGF.readlines.drop(1).shuffle.take($NUMBER_OF_LINES)"   >> datasets/categories/burglary.csv
head -n 1 datasets/train.csv | awk '{print $1",DISORDERLY CONDUCT"}' > datasets/categories/disorderly-conduct.csv

NUMBER_OF_LINES=$(grep ',DISORDERLY CONDUCT,' datasets/train.csv | wc -l)

grep ',DISORDERLY CONDUCT,' datasets/train.csv | sed 's/.*/&,TRUE/' >> datasets/categories/disorderly-conduct.csv

grep -v ',DISORDERLY CONDUCT,' datasets/train.csv   | sed 's/.*/&,FALSE/'   | ruby -e "puts ARGF.readlines.drop(1).shuffle.take($NUMBER_OF_LINES)"   >> datasets/categories/disorderly-conduct.csv
head -n 1 datasets/train.csv | awk '{print $1",DRIVING UNDER THE INFLUENCE"}' > datasets/categories/driving-under-the-influence.csv

NUMBER_OF_LINES=$(grep ',DRIVING UNDER THE INFLUENCE,' datasets/train.csv | wc -l)

grep ',DRIVING UNDER THE INFLUENCE,' datasets/train.csv | sed 's/.*/&,TRUE/' >> datasets/categories/driving-under-the-influence.csv

grep -v ',DRIVING UNDER THE INFLUENCE,' datasets/train.csv   | sed 's/.*/&,FALSE/'   | ruby -e "puts ARGF.readlines.drop(1).shuffle.take($NUMBER_OF_LINES)"   >> datasets/categories/driving-under-the-influence.csv
head -n 1 datasets/train.csv | awk '{print $1",DRUG/NARCOTIC"}' > datasets/categories/drug-narcotic.csv

NUMBER_OF_LINES=$(grep ',DRUG/NARCOTIC,' datasets/train.csv | wc -l)

grep ',DRUG/NARCOTIC,' datasets/train.csv | sed 's/.*/&,TRUE/' >> datasets/categories/drug-narcotic.csv

grep -v ',DRUG/NARCOTIC,' datasets/train.csv   | sed 's/.*/&,FALSE/'   | ruby -e "puts ARGF.readlines.drop(1).shuffle.take($NUMBER_OF_LINES)"   >> datasets/categories/drug-narcotic.csv
head -n 1 datasets/train.csv | awk '{print $1",DRUNKENNESS"}' > datasets/categories/drunkenness.csv

NUMBER_OF_LINES=$(grep ',DRUNKENNESS,' datasets/train.csv | wc -l)

grep ',DRUNKENNESS,' datasets/train.csv | sed 's/.*/&,TRUE/' >> datasets/categories/drunkenness.csv

grep -v ',DRUNKENNESS,' datasets/train.csv   | sed 's/.*/&,FALSE/'   | ruby -e "puts ARGF.readlines.drop(1).shuffle.take($NUMBER_OF_LINES)"   >> datasets/categories/drunkenness.csv
head -n 1 datasets/train.csv | awk '{print $1",EMBEZZLEMENT"}' > datasets/categories/embezzlement.csv

NUMBER_OF_LINES=$(grep ',EMBEZZLEMENT,' datasets/train.csv | wc -l)

grep ',EMBEZZLEMENT,' datasets/train.csv | sed 's/.*/&,TRUE/' >> datasets/categories/embezzlement.csv

grep -v ',EMBEZZLEMENT,' datasets/train.csv   | sed 's/.*/&,FALSE/'   | ruby -e "puts ARGF.readlines.drop(1).shuffle.take($NUMBER_OF_LINES)"   >> datasets/categories/embezzlement.csv
head -n 1 datasets/train.csv | awk '{print $1",EXTORTION"}' > datasets/categories/extortion.csv

NUMBER_OF_LINES=$(grep ',EXTORTION,' datasets/train.csv | wc -l)

grep ',EXTORTION,' datasets/train.csv | sed 's/.*/&,TRUE/' >> datasets/categories/extortion.csv

grep -v ',EXTORTION,' datasets/train.csv   | sed 's/.*/&,FALSE/'   | ruby -e "puts ARGF.readlines.drop(1).shuffle.take($NUMBER_OF_LINES)"   >> datasets/categories/extortion.csv
head -n 1 datasets/train.csv | awk '{print $1",FAMILY OFFENSES"}' > datasets/categories/family-offenses.csv

NUMBER_OF_LINES=$(grep ',FAMILY OFFENSES,' datasets/train.csv | wc -l)

grep ',FAMILY OFFENSES,' datasets/train.csv | sed 's/.*/&,TRUE/' >> datasets/categories/family-offenses.csv

grep -v ',FAMILY OFFENSES,' datasets/train.csv   | sed 's/.*/&,FALSE/'   | ruby -e "puts ARGF.readlines.drop(1).shuffle.take($NUMBER_OF_LINES)"   >> datasets/categories/family-offenses.csv
head -n 1 datasets/train.csv | awk '{print $1",FORGERY/COUNTERFEITING"}' > datasets/categories/forgery-counterfeiting.csv

NUMBER_OF_LINES=$(grep ',FORGERY/COUNTERFEITING,' datasets/train.csv | wc -l)

grep ',FORGERY/COUNTERFEITING,' datasets/train.csv | sed 's/.*/&,TRUE/' >> datasets/categories/forgery-counterfeiting.csv

grep -v ',FORGERY/COUNTERFEITING,' datasets/train.csv   | sed 's/.*/&,FALSE/'   | ruby -e "puts ARGF.readlines.drop(1).shuffle.take($NUMBER_OF_LINES)"   >> datasets/categories/forgery-counterfeiting.csv
head -n 1 datasets/train.csv | awk '{print $1",FRAUD"}' > datasets/categories/fraud.csv

NUMBER_OF_LINES=$(grep ',FRAUD,' datasets/train.csv | wc -l)

grep ',FRAUD,' datasets/train.csv | sed 's/.*/&,TRUE/' >> datasets/categories/fraud.csv

grep -v ',FRAUD,' datasets/train.csv   | sed 's/.*/&,FALSE/'   | ruby -e "puts ARGF.readlines.drop(1).shuffle.take($NUMBER_OF_LINES)"   >> datasets/categories/fraud.csv
head -n 1 datasets/train.csv | awk '{print $1",GAMBLING"}' > datasets/categories/gambling.csv

NUMBER_OF_LINES=$(grep ',GAMBLING,' datasets/train.csv | wc -l)

grep ',GAMBLING,' datasets/train.csv | sed 's/.*/&,TRUE/' >> datasets/categories/gambling.csv

grep -v ',GAMBLING,' datasets/train.csv   | sed 's/.*/&,FALSE/'   | ruby -e "puts ARGF.readlines.drop(1).shuffle.take($NUMBER_OF_LINES)"   >> datasets/categories/gambling.csv
head -n 1 datasets/train.csv | awk '{print $1",KIDNAPPING"}' > datasets/categories/kidnapping.csv

NUMBER_OF_LINES=$(grep ',KIDNAPPING,' datasets/train.csv | wc -l)

grep ',KIDNAPPING,' datasets/train.csv | sed 's/.*/&,TRUE/' >> datasets/categories/kidnapping.csv

grep -v ',KIDNAPPING,' datasets/train.csv   | sed 's/.*/&,FALSE/'   | ruby -e "puts ARGF.readlines.drop(1).shuffle.take($NUMBER_OF_LINES)"   >> datasets/categories/kidnapping.csv
head -n 1 datasets/train.csv | awk '{print $1",LARCENY/THEFT"}' > datasets/categories/larceny-theft.csv

NUMBER_OF_LINES=$(grep ',LARCENY/THEFT,' datasets/train.csv | wc -l)

grep ',LARCENY/THEFT,' datasets/train.csv | sed 's/.*/&,TRUE/' >> datasets/categories/larceny-theft.csv

grep -v ',LARCENY/THEFT,' datasets/train.csv   | sed 's/.*/&,FALSE/'   | ruby -e "puts ARGF.readlines.drop(1).shuffle.take($NUMBER_OF_LINES)"   >> datasets/categories/larceny-theft.csv
head -n 1 datasets/train.csv | awk '{print $1",LIQUOR LAWS"}' > datasets/categories/liquor-laws.csv

NUMBER_OF_LINES=$(grep ',LIQUOR LAWS,' datasets/train.csv | wc -l)

grep ',LIQUOR LAWS,' datasets/train.csv | sed 's/.*/&,TRUE/' >> datasets/categories/liquor-laws.csv

grep -v ',LIQUOR LAWS,' datasets/train.csv   | sed 's/.*/&,FALSE/'   | ruby -e "puts ARGF.readlines.drop(1).shuffle.take($NUMBER_OF_LINES)"   >> datasets/categories/liquor-laws.csv
head -n 1 datasets/train.csv | awk '{print $1",LOITERING"}' > datasets/categories/loitering.csv

NUMBER_OF_LINES=$(grep ',LOITERING,' datasets/train.csv | wc -l)

grep ',LOITERING,' datasets/train.csv | sed 's/.*/&,TRUE/' >> datasets/categories/loitering.csv

grep -v ',LOITERING,' datasets/train.csv   | sed 's/.*/&,FALSE/'   | ruby -e "puts ARGF.readlines.drop(1).shuffle.take($NUMBER_OF_LINES)"   >> datasets/categories/loitering.csv
head -n 1 datasets/train.csv | awk '{print $1",MISSING PERSON"}' > datasets/categories/missing-person.csv

NUMBER_OF_LINES=$(grep ',MISSING PERSON,' datasets/train.csv | wc -l)

grep ',MISSING PERSON,' datasets/train.csv | sed 's/.*/&,TRUE/' >> datasets/categories/missing-person.csv

grep -v ',MISSING PERSON,' datasets/train.csv   | sed 's/.*/&,FALSE/'   | ruby -e "puts ARGF.readlines.drop(1).shuffle.take($NUMBER_OF_LINES)"   >> datasets/categories/missing-person.csv
head -n 1 datasets/train.csv | awk '{print $1",NON-CRIMINAL"}' > datasets/categories/non-criminal.csv

NUMBER_OF_LINES=$(grep ',NON-CRIMINAL,' datasets/train.csv | wc -l)

grep ',NON-CRIMINAL,' datasets/train.csv | sed 's/.*/&,TRUE/' >> datasets/categories/non-criminal.csv

grep -v ',NON-CRIMINAL,' datasets/train.csv   | sed 's/.*/&,FALSE/'   | ruby -e "puts ARGF.readlines.drop(1).shuffle.take($NUMBER_OF_LINES)"   >> datasets/categories/non-criminal.csv
head -n 1 datasets/train.csv | awk '{print $1",OTHER OFFENSES"}' > datasets/categories/other-offenses.csv

NUMBER_OF_LINES=$(grep ',OTHER OFFENSES,' datasets/train.csv | wc -l)

grep ',OTHER OFFENSES,' datasets/train.csv | sed 's/.*/&,TRUE/' >> datasets/categories/other-offenses.csv

grep -v ',OTHER OFFENSES,' datasets/train.csv   | sed 's/.*/&,FALSE/'   | ruby -e "puts ARGF.readlines.drop(1).shuffle.take($NUMBER_OF_LINES)"   >> datasets/categories/other-offenses.csv
head -n 1 datasets/train.csv | awk '{print $1",PORNOGRAPHY/OBSCENE MAT"}' > datasets/categories/pornography-obscene-mat.csv

NUMBER_OF_LINES=$(grep ',PORNOGRAPHY/OBSCENE MAT,' datasets/train.csv | wc -l)

grep ',PORNOGRAPHY/OBSCENE MAT,' datasets/train.csv | sed 's/.*/&,TRUE/' >> datasets/categories/pornography-obscene-mat.csv

grep -v ',PORNOGRAPHY/OBSCENE MAT,' datasets/train.csv   | sed 's/.*/&,FALSE/'   | ruby -e "puts ARGF.readlines.drop(1).shuffle.take($NUMBER_OF_LINES)"   >> datasets/categories/pornography-obscene-mat.csv
head -n 1 datasets/train.csv | awk '{print $1",PROSTITUTION"}' > datasets/categories/prostitution.csv

NUMBER_OF_LINES=$(grep ',PROSTITUTION,' datasets/train.csv | wc -l)

grep ',PROSTITUTION,' datasets/train.csv | sed 's/.*/&,TRUE/' >> datasets/categories/prostitution.csv

grep -v ',PROSTITUTION,' datasets/train.csv   | sed 's/.*/&,FALSE/'   | ruby -e "puts ARGF.readlines.drop(1).shuffle.take($NUMBER_OF_LINES)"   >> datasets/categories/prostitution.csv
head -n 1 datasets/train.csv | awk '{print $1",RECOVERED VEHICLE"}' > datasets/categories/recovered-vehicle.csv

NUMBER_OF_LINES=$(grep ',RECOVERED VEHICLE,' datasets/train.csv | wc -l)

grep ',RECOVERED VEHICLE,' datasets/train.csv | sed 's/.*/&,TRUE/' >> datasets/categories/recovered-vehicle.csv

grep -v ',RECOVERED VEHICLE,' datasets/train.csv   | sed 's/.*/&,FALSE/'   | ruby -e "puts ARGF.readlines.drop(1).shuffle.take($NUMBER_OF_LINES)"   >> datasets/categories/recovered-vehicle.csv
head -n 1 datasets/train.csv | awk '{print $1",ROBBERY"}' > datasets/categories/robbery.csv

NUMBER_OF_LINES=$(grep ',ROBBERY,' datasets/train.csv | wc -l)

grep ',ROBBERY,' datasets/train.csv | sed 's/.*/&,TRUE/' >> datasets/categories/robbery.csv

grep -v ',ROBBERY,' datasets/train.csv   | sed 's/.*/&,FALSE/'   | ruby -e "puts ARGF.readlines.drop(1).shuffle.take($NUMBER_OF_LINES)"   >> datasets/categories/robbery.csv
head -n 1 datasets/train.csv | awk '{print $1",RUNAWAY"}' > datasets/categories/runaway.csv

NUMBER_OF_LINES=$(grep ',RUNAWAY,' datasets/train.csv | wc -l)

grep ',RUNAWAY,' datasets/train.csv | sed 's/.*/&,TRUE/' >> datasets/categories/runaway.csv

grep -v ',RUNAWAY,' datasets/train.csv   | sed 's/.*/&,FALSE/'   | ruby -e "puts ARGF.readlines.drop(1).shuffle.take($NUMBER_OF_LINES)"   >> datasets/categories/runaway.csv
head -n 1 datasets/train.csv | awk '{print $1",SECONDARY CODES"}' > datasets/categories/secondary-codes.csv

NUMBER_OF_LINES=$(grep ',SECONDARY CODES,' datasets/train.csv | wc -l)

grep ',SECONDARY CODES,' datasets/train.csv | sed 's/.*/&,TRUE/' >> datasets/categories/secondary-codes.csv

grep -v ',SECONDARY CODES,' datasets/train.csv   | sed 's/.*/&,FALSE/'   | ruby -e "puts ARGF.readlines.drop(1).shuffle.take($NUMBER_OF_LINES)"   >> datasets/categories/secondary-codes.csv
head -n 1 datasets/train.csv | awk '{print $1",SEX OFFENSES FORCIBLE"}' > datasets/categories/sex-offenses-forcible.csv

NUMBER_OF_LINES=$(grep ',SEX OFFENSES FORCIBLE,' datasets/train.csv | wc -l)

grep ',SEX OFFENSES FORCIBLE,' datasets/train.csv | sed 's/.*/&,TRUE/' >> datasets/categories/sex-offenses-forcible.csv

grep -v ',SEX OFFENSES FORCIBLE,' datasets/train.csv   | sed 's/.*/&,FALSE/'   | ruby -e "puts ARGF.readlines.drop(1).shuffle.take($NUMBER_OF_LINES)"   >> datasets/categories/sex-offenses-forcible.csv
head -n 1 datasets/train.csv | awk '{print $1",SEX OFFENSES NON FORCIBLE"}' > datasets/categories/sex-offenses-non-forcible.csv

NUMBER_OF_LINES=$(grep ',SEX OFFENSES NON FORCIBLE,' datasets/train.csv | wc -l)

grep ',SEX OFFENSES NON FORCIBLE,' datasets/train.csv | sed 's/.*/&,TRUE/' >> datasets/categories/sex-offenses-non-forcible.csv

grep -v ',SEX OFFENSES NON FORCIBLE,' datasets/train.csv   | sed 's/.*/&,FALSE/'   | ruby -e "puts ARGF.readlines.drop(1).shuffle.take($NUMBER_OF_LINES)"   >> datasets/categories/sex-offenses-non-forcible.csv
head -n 1 datasets/train.csv | awk '{print $1",STOLEN PROPERTY"}' > datasets/categories/stolen-property.csv

NUMBER_OF_LINES=$(grep ',STOLEN PROPERTY,' datasets/train.csv | wc -l)

grep ',STOLEN PROPERTY,' datasets/train.csv | sed 's/.*/&,TRUE/' >> datasets/categories/stolen-property.csv

grep -v ',STOLEN PROPERTY,' datasets/train.csv   | sed 's/.*/&,FALSE/'   | ruby -e "puts ARGF.readlines.drop(1).shuffle.take($NUMBER_OF_LINES)"   >> datasets/categories/stolen-property.csv
head -n 1 datasets/train.csv | awk '{print $1",SUICIDE"}' > datasets/categories/suicide.csv

NUMBER_OF_LINES=$(grep ',SUICIDE,' datasets/train.csv | wc -l)

grep ',SUICIDE,' datasets/train.csv | sed 's/.*/&,TRUE/' >> datasets/categories/suicide.csv

grep -v ',SUICIDE,' datasets/train.csv   | sed 's/.*/&,FALSE/'   | ruby -e "puts ARGF.readlines.drop(1).shuffle.take($NUMBER_OF_LINES)"   >> datasets/categories/suicide.csv
head -n 1 datasets/train.csv | awk '{print $1",SUSPICIOUS OCC"}' > datasets/categories/suspicious-occ.csv

NUMBER_OF_LINES=$(grep ',SUSPICIOUS OCC,' datasets/train.csv | wc -l)

grep ',SUSPICIOUS OCC,' datasets/train.csv | sed 's/.*/&,TRUE/' >> datasets/categories/suspicious-occ.csv

grep -v ',SUSPICIOUS OCC,' datasets/train.csv   | sed 's/.*/&,FALSE/'   | ruby -e "puts ARGF.readlines.drop(1).shuffle.take($NUMBER_OF_LINES)"   >> datasets/categories/suspicious-occ.csv
head -n 1 datasets/train.csv | awk '{print $1",TREA"}' > datasets/categories/trea.csv

NUMBER_OF_LINES=$(grep ',TREA,' datasets/train.csv | wc -l)

grep ',TREA,' datasets/train.csv | sed 's/.*/&,TRUE/' >> datasets/categories/trea.csv

grep -v ',TREA,' datasets/train.csv   | sed 's/.*/&,FALSE/'   | ruby -e "puts ARGF.readlines.drop(1).shuffle.take($NUMBER_OF_LINES)"   >> datasets/categories/trea.csv
head -n 1 datasets/train.csv | awk '{print $1",TRESPASS"}' > datasets/categories/trespass.csv

NUMBER_OF_LINES=$(grep ',TRESPASS,' datasets/train.csv | wc -l)

grep ',TRESPASS,' datasets/train.csv | sed 's/.*/&,TRUE/' >> datasets/categories/trespass.csv

grep -v ',TRESPASS,' datasets/train.csv   | sed 's/.*/&,FALSE/'   | ruby -e "puts ARGF.readlines.drop(1).shuffle.take($NUMBER_OF_LINES)"   >> datasets/categories/trespass.csv
head -n 1 datasets/train.csv | awk '{print $1",VANDALISM"}' > datasets/categories/vandalism.csv

NUMBER_OF_LINES=$(grep ',VANDALISM,' datasets/train.csv | wc -l)

grep ',VANDALISM,' datasets/train.csv | sed 's/.*/&,TRUE/' >> datasets/categories/vandalism.csv

grep -v ',VANDALISM,' datasets/train.csv   | sed 's/.*/&,FALSE/'   | ruby -e "puts ARGF.readlines.drop(1).shuffle.take($NUMBER_OF_LINES)"   >> datasets/categories/vandalism.csv
head -n 1 datasets/train.csv | awk '{print $1",VEHICLE THEFT"}' > datasets/categories/vehicle-theft.csv

NUMBER_OF_LINES=$(grep ',VEHICLE THEFT,' datasets/train.csv | wc -l)

grep ',VEHICLE THEFT,' datasets/train.csv | sed 's/.*/&,TRUE/' >> datasets/categories/vehicle-theft.csv

grep -v ',VEHICLE THEFT,' datasets/train.csv   | sed 's/.*/&,FALSE/'   | ruby -e "puts ARGF.readlines.drop(1).shuffle.take($NUMBER_OF_LINES)"   >> datasets/categories/vehicle-theft.csv
head -n 1 datasets/train.csv | awk '{print $1",WARRANTS"}' > datasets/categories/warrants.csv

NUMBER_OF_LINES=$(grep ',WARRANTS,' datasets/train.csv | wc -l)

grep ',WARRANTS,' datasets/train.csv | sed 's/.*/&,TRUE/' >> datasets/categories/warrants.csv

grep -v ',WARRANTS,' datasets/train.csv   | sed 's/.*/&,FALSE/'   | ruby -e "puts ARGF.readlines.drop(1).shuffle.take($NUMBER_OF_LINES)"   >> datasets/categories/warrants.csv
head -n 1 datasets/train.csv | awk '{print $1",WEAPON LAWS"}' > datasets/categories/weapon-laws.csv

NUMBER_OF_LINES=$(grep ',WEAPON LAWS,' datasets/train.csv | wc -l)

grep ',WEAPON LAWS,' datasets/train.csv | sed 's/.*/&,TRUE/' >> datasets/categories/weapon-laws.csv

grep -v ',WEAPON LAWS,' datasets/train.csv   | sed 's/.*/&,FALSE/'   | ruby -e "puts ARGF.readlines.drop(1).shuffle.take($NUMBER_OF_LINES)"   >> datasets/categories/weapon-laws.csv
