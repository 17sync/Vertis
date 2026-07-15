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

<!-- Description -->
<div align="center">
<p>
A precision platformer inspired by Jump King. <br>
Built in Roblox Studio, this project aims to maintain a modular architecture with extensive documentation and a Rojo-based workflow to allow the codebase to  be version controlled via Git and GitHub.
</p>
</div>

---

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
│       ├── cameracontroller.luau
│       └── movementcontroller
│           ├── init.luau
│           ├── input.luau
│           ├── movement.luau
│           ├── rotation.luau
│           ├── grounding.luau
│           ├── states.luau
│           └── jumping.luau
│
├── startercharacterscripts
├── startergui
├── replicatedfirst
├── serverstorage
└── soundservice
```
This tree is effected by architectural decisions and is ofcourse subject to change as I go deeper into development and signifies the current state of the progression.

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