// passphrase in hex (needed for Field): 0x69206c696b65206e6163686f74
// pedersen hash of passphrase: 0x0e587aef01ecd02f545fa8f7e6978b5fecb679256d7b598009dc57c00eff0fbd

// test command: nargo test --show-output

use dep::std; //standard library to calculate different hashes

//pedersen it's the fasted hash to calculate

struct Person {
    name: str<6>,
    age: u8
}

global minimumAge: u8 = 18;


fn main(member: Person, passphrase: Field, passphraseHash: pub Field) {
    assert(member.age >= minimumAge);
    let calculatedPassphraseHash: _ = std::hash::pedersen_hash([passphrase, 0]);
    assert(calculatedPassphraseHash == passphraseHash);

}

#[test]

fn get_passphrase_hash() {
    let passphrase: Field = 0x69206c696b65206e6163686f74; 
    let calculatedPassphraseHash: _ = std::hash::pedersen_hash([passphrase, 0]);
    println(calculatedPassphraseHash);
}

#[test]
fn test_main() {
    let passphrase: Field = 0x69206c696b65206e6163686f74; 
    let passphraseHash: Field = 0x0e587aef01ecd02f545fa8f7e6978b5fecb679256d7b598009dc57c00eff0fbd;
    let raquel = Person {
        name: "Raquel", 
        age: 27,
    };

    main(raquel, passphrase, passphraseHash);
}
