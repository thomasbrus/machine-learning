use std::env;
use std::fs::File;
use std::io::BufReader;
use std::io::BufWriter;
use std::path::PathBuf;
use std::io::prelude::*;
use std::io;

fn write_line(writer: &mut BufWriter<File>, line: &str) -> usize {
    writer.write(format!("{}\n", line).as_bytes()).expect("Failed to write line")
}

fn create_dataset(input_name: &str, output_name: PathBuf, nth: i32) -> Result<(), io::Error> {
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

fn build_output_path(dirname: &str) -> PathBuf {
    let mut path = PathBuf::new();
    path.push("datasets");
    path.push("train");
    path.push(dirname);
    path.push("train");
    path.set_extension("csv");
    path
}

fn main() {
    // For example ./scripts/create-datasets datasets/train.csv
    let filename1 = &env::args().nth(1).expect("Missing argument <train.csv>");

    // See https://primes.utm.edu/lists/small/10000.txt
    let prime1 = 88;
    let prime2 = 7;
    let prime3 = 1;

    // Take each nth line and output to file
    create_dataset(filename1, build_output_path("a"), prime1).unwrap();
    create_dataset(filename1, build_output_path("b"), prime2).unwrap();
    create_dataset(filename1, build_output_path("c"), prime3).unwrap();
}
