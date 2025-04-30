// slice1.nr
// use the `hint` watch subcommand for a hint.

fn main() {
    // TODO:
    // 1. Create a slice with initial values [1, 2, 3]
    let mut slice: [Field] = &[1, 2, 3];

    // 2. Add element 4 to the end of the slice (hint: use `push_back` method)
    slice = slice.push_back(4);

    // 3. Add element 0 to the beginning of the slice
     slice = slice.push_front(0);

    // Tests

    assert(slice.len() == 5);
    assert(slice[0] == 0);
    assert(slice[4] == 4);
}

#[test]
fn test_basic_operations() {
    main();
}
