<p style="text-align:center">The purpose of this document is to define the type of experience I'm trying to create with Vertis by describing different aspects of the game through clear cut design principles.</p>

# Camera

The camera should help the player anticipate jumps without revealing too much of the level.

## Design Principles
```
- Shows whole stage.
- Fixed at stage, does not follow player.
- Fixed zoom.
- Hortizontal centering.
- No rotation.
- Slight vertical bias.
- Give close to 2D feel with minimal 3D element.
- No cinematic movement.
```

## Reasoning

Since Vertis is focused on precision platforming, the player should always have enough information to plan their next jump while still being punished for mistakes. The camera should never become an obstacle, but it also shouldn't remove the challenge by revealing too much of the level.

# Movement

Movement should feel deliberate, predictable, and entirely skill-based. Every successful jump should be the result of player execution rather than luck. Likewise, every failed jump should feel like a mistake the player can recognize and learn from.

## Philosophy

Movement is the primary gameplay mechanic. The player never becomes stronger through upgrades or abilities. Progression comes from improving mechanical skill and understanding the game's physics. The controls should be simple to learn but difficult to master.

## Design Principles
```
- Input should always produce consistent results.
- Responsive.
- Not overly forgiving.
- Yields logical and consequential gameplay to succeeed.
- Player understands every action had weight and purpose.
- Rewards patience.
```

## Mechanics

### Horizontal Movement

The player can move freely left and right while grounded. Horizontal movement should feel responsive and allow precise positioning before attempting a jump.

### Jump Charging

Holding the jump button charges the player's jump. The duration of the charge determines the jump's strength. The player must decide when to release the jump, introducing risk and commitment to every attempt.

### Air Control

Air control should be minimal. The player should only be able to make slight adjustments while airborne. Once a jump has been committed, the trajectory should largely be determined by the initial charge and direction.

### Landing

Landing should feel impactful. A brief recovery animation reinforces the weight of the character without making the controls feel sluggish.

### Falling

Falling is a natural part of progression. Recovering from failure should be part of the gameplay loop rather than a punishment to avoid.

## Player Experience

The player should feel:
```
- In control of every jump.
- Commitment to every jump.
- Confident that the mechanics are fair.
- Tense before committing to difficult jumps.
- Motivated to improve after every failure.
```

## Future Considerations

Potential mechanics to explore later:
```
- Wind zones.
- Environmental hazards.
- Moving platforms.
- Ice or slippery surfaces.
- Bounce objects.
```
These mechanics should only be introduced if they complement the core movement philosophy without compromising predictability.

--- 

<p style="text-align:center">Principles subject to change as development progresses.</p>

