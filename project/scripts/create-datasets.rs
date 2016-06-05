use std::env;
use std::fs::File;
use std::io::BufReader;
use std::io::BufWriter;
use std::io::prelude::*;
use std::io;

fn write_line(writer: &mut BufWriter<File>, line: &str) -> usize {
    writer.write(format!("{}\n", line).as_bytes()).expect("Failed to write line")
}

fn create_dataset(input_name: &str, output_name: &str, nth: i32) -> Result<(), io::Error> {
    let mut row_number = 0;

    let input_file = try!(File::open(input_name));
    let output_file = try!(File::create(output_name));

    let reader = BufReader::new(input_file);
    let mut writer = BufWriter::new(output_file);

    for line in reader.lines() {
        if row_number % nth == 0 {
            write_line(&mut writer, &try!(line));
        }

        row_number += 1;
    }

    // Signal success
    Ok(())
}

fn main() {
    // For example ./scripts/create-datasets datasets/train.csv datasets/test.csv
    let filename1 = &env::args().nth(1).expect("Missing argument <train.csv>");
    let filename2 = &env::args().nth(2).expect("Missing argument <test.csv>");

    // See https://primes.utm.edu/lists/small/10000.txt
    let prime1 = 139;
    let prime2 = 31;
    let prime3 = 1;

    // Take each nth line and output to file
    create_dataset(filename1, "datasets/a/train.csv", prime1).unwrap();
    create_dataset(filename1, "datasets/b/train.csv", prime2).unwrap();
    create_dataset(filename1, "datasets/c/train.csv", prime3).unwrap();

    // Idem dito for test sets
    create_dataset(filename2, "datasets/a/test.csv", prime1).unwrap();
    create_dataset(filename2, "datasets/b/test.csv", prime2).unwrap();
    create_dataset(filename2, "datasets/c/test.csv", prime3).unwrap();
}
