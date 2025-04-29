// structs3.nr
// use the `hint` watch subcommand for a hint.


struct Address {
    street_number: Field,
    zip_code: Field,
}

// TODO: Define a struct called 'Person' with these fields:
// - name: str<10>
// - age: Field
// - home_address: Address

struct Person {
    name: str<10>,
    age: Field,
    home_address: Address
}

fn create_person(name: str<10>, age: Field, street_num: Field, zip: Field) -> Person {
    // TODO: Create and return a Person instance with the given parameters

    let person = Person {
        name: name,
        age: age, 
        home_address: Address {
            street_number: street_num,
            zip_code: zip,  
        },
    };

    person
}

fn main() {
    let person = create_person("JohhnDOOEE", 30, 123, 12345);

    assert(person.age == 30);
    assert(person.home_address.street_number == 123);
    assert(person.home_address.zip_code == 12345);
}

#[test]
fn test_person() {
    main();
}
