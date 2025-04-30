// integer1.nr

use std::{wrapping_add,wrapping_mul, wrapping_sub};

fn calculate_game_score(kills: u8, deaths: u8, assists: u8) -> u8 {
    
    // Calculate kills * 2 using wrapping_mul to avoid overflow
    let kills_score = wrapping_mul(kills, 2);
    
    // Add assists using wrapping_add
    let kills_and_assists = wrapping_add(kills_score, assists);
    
    // Check if deaths are more than kills*2 + assists
    if deaths > kills_and_assists {
        0
    } else {
        // Subtract deaths using wrapping_sub
        wrapping_sub(kills_and_assists, deaths)
    }
}

fn main() {
    // Normal case
    assert(calculate_game_score(10, 5, 3) == 18);
    
    assert(calculate_game_score(255, 1, 1) == 254); // Should wrap around
    
    // Deaths > kills*2 + assists
    assert(calculate_game_score(1, 10, 2) == 0);
}

#[test]
fn test_game_score() {
    main();
}
