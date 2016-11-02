import java.util.Map;

enum EType {
  WATER,
  SAND,
  GRASS,
  ROCK
}

class Environment {
  EType[][] map;
  int nRows, nCols;
  HashMap<EType, Integer> colors;

  Environment(int nRows, int nCols) {
    this.map = new EType[nRows][nCols];
    this.nRows = nRows;
    this.nCols = nCols;
    this.colors = new HashMap<EType, Integer>();
    this.colors.put(EType.WATER, color(#e0f0ff));
    this.colors.put(EType.SAND, color(#f4f3a6));

    for (int r = 0; r < nRows; ++r) {
      for (int c = 0; c < nCols; ++c) { map[r][c] = EType.WATER; }
    }
  }

  void drawEnvironment() {
    stroke(#ffffff);
    fill(#E0F0FF);

    for (int r = 0; r < env.nRows; ++r) {
      for (int c = 0; c < env.nCols; ++c) {
        switch(env.map[r][c]) {
          case WATER: fill(#e0f0ff); break;
          case SAND:  fill(#f4f3a6); break;
          case GRASS: fill(#cef4a6); break;
          case ROCK:  fill(#a39e97); break;        
        }
        rect(r * scale, c * scale, scale, scale);
      }
    }
  }
  
  void changeCell(int r, int c, EType t) {
    // ensure array is not overflowed
    r = min(r, this.nRows - 1);
    c = min(c, this.nCols - 1);
    
    // assign new type
    this.map[r][c] = t;
  }
}
  