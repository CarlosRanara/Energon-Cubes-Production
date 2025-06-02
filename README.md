# Energon Cubes Production

A resource management simulation game inspired by the Transformers universe, where players take on the role of Soundwave managing Energon cube production and sales.

## 📋 Table of Contents
- [Overview](#overview)
- [Game Mechanics](#game-mechanics)
- [Features](#features)
- [Installation](#installation)
- [How to Play](#how-to-play)
- [Market Trends](#market-trends)
- [Developer Mode](#developer-mode)
- [Technical Requirements](#technical-requirements)
- [Project Structure](#project-structure)
- [Author](#author)

## 🎮 Overview

In this game, you play as Soundwave, a Transformer who produces and sells Energon cubes to earn Energon currency. The goal is to accumulate **1,000,000 Energon** within 10 weeks while managing production costs, market fluctuations, and cube expiration.

### Game Objective
- Start with 10,000 Energon
- Reach 1,000,000 Energon within 10 weeks
- Manage production costs and market trends strategically

## ⚙️ Game Mechanics

### Production Phase (Day 1 of each week)
- **Production Cost**: Randomly generated between 80-120 Energon per cube
- **Stack Production**: Cubes are produced in stacks of 10 only
- **Cost Calculation**: Stack cost = Production cost × 10

### Sales Phase (Days 2-7 of each week)
- Sell cubes to Swindle's store at market prices
- Prices vary daily based on market trends
- Sales are conducted by stack only (no individual cubes)

### Expiration System
- All unsold cubes expire at the end of Day 7
- Expired cubes are lost and cannot be recovered

## 🌟 Features

- **Dynamic Market System**: Three different market trends affecting prices
- **Strategic Decision Making**: Balance production costs with market timing
- **Developer Mode**: Testing features for easy debugging
- **Input Validation**: Robust error handling for user inputs
- **Progress Tracking**: Real-time display of Energon balance and inventory

## 💾 Installation

### Prerequisites
- GCC compiler with C99 support
- Terminal/Command prompt access
- Make utility (recommended)
- Optional: Valgrind (for memory checking), cppcheck (for static analysis)

### Quick Start with Makefile (Recommended)
```bash
# Build and run the game
make run

# Or build first, then run
make
./energon_game
```

### Manual Compilation
```bash
gcc -Wall -std=c99 RANARA_MP.c -o energon_game
./energon_game
```

### Makefile Targets

The project includes a comprehensive Makefile with the following targets:

#### Basic Build Commands
```bash
make              # Build the game (default)
make debug        # Build with debugging symbols
make release      # Build optimized release version
make clean        # Remove build artifacts
make run          # Build and run the game
```

#### Development Tools
```bash
make memcheck         # Run with Valgrind memory checker
make static-analysis  # Run cppcheck static analysis  
make format          # Format code with clang-format
make test-compile    # Test compilation without creating executable
```

#### Utility Commands
```bash
make help        # Show all available commands
make info        # Display project information
make backup      # Create timestamped backup archive
make install     # Install to system (requires sudo)
make uninstall   # Remove from system (requires sudo)
```

#### Example Development Workflow
```bash
# Start development
make debug

# Run with memory checking
make memcheck

# Format code and run static analysis
make format
make static-analysis

# Create final release build
make release

# Clean up
make clean
```

## 🎯 How to Play

1. **Start the Game**: Choose normal mode or developer mode
2. **Weekly Production**: 
   - Each week begins with production on Day 1
   - Decide how many stacks to produce based on cost
   - Consider your Energon budget carefully
3. **Daily Sales**:
   - Days 2-7 offer selling opportunities
   - Monitor Swindle's daily prices
   - Decide when to sell based on market trends
4. **Week End**: All unsold cubes expire, new week begins

### Game Controls
- Enter numbers for stack quantities
- Use 'y'/'Y' or 'n'/'N' for confirmations
- Follow on-screen prompts for all actions

## 📈 Market Trends

The game features three market trends that affect cube prices:

### 🔴 Scrap Trend
- **Price Range**: 20 to (generation cost - 10) Energon per cube
- **Strategy**: Generally unprofitable, avoid selling if possible

### 🟡 Nominal Trend  
- **Price Range**: 80 to 105% of generation cost per cube
- **Strategy**: Moderate profits, safe selling option

### 🟢 Primus Trend
- **Price Range**: Generation cost to 400% of generation cost per cube
- **Strategy**: Highly profitable, sell aggressively

> **Note**: Trends are not announced! You must deduce the current trend by observing daily prices.

## 🛠️ Developer Mode

Access special testing features by entering 'y' when prompted:

- **Custom Starting Energon**: Set any starting balance
- **Week Selection**: Start from any week (1-10)
- **Quick Testing**: Test specific scenarios efficiently

## 🔧 Technical Requirements

### Programming Concepts Used
- **User-defined Functions**: Modular code organization
- **Pointers**: Efficient parameter passing
- **Loops**: Game progression and input validation
- **Conditional Statements**: Game logic and decision trees
- **Random Number Generation**: Market prices and production costs

### Code Standards
- Follows Linux Kernel coding standards
- Comprehensive internal documentation
- No global variables used
- Proper error handling and input validation

## 📁 Project Structure

```
RANARA_MP.c
├── Main Function
│   ├── Game initialization
│   ├── Weekly game loop
│   └── Win/lose condition checking
├── Core Functions
│   ├── randomPrice() - Market price calculation
│   ├── generateCubes() - Production management
│   ├── sellCubes() - Sales transactions
│   └── expireCubes() - End-of-week cleanup
└── Utility Functions
    └── displayStatus() - Game state display
```

### Key Functions

- **`randomPrice()`**: Calculates cube prices based on generation cost and market trend
- **`generateCubes()`**: Handles cube production with cost validation
- **`sellCubes()`**: Manages sales transactions and market interactions
- **`expireCubes()`**: Processes end-of-week cube expiration
- **`displayStatus()`**: Shows current game state

## 👨‍💻 Author

**Ramil Carlos Ranara**  
Student ID: 12415758  
Section: S24A  
Course: CCPROG1 - De La Salle University  

### Project Details
- **Version**: 9.0
- **Last Modified**: November 24, 2024
- **Language**: C (C99 Standard)

### Acknowledgements
- Random number generation reference: [TutorialsPoint](https://www.tutorialspoint.com/rand-and-srand-in-c)

---

*This project is certified as original work, created independently as part of the CCPROG1 Machine Project requirements.*