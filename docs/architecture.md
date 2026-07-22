<p style="text-align:center">The purpose of this document is to outline the technical architecture of Vertis. It describes how the project is oragnzied, the responsibility of each system, and the reasoning behind important design decisions.</p>

# Project Structure

The project follows a modular architecture using Rojo. Client and server logic are separated, while reusable code is organized into independent modules.
```
src
├── replicatedstorage
│   ├── assets
│   ├── remotes
│   ├── shared
│   └── packages
│
├── serverscriptservice
│   └── services
│
├── starterplayerscripts
│   ├── bootstrap.client.luau
│   └── controllers
│       ├── animationcontroller
│       │   ├── init.luau
│       │   ├── idle.luau
│       │   ├── walk.luau
│       │   ├── charge.luau
│       │   └── jump.luau
│       │
│       ├── audiocontroller
│       │   └── init.luau
│       │
│       ├── cameracontroller
│       │   └── init.luau
│       │
│       ├── menucontroller
│       │   └── init.luau
│       │
│       ├── movementcontroller
│       │   ├── init.luau
│       │   ├── grounding.luau
│       │   ├── input.luau
│       │   ├── jumping.luau
│       │   ├── movement.luau
│       │   ├── rotation.luau
│       │   └── states.luau
│       │
│       └── visualcontroller
│           ├── init.luau
│           └── highlight.luau
│
├── startercharacterscripts
├── startergui
├── replicatedfirst
├── serverstorage
└── soundservice
```
This tree is effected by architectural decisions and is subject to change as I go deeper into development and signifies the current state of the progression.

# Architecture Principles

The core principles of the project:
```
- Single Responsibility Principle
- Modular systems
- Client/Server separation
- Data-driven configuration
- Minimal code duplication
```
Each controller or service should have one clearly defined responsibility (loose coupling).

# Client Architecture

Client-side gameplay systems are managed through controllers. boostrap.client.luau acts as the bootstrapper. Its responsibilities are:
```
- Initialize controllers
- Require gameplay systems
- Defining initialization order
- Serve as client entry point
```
Gameplay logic should not exist inside the bootstrapper itself.

# Controller Pattern

Each gameplay system has it's own controller which are then furhter divided into smaller modules with a single responisiblity.

For Example:
```
MovementController
├── init.luau
├── input.luau
├── movement.luau
└── ... and so on
```
This leads to:
```
- Easier maintenance
- Predictable initialization
- Reduced duplicated code
- Clear ownership
- Reduced merge conflicts
- Independent testing
- Better scalalbility
```

# Camera System

The camera is entirely client-side. Roblox's default camera controller is disabled by setting the camera type to `Scriptable`.

Responsibilities:
```
- Take ownership of the camera
- Position the camera
- Orient the camera
- Configure camera properties
- Maintain a fixed stage view
```

# Camera Philosophy

Rather than continuously following the player, the game is divided into fixed camera screens. Each screen represents a self-contained gameplay challenge. This design keeps platforming precise while allowing level design to control player visibility.

# Camera Configuration

Current configurable values include:
```
- Field of View
- Visible Screen Height
- Camera Position
- Camera Target
```

Long-term, these values will be defined by camera zones placed inside the world rather than hardcoded.

for example:

```
Workspace
└── CameraZones
    ├── Screen1
    ├── Screen2
    └── Screen3
```

Each zone will define:
```
- Camera Position
- Camera Target
- Visible Area
```
# Player

The game uses the R6 avatar type.

Reasons:
```
- Consistent proportions
- Easier animation
- Simpler collision
- Retro visual style
```
Future versions may replace the default R6 avatar with a custom StarterCharacter. (not probable though, custom avatars are cooler)

# Movement Controller

The Movement Controller is responsible for all player movement and state management. It is composed of specialized modules, each handling a single aspect of movement, resulting in a modular architecture where responsibilities remain isolated and easy to maintain.

### Responsibilities
```
- Process player input.
- Handle horizontal movement and velocity updates.
- Control character rotation and facing direction.
- Detect ground contact and airborne states.
- Manage movement state transitions.
- Execute the jump charging and jumping systems.
```
### Current Modules

