# Makefile for Energon Cubes Production Game
# Author: Ramil Carlos Ranara
# Course: CCPROG1 - De La Salle University

# Compiler and flags
CC = gcc
CFLAGS = -Wall -Wextra -std=c99 -pedantic
DEBUG_FLAGS = -g -DDEBUG
RELEASE_FLAGS = -O2 -DNDEBUG

# Project variables
TARGET = energon_game
SOURCE = RANARA_MP.c
OBJECT = $(SOURCE:.c=.o)

# Default target
all: $(TARGET)

# Build the main executable
$(TARGET): $(OBJECT)
	@echo "Linking $(TARGET)..."
	$(CC) $(CFLAGS) $(RELEASE_FLAGS) -o $@ $^
	@echo "Build successful! Run with: ./$(TARGET)"

# Compile source files to object files
%.o: %.c
	@echo "Compiling $<..."
	$(CC) $(CFLAGS) $(RELEASE_FLAGS) -c $< -o $@

# Debug build with debugging symbols
debug: CFLAGS += $(DEBUG_FLAGS)
debug: $(TARGET)
	@echo "Debug build complete with debugging symbols"

# Release build with optimizations
release: CFLAGS += $(RELEASE_FLAGS)
release: clean $(TARGET)
	@echo "Release build complete with optimizations"

# Clean build artifacts
clean:
	@echo "Cleaning build artifacts..."
	rm -f $(OBJECT) $(TARGET)
	@echo "Clean complete"

# Remove all generated files
distclean: clean
	@echo "Removing all generated files..."
	rm -f *~ *.bak core
	@echo "Distribution clean complete"

# Install the game (optional)
install: $(TARGET)
	@echo "Installing $(TARGET) to /usr/local/bin..."
	sudo cp $(TARGET) /usr/local/bin/
	@echo "Installation complete"

# Uninstall the game
uninstall:
	@echo "Removing $(TARGET) from /usr/local/bin..."
	sudo rm -f /usr/local/bin/$(TARGET)
	@echo "Uninstallation complete"

# Run the game
run: $(TARGET)
	@echo "Starting $(TARGET)..."
	./$(TARGET)

# Check for memory leaks (requires valgrind)
memcheck: debug
	@echo "Running memory check with valgrind..."
	valgrind --leak-check=full --show-leak-kinds=all --track-origins=yes ./$(TARGET)

# Static analysis with cppcheck (if available)
static-analysis:
	@echo "Running static analysis..."
	@if command -v cppcheck >/dev/null 2>&1; then \
		cppcheck --enable=all --std=c99 $(SOURCE); \
	else \
		echo "cppcheck not found. Install it for static analysis."; \
	fi

# Format code (requires clang-format)
format:
	@echo "Formatting source code..."
	@if command -v clang-format >/dev/null 2>&1; then \
		clang-format -i $(SOURCE); \
		echo "Code formatting complete"; \
	else \
		echo "clang-format not found. Install it for code formatting."; \
	fi

# Show help
help:
	@echo "Available targets:"
	@echo "  all         - Build the game (default)"
	@echo "  debug       - Build with debugging symbols"
	@echo "  release     - Build optimized release version"
	@echo "  clean       - Remove object files and executable"
	@echo "  distclean   - Remove all generated files"
	@echo "  install     - Install game to system (requires sudo)"
	@echo "  uninstall   - Remove game from system (requires sudo)"
	@echo "  run         - Build and run the game"
	@echo "  memcheck    - Run with valgrind memory checker"
	@echo "  static-analysis - Run cppcheck static analysis"
	@echo "  format      - Format code with clang-format"
	@echo "  help        - Show this help message"
	@echo ""
	@echo "Example usage:"
	@echo "  make              # Build the game"
	@echo "  make debug        # Build debug version"
	@echo "  make run          # Build and run"
	@echo "  make clean        # Clean build files"

# Show project information
info:
	@echo "Project Information:"
	@echo "  Name: Energon Cubes Production Game"
	@echo "  Author: Ramil Carlos Ranara"
	@echo "  Source: $(SOURCE)"
	@echo "  Target: $(TARGET)"
	@echo "  Compiler: $(CC)"
	@echo "  Flags: $(CFLAGS)"

# Backup source code
backup:
	@echo "Creating backup..."
	@DATE=$$(date +%Y%m%d_%H%M%S); \
	tar -czf energon_backup_$$DATE.tar.gz $(SOURCE) Makefile README.md; \
	echo "Backup created: energon_backup_$$DATE.tar.gz"

# Check if the program compiles correctly (for testing)
test-compile: clean
	@echo "Testing compilation..."
	@if $(CC) $(CFLAGS) -o $(TARGET) $(SOURCE); then \
		echo "✓ Compilation test passed"; \
		rm -f $(TARGET); \
	else \
		echo "✗ Compilation test failed"; \
		exit 1; \
	fi

# Declare phony targets (targets that don't create files)
.PHONY: all debug release clean distclean install uninstall run memcheck static-analysis format help info backup test-compile