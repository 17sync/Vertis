<!-- Vertis Text -->
<div align="center">
    <img src="images/text.png" alt="Vertis"/>
</div>

<!-- Tech Stack -->
<div align="center">
<img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/git/git-original.svg" height="40" alt="git logo"/>
    <img width="12"/>
<img src="https://skillicons.dev/icons?i=github" height="40" alt="git logo"/>
    <img width="12"/>
<img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/lua/lua-original.svg" height="40" alt="lua logo"/>
    <img width="12"/>
<img src="https://github.com/0rgxn/RBLXStudioIcons/blob/main/src/Roblox%20Studio%20Alt/Roblox%20Studio%20Alt%20Dark%204.png?raw=true" height="40" alt="Roblox Studio icon"/>
    <img width="12"/>
<img src="https://github.com/rojo-rbx/rojo/blob/master/assets/brand_images/icon-32.png?raw=true" height="40" alt="Rojo icon"/>
</div>

<!-- Documentation Links -->
<div align="center">
<a href="docs/architecture.md">Architecture</a> |
<a href="docs/design.md">Design</a> |
<a href="docs/roadmap.md">Roadmap</a> 
</div>

---

<!-- Description -->
<div align="center">
Vertis is a precision platformer inspired by Jump King. Built in Roblox Studio, this project aims to maintain a modular architecture with extensive documentation and a Rojo-based workflow to allow the codebase to  be version controlled via Git and GitHub.
</div>

---

<!-- Gameplay -->
<div align="center">
<img src="https://media4.giphy.com/media/v1.Y2lkPTc5MGI3NjExNWVxbDJ6dnV4cmp0cnRobmt6eDhia3R6OXp1MWY3eXplaWtmOWkxYyZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/mDZAeAmXOAz5TumC8f/giphy.gif"/>
</div>

---

# Contents
- [Features](#features)
- [Player](#player)
- [Architectural Principles](#architectural-principles)
- [Project Structure](#project-structure)
- [Documentation](#documentation)
- [Roadmap](#roadmap)
- [Development Workflow](#development-workflow)

---

# Features

- **Precision Platforming:** Every jump is momentum-driven, rewarding careful timing and execution over fast reactions.
- **Charge-Based Jumping:** Jump height and distance are determined by how long the jump is charged, creating a high skill ceiling.
- **Fixed-Screen Camera:** Inspired by *Jump King*, each screen acts as a self-contained platforming challenge without distracting camera movement.
- **2D Gameplay Plane:** Movement is restricted to a single plane, allowing precise and predictable platforming.
- **Vertical Level Design:** Progression revolves around climbing through interconnected stages where every mistake carries weight.
- **Skill-Based Gameplay:** There are no shortcuts or assists; progress comes from mastering the movement mechanics.

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

# Architectural Principles

The core principles of the project:
```
- Single Responsibility Principle
- Modular systems
- Client/Server separation
- Data-driven configuration
- Minimal code duplication
```
Each controller or service should have one clearly defined responsibility (loose coupling).

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
This tree is effected by architectural decisions and is ofcourse subject to change as I go deeper into development and signifies the current state of the progression.

# Documentation
This project is not being built upon instinct but being engineered with extensive documentation in the form of markdown files:
```
docs
├── architecture.md
├── design.md
└── roadmap.md
```
Though somewhat exhausting or outright boring at times, by maintaining these I am giving myself a clear vision of what I am trying to accomplish with this game each session.
Take a look at them [here!](./docs)

# Roadmap

## v0.1 — Core Prototype
- [x] Core movement
- [x] Jump charging
- [x] Camera

---

## v0.2 - Improved Prototype
- [x] Animations for basic movement
- [ ] Minimalistic power bar for jump charging
- [x] Simple menu UI
- [x] Animation for jumping
- [x] Background Ambience

---

## v0.3 — Vertical Slice
- [ ] Basic level layout
- [ ] First 5 Levels
- [ ] Animation for falling
- [ ] Recovery animation
- [ ] Loading Screens (optional)

---

## v0.4 — Game Systems
- [ ] Audio and Sound Effects
- [ ] Progress Saving
- [ ] Checkpoints
- [ ] Particle effects (optional)

---

## v0.5 — World Building
- [ ] Finish atleast 20 levels
- [ ] Design biomes for each level or set of levels

---

## v0.6 - Release Candidate
- [ ] Optimization
- [ ] Playtesting
- [ ] Bug fixing
- [ ] Polish

---

# Development Workflow
My ideal workflow concept with this project:
```
Design Review
↓
Architecture Review
↓
Implementation
↓
Testing
↓
Update Documentation
↓
Git commit
↓
Push to GitHub
```
This workflow encourages incremental development while keeping the documentation synchronized with the actual implementation.

# License

This project is licensed under the MIT License. Check the [LICENSE](./LICENSE) file for more information.