// integers2.nr
// Learn about signed and unsigned integers with temperature conversion
use std::{wrapping_mul};

fn celsius_to_fahrenheit(celsius: i8) -> i16 {
    
    let mut celsius_i16: i16 = 0;
    
    if celsius < 0 {
        celsius_i16 = -((-celsius) as i16);
    } else {
        celsius_i16 = celsius as i16;
    }    println(f"{celsius_i16}C as i16");

    
    // Break down calculation into explicit steps
    let step1: i16 = wrapping_mul(celsius_i16, 9);
    println(f"{celsius}C * 9 = {step1}");
    
    let step2 = step1 / 5;
    println(f"{step1} / 5 = {step2}");
    
    let fahrenheit = step2 + 32;
    println(f"{step2} + 32 = {fahrenheit}");
    
    fahrenheit
}

fn is_freezing(temps: [i8; 3]) -> [bool; 3] {
    // Return array of booleans indicating if each temperature is below freezing (0C)
    let result = [temps[0] < 0, temps[1] < 0, temps[2] < 0];
    
    // Extract individual values for printing
    let temp0 = temps[0];
    let temp1 = temps[1];
    let temp2 = temps[2];
    let res0 = result[0];
    let res1 = result[1];
    let res2 = result[2];
    
    println(f"Temperatures: {temp0}C, {temp1}C, {temp2}C");
    println(f"Freezing results: {res0}, {res1}, {res2}");
    
    result

}

fn main() {
    // Test temperature conversion
    assert(celsius_to_fahrenheit(0) == 32);
    assert(celsius_to_fahrenheit(-40) == -40);
    assert(celsius_to_fahrenheit(100) == 212);
    
    // Test freezing temperatures
    let temps = [-5, 0, 20];
    let freezing = is_freezing(temps);
    assert(freezing == [true, false, false]);
}

#[test]
fn test_temperature() {
    main();
}
