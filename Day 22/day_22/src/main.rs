// Advent of Code 2021 Day 22
// Created December 22nd, 2021.

use std::fs;
use std::time::{Instant};
use std::collections::HashMap;

#[derive(Debug, Eq, Hash, PartialEq)]
struct Rectangle<'a> {
	xmin: i64,
	ymin: i64,
	zmin: i64,
	xmax: i64,
	ymax: i64,
	zmax: i64,
	light: &'a str
}


fn main() {
	let start = Instant::now();

	let file = "../Day22TrimmedInput.txt";
	let input_raw: String = fs::read_to_string(file).unwrap();
	
	let mut rectangles: Vec<Rectangle> = Vec::new();
	
	let mut x_range = vec![];
	let mut y_range = vec![];
	let mut z_range = vec![];
	
	for line in input_raw.lines() {
		let mut tokens = line.split(|c| c == ' ' || c == ',');
		let keyword = tokens.next().unwrap();

		let xmin: i64 = tokens.next().unwrap().parse().unwrap();
		let xmax: i64 = tokens.next().unwrap().parse::<i64>().unwrap() + 1; // Plus one is critical!
		let ymin: i64 = tokens.next().unwrap().parse().unwrap();
		let ymax: i64 = tokens.next().unwrap().parse::<i64>().unwrap() + 1;
		let zmin: i64 = tokens.next().unwrap().parse().unwrap();
		let zmax: i64 = tokens.next().unwrap().parse::<i64>().unwrap() + 1;
		let light: &str = keyword;
		
		x_range.push(xmin);
		x_range.push(xmax);
		y_range.push(ymin);
		y_range.push(ymax);
		z_range.push(zmin);
		z_range.push(zmax);
		
		rectangles.push(Rectangle{xmin,ymin,zmin,xmax,ymax,zmax,light});
	}
	
	x_range.sort();
	x_range.dedup();
	y_range.sort();
	y_range.dedup();
	z_range.sort();
	z_range.dedup();
	
	let mut x_diff = Vec::with_capacity(x_range.len());
	let mut x_hash = HashMap::new();
	
	for i in 0..(x_range.len()) {
		if i < x_range.len() - 1 {
			x_diff.push(x_range[i+1] - x_range[i]);
		} else {
			x_diff.push(1);
		}
		x_hash.insert(x_range[i],i as usize);
	};
	
	let mut y_diff = Vec::with_capacity(y_range.len());
	let mut y_hash = HashMap::new();
	
	for i in 0..(y_range.len()) {
		if i < y_range.len() - 1 {
			y_diff.push(y_range[i+1] - y_range[i]);
		} else {
			y_diff.push(1);
		}
		y_hash.insert(y_range[i],i as usize);
	};
	
	let mut z_diff = Vec::with_capacity(z_range.len());
	let mut z_hash = HashMap::new();
	
	for i in 0..(z_range.len()) {
		if i < z_range.len() - 1 {
			z_diff.push(z_range[i+1] - z_range[i]);
		} else {
			z_diff.push(1);
		}
		z_hash.insert(z_range[i],i as usize);
	};
	
	let mut first_lights = vec![vec![vec![0i64; z_range.len()]; y_range.len()]; x_range.len()];
	
	for r in rectangles {
	
		let xmin = *(x_hash.get(&r.xmin).unwrap());
		let xmax = *(x_hash.get(&r.xmax).unwrap());
		let ymin = *(y_hash.get(&r.ymin).unwrap());
		let ymax = *(y_hash.get(&r.ymax).unwrap());
		let zmin = *(z_hash.get(&r.zmin).unwrap());
		let zmax = *(z_hash.get(&r.zmax).unwrap());
	
		for row in &mut first_lights[xmin..xmax] {
			for col in &mut row[ymin..ymax] {
				for val in &mut col[zmin..zmax] {
					*val = match r.light {
						"on" => 1,
						"off" => 0,
						_ => 0
					}
				}
			}
		}
	}
	
	let mut part1 = 0;
	
	for i in 0..x_range.len() {
		for j in 0..y_range.len() {
			for k in 0..z_range.len() {
				part1 += first_lights[i][j][k] * x_diff[i] * y_diff[j] * z_diff[k];
			}
		}
	}
	
	let end = start.elapsed().as_micros();
	
	println!("Part 2: {}",part1);
    println!("Time: {} μs", end);
}
