extern crate csv;
extern crate rustc_serialize;
extern crate chrono;

use std::env;
use std::collections::HashMap;
use std::collections::HashSet;
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
    part: String,
    trend_line: f64,
    trend_count: f64,
    trend_normalized: f64
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
    // TODO: Add `category` parameter and output to output/category.csv..., then do the split

    // Open CSV for reading
    let mut reader = csv::Reader::from_file(input_filename).unwrap();

    // Keep maps of records by category & pd district
    let mut records_by_category: HashMap<String, Vec<i64>> = HashMap::new();
    let mut records_by_pd_district: HashMap<String, Vec<i64>> = HashMap::new();

    // TODO: output [0, 0, 0] if trend_size < 2
    // TODO: speed up stuff by removing intersection of two sets

    // Set up csv writer
    let mut writer = csv::Writer::from_file(output_filename).unwrap();

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

        // Append the current datetime to the categories map
        let category_key = record_in.category.to_string();

        if records_by_category.contains_key(&category_key) {
            let mut timestamps = records_by_category.get_mut(&category_key).unwrap();
            timestamps.push(timestamp);
        } else {
            records_by_category.insert(category_key, vec![timestamp]);
        }

        // Append the current datetime to the pd district map
        let pd_district_key = record_in.pd_district.to_string();

        if records_by_pd_district.contains_key(&pd_district_key) {
            let mut timestamps = records_by_pd_district.get_mut(&pd_district_key).unwrap();
            timestamps.push(timestamp);
        } else {
            records_by_pd_district.insert(pd_district_key, vec![timestamp]);
        }

        // Intersect both maps to find the interesting timestamps
        let category_key = record_in.category.to_string();
        let pd_district_key = record_in.pd_district.to_string();

        let category_indices: HashSet<i64> = records_by_category.get(&category_key)
            .unwrap().iter().cloned().collect();

        let pd_district_indices: HashSet<i64> = records_by_pd_district.get(&pd_district_key)
            .unwrap().iter().cloned().collect();

        let mut timestamps = category_indices.intersection(&pd_district_indices).cloned().collect::<Vec<i64>>();
        timestamps.sort();

        let timestamps_first = *timestamps.first().unwrap();
        let timestamps_last = *timestamps.last().unwrap();
        let timestamps_min = timestamps_last - 60 * 60 * 24 * 30 * 6;

        let timestamps_start = if timestamps_first < timestamps_min { timestamps_min } else { timestamps_first };

        // FIXME: Should this be the current rows time???
        let timestamps_end = timestamps_last;

        let timestamps_size = (timestamps_end - timestamps_start) / 15;

        let timestamps1 = timestamps.iter().clone().filter(|&&timestamp| {
            let t1 = timestamps_start;
            let t2 = timestamps_start + timestamps_size * 8;
            return timestamp >= t1 && timestamp < t2;
        });

        let timestamps2 = timestamps.iter().clone().filter(|&&timestamp| {
            let t1 = timestamps_start + timestamps_size * 8;
            let t2 = timestamps_start + timestamps_size * 12;
            return timestamp >= t1 && timestamp < t2;
        });

        let timestamps3 = timestamps.iter().clone().filter(|&&timestamp| {
            let t1 = timestamps_start + timestamps_size * 12;
            let t2 = timestamps_start + timestamps_size * 14;
            return timestamp >= t1 && timestamp < t2;
        });

        let timestamps4 = timestamps.iter().clone().filter(|&&timestamp| {
            let t1 = timestamps_start + timestamps_size * 14;
            let t2 = timestamps_start + timestamps_size * 15;
            return timestamp >= t1 && timestamp <= t2;
        });

        let timestamps1_count = timestamps1.count() as f64;
        let timestamps2_count = timestamps2.count() as f64;
        let timestamps3_count = timestamps3.count() as f64;
        let timestamps4_count = timestamps4.count() as f64;

        let trend_count = timestamps1_count + timestamps2_count + timestamps3_count + timestamps4_count;

        let delta1 = (timestamps1_count / 8.0) - (timestamps2_count / 4.0);
        let delta2 = (timestamps2_count / 4.0) - (timestamps3_count / 2.0);
        let delta3 = (timestamps3_count / 2.0) - (timestamps4_count / 1.0);

        let trend_line = (delta1 + delta2 + delta3) / 3.0;
        let trend_normalized = trend_line * trend_count;;

        // println!("{}-{} {}", timestamps_start, timestamps_end, timestamps_size);
        // println!("{} {} {} {}", timestamps1.count(), timestamps2.count(), timestamps3.count(), timestamps4.count());
        // println!("{} {} {}", trend_line, trend_count, trend_normalized);

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
            part: part,
            trend_line: trend_line,
            trend_count: trend_count,
            trend_normalized: trend_normalized
        };

        // Write transformed record to out.csv
        writer.encode(record_out).unwrap();
    }
}
