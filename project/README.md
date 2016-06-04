# README

# INSTALLATION
- Ruby (https://www.ruby-lang.org/en/documentation/installation/)
- Rust (https://www.rust-lang.org/downloads.html)
- Weka  (http://www.cs.waikato.ac.nz/ml/weka/downloading.html)

## GETTING STARTED

- Place train.csv and test.csv in `datasets` directory
- Run `rustc scripts/create-datasets.rs -o bin/create-datasets`
- Execute `./bin/create-datasets datasets/train.csv datasets/test.csv`
- Run `ruby scripts/normalize.rb datasets/a/train.csv > datasets/a/train-normalized.csv` to create a normalized training set
- Use Weka to perform classification
