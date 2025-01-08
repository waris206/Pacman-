# Pac-Man Game in Assembly (8086)

## Introduction

This project implements a classic Pac-Man game using Assembly language (8086) in Visual Studio. The game consists of three levels, each with unique features, challenges, and objectives. It showcases an understanding of Assembly language programming, game logic, and graphics manipulation.

---

## Table of Contents

- [Features](#features)
- [Screens](#screens)
- [Level Details](#level-details)
  - [Level 1: The Beginning](#level-1-the-beginning)
  - [Level 2: The Challenge](#level-2-the-challenge)
  - [Level 3: The Showdown](#level-3-the-showdown)
- [Additional Information](#additional-information)
- [Getting Started](#getting-started)
- [Future Enhancements](#future-enhancements)
- [License](#license)

---

## Features

- **Three Levels:**
  - **Level 1: The Beginning**
    - Simple maze layout.
    - No power pellets, focusing on dot collection.
    - Players must collect 350 coins to proceed to the next level.
  - **Level 2: The Challenge**
    - Complex maze with additional walls and paths.
    - Introduction of power pellets and fruit bonuses.
    - Players must collect an additional 350 coins to proceed.
    - Temporary ability to eat ghosts after consuming power pellets.
  - **Level 3: The Showdown**
    - Consistent maze layout with a boss ghost encounter.
    - Cherry bonus to increase player lives.
    - Players must collect 1000 coins to complete the game.

- **Player Lives:** Start with three lives, lost upon collision with ghosts or specific challenges.

- **File Handling:** Stores and sorts players' scores along with their names in a file.

- **Custom Wall Layouts:** Unique designs for each level.

- **Sound Features:** 
  - Sounds for eating fruits, gameplay events, and game over scenarios.

- **Mandatory Instructions Screen:** Ensures players understand the game mechanics before starting.

- **Error Handling:** Robust exception handling for invalid inputs.

---

## Screens

1. **Welcome Screen:** Takes player name input.
2. **Game Menu Screen:** Options to start or quit the game.
3. **Gameplay Screen:** Main game interface.
4. **Pause Functionality:** Allows players to pause and resume the game.
5. **Instructions Screen:** Displays game rules and controls. Navigation through this screen is mandatory.
6. **High Scores Screen:** Shows names and scores of top players.

---

## Level Details

### Level 1: The Beginning

- **Maze:** Straightforward and easy to navigate.
- **Objective:** Collect 350 coins to proceed to the next level.
- **Lives:** Three lives, lost upon ghost collision.

### Level 2: The Challenge

- **Maze:** Increased complexity with strategic fruit bonuses.
- **Power Pellets:** Temporarily allow Pac-Man to eat ghosts.
- **Objective:** Collect an additional 350 coins to proceed.
- **Lives:** Remain at three.

### Level 3: The Showdown

- **Maze:** Consistent layout with a boss ghost encounter.
- **Boss Ghost:** Unique behaviors and strategies.
- **Cherry Bonus:** Grants one extra life.
- **Objective:** Collect 1000 coins to complete the game.

---

## Additional Information

- **File Handling:** Scores and player names are stored in sorted order.
- **Graphics:** Enhanced with unique wall layouts and level designs.
- **Sound Effects:** Distinct sounds for gameplay events.
- **Game Logic:** Balanced difficulty progression across levels.

---

## Getting Started

1. Clone the repository.
2. Open the project in Visual Studio.
3. Compile and run the game.
4. Navigate through the instructions screen before starting the game.
5. Enjoy the gameplay!

---



## Future Enhancements

- Multiplayer mode.
- Additional levels with new challenges.
- Customizable character designs.

---

## License

This project is licensed under the [MIT License](LICENSE).

---

Enjoy playing the Pac-Man Game in Assembly (8086)!
