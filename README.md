# Black Hole Simulation

A real-time gravitational lensing and black hole visualization project featuring both 2D and 3D simulations.

## 🌌 Features

This project implements:

1. **Ray-tracing** - Gravitational lensing simulation showing how light bends around massive objects
2. **Accretion disk** - Visual simulation of matter spiraling into black holes 
3. **Spacetime curvature** - 3D visualization of the "trapdoor in spacetime" using a deformed grid
4. **Real-time rendering** - Interactive camera controls and live physics simulation

## 📺 Demo Video

Watch the detailed explanation: https://www.youtube.com/watch?v=8-B6ryuBkCM

## 🚀 Quick Start

### Prerequisites

#### macOS (recommended)
Install dependencies using Homebrew:
```bash
brew install glfw glew glm pkg-config
```

#### Linux (Ubuntu/Debian)
```bash
sudo apt-get install libglfw3-dev libglew-dev libglm-dev pkg-config
```

#### Windows
- Install MSYS2 and use: `pacman -S mingw-w64-x86_64-glfw mingw-w64-x86_64-glew mingw-w64-x86_64-glm`
- Or manually install GLFW, GLEW, and GLM libraries

### Building and Running

#### Option 1: Using Makefile (Recommended)
```bash
# Build both simulations
make all

# Or build individually
make black_hole_2d    # 2D gravitational lensing
make black_hole_3d    # 3D black hole with spacetime grid

# Run the simulations
./black_hole_2d       # 2D simulation
./black_hole_3d       # 3D simulation
```

#### Option 2: Manual compilation
```bash
# 2D simulation
g++ -std=c++17 -O2 2D_lensing.cpp -o black_hole_2d $(pkg-config --cflags --libs glfw3 glew) -framework OpenGL

# 3D simulation  
g++ -std=c++17 -O2 black_hole.cpp -o black_hole_3d $(pkg-config --cflags --libs glfw3 glew) -framework OpenGL
```

## 🎮 Controls

### 2D Simulation (`black_hole_2d`)
- **Mouse wheel**: Zoom in/out
- **Middle mouse + drag**: Pan around
- **Left click**: Place light rays to see gravitational lensing

### 3D Simulation (`black_hole_3d`)
- **Left mouse + drag**: Orbit camera around black hole
- **Right mouse + drag**: Pan camera
- **Mouse wheel**: Zoom in/out  
- **G key**: Toggle gravity simulation on/off
- **ESC**: Exit

## 🔧 Technical Details

### 2D Simulation
- Simple gravitational lensing using ray tracing
- Demonstrates light bending around massive objects
- Real-time interactive visualization

### 3D Simulation  
- Uses OpenGL compute shaders (`geodesic.comp`) for GPU-accelerated calculations
- Renders both the black hole and a deformed spacetime grid
- Simulates multiple objects with gravitational interactions
- Features Sagittarius A* (our galaxy's supermassive black hole) parameters

### Dependencies
- **GLFW**: Window management and input handling
- **GLEW**: OpenGL extension loading
- **GLM**: Mathematics library for graphics
- **OpenGL 4.3+**: For compute shader support (3D simulation)

## 🛠 Troubleshooting

### Common Issues

1. **"Failed to initialize GLFW"**
   - Make sure GLFW is properly installed
   - On macOS: `brew reinstall glfw`

2. **Compute shader errors (3D simulation)**
   - Ensure your graphics card supports OpenGL 4.3+
   - Update graphics drivers

3. **Compilation errors**
   - Make sure all dependencies are installed
   - Try using the Makefile instead of manual compilation

### System Requirements
- OpenGL 3.3+ (minimum)
- OpenGL 4.3+ (for 3D simulation with compute shaders)
- Modern graphics card (integrated graphics may work for 2D)

## 📁 File Structure

- `2D_lensing.cpp` - 2D gravitational lensing simulation
- `black_hole.cpp` - 3D black hole simulation with spacetime grid
- `geodesic.comp` - OpenGL compute shader for ray tracing calculations
- `Makefile` - Build system for easy compilation

## 🤝 Contributing

Feel free to submit issues and enhancement requests! This project demonstrates:
- Real-time physics simulation
- GPU compute shaders
- Advanced graphics programming
- General relativity visualization

## 📄 License

This project is open source. See the video link above for detailed explanation of the code and physics implementation.
