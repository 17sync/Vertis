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
│   ├── Client.client.luau
│   └── controllers
│       └── CameraController.luau
│
├── startercharacterscripts
├── startergui
├── replicatedfirst
├── serverstorage
└── soundservice
```
This folder tree ofcourse is subject to change as I go deeper into development and signifies the current state of the progression.

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

Client-side gameplay systems are managed through controllers. Client.client.luau acts as the bootstrapper. Its responsibilities are:
```
- Loading controllers
- Initializing gameplay systems
- Defining initialization order
```
Gameplay logic should not exist inside the bootstrapper itself.

# Controller Pattern

Gameplay systems are implemented as ModuleScripts rather than multiple LocalScripts.

Example:
```
CameraController
├── Init()
├── SetCamera()
└── ...
```
This leads to:
```
- Easier maintenance
- Predictable initialization
- Reduced duplicated code
- Clear ownership of system state
```

# Camera System

The camera is entirely client-side. Roblox's default camera controller is disabled by setting the camera type to `Scriptable`. The camera is currently static.

Responsibilities:
```
- Take ownership of the camera
- Position the camera
- Orient the camera
- Configure camera properties
```

# Camera Philosophy

Vertis is inspired by Jump King. Rather than continuously following the player, the game is divided into fixed camera screens. Each screen represents a self-contained gameplay challenge. This design keeps platforming precise while allowing level design to control player visibility.

---

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

---

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

# Future Systems

Planned gameplay systems include:

### Movement
```
- Jump charging
- Landing
- Recovery
- Air movement
```

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
- Main menu
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
<p style="text-align:center">Details are subject to change as development progresses!</p>