// Advent of Code 2021 Day 24
// Created December 24th, 2021.

use std::time::{Instant};
use std::collections::HashMap;
//use rand::distributions::{Distribution, Uniform};
//use rand::Rng;

fn component(z: i64, w: i64, cus: (i64, i64, i64)) -> i64{
	let d = cus.0;
	let a1 = cus.1;
	let a2 = cus.2;

	let mut x = z % 26;
	let mut new_z = z / d;
	x += a1;
	if x == w {
		x = 1;
	} else {
		x = 0;
	}
	if x == 0 {
		x = 1;
	} else {
		x = 0;
	}
	
	let mut y = 25*x + 1;
	new_z = new_z * y;
	y = (w + a2) * x;
	new_z += y;

	return new_z
}

fn increment_digits(digits: &mut Vec<i64>){
	let mut last = digits.len() - 1;
	while digits[last] == 9 {
		if last == 0 {panic!("Ran out of digits!")};
		last -= 1;
	}
	
	for i in last+1..digits.len() {
		digits[i] = 1;
	}
	digits[last] += 1;
}


fn main() {
	let custom: [(i64, i64, i64); 14] = [(1,12,6),(1,10,6),(1,13,3),(26,-11,11),(1,13,9),(26,-1,3),(1,10,13),(1,11,6),(26,0,14),(1,10,10),(26,-5,12),(26,-16,10),(26,-7,11),(26,-11,15)];
	let option_list: Vec<i64> = vec![ 
8337,8338,8339,8340,8341,8342,8363,8364,8365,8366,8367,8368,8389,8390,8391,8392,8393,8394,8415,8416,8417,8418,8419,8420,8441,8442,8443,8444,8445,8446,8467,8468,8469,8470,8471,8472,8493,8494,8495,8496,8497,8498,8519,8520,8521,8522,8523,8524,9013,9014,9015,9016,9017,9018,9039,9040,9041,9042,9043,9044,9065,9066,9067,9068,9069,9070,9091,9092,9093,9094,9095,9096,9117,9118,9119,9120,9121,9122,9143,9144,9145,9146,9147,9148,9169,9170,9171,9172,9173,9174,9195,9196,9197,9198,9199,9200,9689,9690,9691,9692,9693,9694,9715,9716,9717,9718,9719,9720,9741,9742,9743,9744,9745,9746,9767,9768,9769,9770,9771,9772,9793,9794,9795,9796,9797,9798,9819,9820,9821,9822,9823,9824,9845,9846,9847,9848,9849,9850,9871,9872,9873,9874,9875,9876,10365,10366,10367,10368,10369,10370,10391,10392,10393,10394,10395,10396,10417,10418,10419,10420,10421,10422,10443,10444,10445,10446,10447,10448,10469,10470,10471,10472,10473,10474,10495,10496,10497,10498,10499,10500,10521,10522,10523,10524,10525,10526,10547,10548,10549,10550,10551,10552];
	let mut options = HashMap::new();
	for option in option_list {
		options.insert(option, true);
	}

	let mut digits_prefix = vec![1, 1, 1, 1, 1, 1, 1, 1, 1];
	// First solution: 99911952827284
	
	//let mut min: i64 = 1_000_000_000;
	let start = Instant::now();
	let mut hot: u64 = 0;
	let mut part1: Option<Vec<i64>> = None;
	let mut part2: Option<Vec<i64>> = None;
	let mut matches = 0;
	
	for _i in 0..9_usize.pow(digits_prefix.len() as u32)-1 {
		let mut z = 0;
		hot += 1;
		//let digits: Vec<i64> = (0..14).map(|_| rng.sample(&between)).collect();
		
		for line in 0..digits_prefix.len() {
			z = component(z, digits_prefix[line], custom[line]);
		};
		
		if options.contains_key(&z) {
			let mut digits_suffix = vec![1, 1, 1, 1, 1];
			for _j in 0..9_usize.pow(digits_suffix.len() as u32)-1 {
				hot += 1;
				let mut new_z = z;
				for line in 0..digits_suffix.len() {
					new_z = component(new_z, digits_suffix[line], custom[line + digits_prefix.len()]);
				};
				if new_z == 0 {
					matches += 1;
					let mut digits = digits_prefix.clone();
					digits.append(&mut digits_suffix.clone());
					if part2.is_none() {
						part2 = Some(digits.clone());
					};
					part1 = Some(digits.clone());
					//println!("Time: {} μs, Iterations: {}, Digits: {:?}",start.elapsed().as_micros(), hot, digits);
				}
				increment_digits(&mut digits_suffix);
			}
		}
		let sum: i64 = digits_prefix.iter().sum();
		if sum == digits_prefix.len() as i64 * 9 {
			break;
		}
		increment_digits(&mut digits_prefix);
	}
	println!("Time: {} μs, {} matches found in {} iterations.",start.elapsed().as_micros(), matches, hot);
	println!("Part 1: {:?}", part1.unwrap());
	println!("Part 2: {:?}", part2.unwrap());
}
