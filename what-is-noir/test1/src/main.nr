fn main(x: Field, y: pub Field) {
    assert(x != y);
}

#[test]
fn test_main() {
    main(3, 2);

    // Uncomment to make test fail
    // main(1, 1);
}
