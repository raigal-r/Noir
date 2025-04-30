// strings2.nr

fn get_ascii_sum(text: str<5>) -> Field {
    // TODO: Return the sum of ASCII values of all characters
    // Hint: Convert string to bytes and sum them

    let bytes = text.as_bytes();

    let mut sum: Field = 0;

    for i in 0..5 {
        sum += bytes[i] as Field;
    }
    println(f"Final sum: {sum}");

    sum

}

fn main() {
    assert(get_ascii_sum("Hello") == 500); // Sum of ASCII values of "Hello"
}

#[test]
fn test_hex_and_ascii() {
    main();
}
