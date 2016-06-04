# README

...

## GETTING STARTED

- Place train.csv and test.csv in `datasets` directory
- Run `rustc scripts/create-datasets.rs -o bin/create-datasets`
- Execute `./bin/create-datasets datasets/train.csv datasets/test.csv`
- Run `ruby scripts/normalize.rb datasets/a/train.csv > datasets/a/train-normalized.csv` to create a normalized training set
- Use Weka to perform classification
