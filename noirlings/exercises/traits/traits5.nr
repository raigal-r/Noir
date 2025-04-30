// traits5.nr
// use the `hint` watch subcommand for a hint.
// Trait Bounds: This exercise demonstrates how to use trait bounds with generics

trait Maximum {
    fn max(self, other: Self) -> Self;
}

// TODO: Implement a generic function find_maximum that takes an array of any type T
// that implements Maximum and returns the maximum value
fn find_maximum<T>(values: [T; 5]) -> T where T: Maximum {
    // Start with first element as current maximum
    let mut current_max = values[0];
    
    // Compare with each remaining element
    for i in 1..5 {
        current_max = current_max.max(values[i]);
    }
    
    current_max


}

// Here's an implementation of Maximum for Field to help test your function
impl Maximum for Field {
    fn max(self, other: Self) -> Self {
        if self.lt(other) {
            other
        } else {
            self
        }
    }
}

#[test]
fn test_find_maximum() {
    let numbers = [1, 5, 3, 8, 2];
    let max = find_maximum(numbers);
    assert(max == 8);
}
