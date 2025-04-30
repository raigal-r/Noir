// field1.nr
// use the `hint` watch subcommand for a hint.

// For Noir default backend, Grumpkin curve, order of the field value P is 21888242871839275222246405745257275088548364400416034343698204186575808495617


fn main() {
  let p: Field = 21888242871839275222246405745257275088548364400416034343698204186575808495616;

  let p1: Field = p + 1;

  assert(p1 == 0, "incorrect p1 value");

  let p2: Field = p * p;
  assert(p2 == 1, "incorrect p2 value");
}


