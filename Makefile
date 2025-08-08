# Black Hole Simulation Makefile for macOS/Linux
# Dependencies: glfw, glew, glm (install via: brew install glfw glew glm pkg-config)

CXX = g++
CXXFLAGS = -std=c++17 -Wall -Wextra -O2

# Use pkg-config to get proper flags for libraries
GLFW_FLAGS = $(shell pkg-config --cflags --libs glfw3)
GLEW_FLAGS = $(shell pkg-config --cflags --libs glew)

# macOS specific OpenGL framework
ifeq ($(shell uname), Darwin)
    OPENGL_FLAGS = -framework OpenGL
else
    OPENGL_FLAGS = -lGL
endif

# GLM is header-only, but we include the path just in case
GLM_FLAGS = -I/opt/homebrew/include

# Combined flags
LIBS = $(GLFW_FLAGS) $(GLEW_FLAGS) $(OPENGL_FLAGS)
INCLUDES = $(GLM_FLAGS)

# Targets
all: black_hole_2d black_hole_3d

black_hole_2d: 2D_lensing.cpp
	$(CXX) $(CXXFLAGS) $(INCLUDES) $< -o $@ $(LIBS)

black_hole_3d: black_hole.cpp
	$(CXX) $(CXXFLAGS) $(INCLUDES) $< -o $@ $(LIBS)

clean:
	rm -f black_hole_2d black_hole_3d

install_deps:
	@echo "Installing dependencies via Homebrew..."
	brew install glfw glew glm pkg-config

help:
	@echo "Black Hole Simulation Build System"
	@echo ""
	@echo "Targets:"
	@echo "  all          - Build both 2D and 3D simulations"
	@echo "  black_hole_2d - Build 2D gravitational lensing simulation"
	@echo "  black_hole_3d - Build 3D black hole simulation with GPU compute"
	@echo "  clean        - Remove built executables"
	@echo "  install_deps - Install dependencies via Homebrew"
	@echo "  help         - Show this help message"
	@echo ""
	@echo "Usage:"
	@echo "  make black_hole_2d && ./black_hole_2d    # Run 2D simulation"
	@echo "  make black_hole_3d && ./black_hole_3d    # Run 3D simulation"

.PHONY: all clean install_deps help