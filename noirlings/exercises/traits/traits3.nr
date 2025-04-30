// traits3.nr
// use the `hint` watch subcommand for a hint.
// Generic Traits: This exercise demonstrates how to work with generic traits

use std::wrapping_mul;

trait Convert<T> {
    fn convert(self) -> T;
}

struct Celsius {
temp: Field,
}

struct Fahrenheit {
    temp: Field,
}

// TODO: Implement Convert trait to convert Celsius to Fahrenheit
// Formula: F = (C X 9/5) + 32
impl Convert<Fahrenheit> for Celsius {

    fn convert(self) -> Fahrenheit {  // Correct method name
        let step1 = wrapping_mul(self.temp, 9);  // Use self.temp
        let step2 = step1 / 5;
        let fahrenheit_temp = step2 + 32;
        
        // Return a Fahrenheit struct
        Fahrenheit { temp: fahrenheit_temp }
    }
    
}

#[test]
fn test_temperature_conversion() {
    let celsius = Celsius { temp: 0 };
    let fahrenheit = celsius.convert();
    assert(fahrenheit.temp == 32);

    let celsius = Celsius { temp: 100 };
    let fahrenheit = celsius.convert();
    assert(fahrenheit.temp == 212);
}
