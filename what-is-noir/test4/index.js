const { UltraHonkBackend } = require('@aztec/bb.js');
const { Noir } = require('@noir-lang/noir_js');
const main = require('./circuits/main/target/circuits.json');
const { writeFileSync } = require('fs');

async function generateAndVerifyProof() {
    const noir = new Noir(main);
    const backend = new UltraHonkBackend(main.bytecode);

    //const input = { x: 1, y: 2 };
    //const { witness } = await noir.execute(input);

    //define the imput 
    const input = {x:1, y:2};

    //generate the witness
    const { witness } = await noir.execute(input);

    //generate the proof
    console.log("Generating proof...");
    const proof = await backend.generateProof(witness);

    console.log("Proof generated:", proof.proof);

    //write proof and witness to file
        
    const proofHex = '0x' + Array.from(proof.proof)
        .map(byte => byte.toString(16).padStart(2, '0'))
        .join('');

    const publicInputsHex = proof.publicInputs.map(input => {
        if (typeof input === 'string' && input.startsWith('0x')) {
            return input;
        } else {
            return '0x' + Buffer.from(input).toString('hex');
        }
    });

    const proofData = {
        proof: proofHex,
        publicInputs: publicInputsHex
    };

    writeFileSync('proof.json', JSON.stringify(proofData, null, 2));
    console.log("Proof saved to proof.json as hex string");
    
    console.log("Verifying proof...");
    
    //verify proof
    const verified = await backend.verifyProof(proof);
    console.log("Verified:", verified);
}

generateAndVerifyProof().catch(console.error);