| Module | Responsibility |
| ------- | -------------- |
| `input.luau` | Handles keyboard input and movement direction. |
| `movement.luau` | Controls horizontal movement and velocity updates. |
| `rotation.luau` | Manages character facing and rotation. |
| `grounding.luau` | Detects ground contact and airborne states. |
| `states.luau` | Maintains and transitions between movement states. |
| `jumping.luau` | Handles jump charging and jump execution. |

The Movement Controller serves as the core gameplay system, coordinating these modules to produce responsive and deterministic player movement while keeping each component focused on a single responsibility.

# Animation Controller

The Animation Controller is responsible for managing all player animations independently of gameplay logic. It monitors the player's current movement state and plays, blends, or stops animations accordingly. Each animation is implemented as an individual module, allowing the system to remain modular, scalable, and easy to extend as new animations are introduced.

### Responsibilities
```
- Load and cache animation assets.
- Manage animation tracks through a single `Animator`.
- Update animations based on the player's current movement state.
- Handle animation playback, looping, priorities, and transition blending.
- Provide a modular framework for future animations.
```
### Current Modules

| Module | Responsibility |
| ------- | -------------- |
| `idle.luau` | Plays the idle animation while the player is standing still. |
| `walk.luau` | Plays the walking animation during horizontal movement. |
| `charge.luau` | Plays the jump charging animation while the player is preparing a jump. |
| `jump.luau` | Plays the jump launch animation when the player leaves the ground. |

The controller acts primarily as a coordinator, delegating animation behavior to the appropriate module based on the player's current state.

---

# Visual Controller

The Visual Controller is responsible for cosmetic visual effects that enhance player feedback without affecting gameplay. It centralizes presentation logic, ensuring visual features remain separate from movement, animation, and gameplay systems.

### Responsibilities
```
- Initialize player visual effects.
- Manage character highlights and future cosmetic effects.
- Separate presentation logic from gameplay systems.
- Provide a centralized framework for future visual enhancements.
```
### Current Modules

| Module | Responsibility |
| ------- | -------------- |
| `highlight.luau` | Creates and manages the outline highlight applied to the player character. |

The Visual Controller is designed to scale alongside the project. Future features such as particles, landing effects, screen shake, environmental effects, and other visual polish can be integrated without introducing dependencies into the core gameplay controllers.

# Menu Controller

The Menu Controller is responsible for managing the game's user interface before gameplay begins. It initializes the main menu, controls UI transitions, and coordinates the transition from the title screen into gameplay while remaining independent of the core gameplay systems.

### Responsibilities
```
- Initialize the main menu interface.
- Control menu animations and fade transitions.
- Handle player interaction with the Play button.
- Manage the transition from the title screen into gameplay.
```
### Current Modules

| Module | Responsibility |
| ------- | -------------- |
| `init.luau` | Initializes the menu, manages UI animations, and handles menu interactions. |

The Menu Controller is designed to remain lightweight while providing a centralized location for future interface features such as settings, credits, save selection, accessibility options, and additional menus.


# Audio Controller

The Audio Controller is responsible for managing the game's audio systems. It centralizes music and sound playback, providing a single point of control for audio while keeping sound logic separate from gameplay and presentation systems.

### Responsibilities
```
- Initialize the game's audio system.
- Control background music playback.
- Manage sound effects.
- Provide a centralized interface for future audio features.
```
### Current Modules

| Module | Responsibility |
| ------- | -------------- |
| `init.luau` | Initializes the audio system and manages background music and sound playback. |

The Audio Controller is designed to scale alongside the project. Future additions such as ambient audio, dynamic music, volume controls, audio zones, and contextual sound effects can be integrated without introducing dependencies into the gameplay controllers.

---

# Future Systems

Planned gameplay systems include:

### Game Systems
```
- Checkpoints
- Save data
- Audio
- Particles
```

### UI
```
- Power bar
- Loading screens
```

# Future Improvements

### Camera
```
- Camera zones
- Screen transitions
- Camera boundaries
```

### Movement
```
- Custom physics
- Buffered input
- Coyote time
- Jump tuning
```

### Game
```
- Checkpoints
- Save system
- Multiple biomes
```

---
<div align="center">
Details are subject to change as development progresses!
</div>