// variables1.nr
// Execute `noirlings hint variables1` or use the `hint` watch subcommand for a hint

// This will not compile, can you fix it to compile successfully

fn main(x: Field, y: Field) {
    let z = x + y; // used to be z = x + y, but z was not declared so needed to be declared by let
    println(f"{x} + {y} = {z}");
}
