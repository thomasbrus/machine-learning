extern crate csv;
extern crate rustc_serialize;
extern crate chrono;

use std::env;
use chrono::*;

#[allow(dead_code)]
#[derive(RustcDecodable, Debug)]
struct InputRecord {
    date: String,
    category: String,
    descript: String,
    day_of_week: String,
    pd_district: String,
    resolution: String,
    address: String,
    x: f32,
    y: f32
}

#[allow(dead_code)]
#[derive(RustcEncodable, Debug, Clone)]
struct OutputRecord {
    day_of_week: String,
    category: String,
    pd_district: String,
    x: f32,
    y: f32,
    timestamp: i64,
    month: String,
    hour: u32,
    part: String
}

fn parse_date(input: String) -> DateTime<UTC> {
    UTC.datetime_from_str(&input, "%Y-%m-%d %H:%M:%S").unwrap()
}

fn extract_month(datetime: DateTime<UTC>) -> String {
    datetime.format("%B").to_string()
}

fn extract_part_of_day(datetime: DateTime<UTC>) -> String {
    let parts = ["MORNING", "AFTERNOON", "EVENING", "NIGHT"];
    let hour = datetime.hour() as i32;
    let index = (((hour + 24 - 5) % 24) / 6) as usize;
    return parts[index].to_string();
}

fn main() {
    let input_filename = &env::args().nth(1).expect("Missing argument <input.csv>");
    let output_filename = &env::args().nth(2).expect("Missing argument <output.csv>");
    // let category = &env::args().nth(3).expect("Missing argument <category>");

    // Open CSV for reading
    let mut reader = csv::Reader::from_file(input_filename).unwrap();

    // Set up csv writer
    let mut writer = csv::Writer::from_file(output_filename).unwrap();
    writer.encode([ "DayOfWeek", "Category", "PdDistrict", "X", "Y",
                    "Timestamp", "Month", "Hour", "PartOfDay",
                    // "TrendLine", "TrendCount", "TrendNormalized"
                  ]).unwrap();

    // Loop through records
    for record in reader.decode() {
        let record_in: InputRecord = record.unwrap();

        // Extract datetime & timestamp
        let datetime = parse_date(record_in.date);
        let timestamp = datetime.timestamp();

        // Extract month
        let month = extract_month(datetime);

        // Extract hour of day
        let hour = datetime.hour();

        // Extract part of day
        let part = extract_part_of_day(datetime);

        // Build record & write to file
        let record_out = OutputRecord {
            day_of_week: record_in.day_of_week,
            category: record_in.category,
            pd_district: record_in.pd_district,
            x: record_in.x,
            y: record_in.y,
            timestamp: timestamp,
            month: month,
            hour: hour,
            part: part
        };

        // Write transformed record to out.csv
        writer.encode(record_out).unwrap();
    }
}
