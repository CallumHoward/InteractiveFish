import java.util.Map;

enum EType {
  WATER,
  SAND,
  GRASS,
  ROCK,
  FOOD
}

static class Card {
  static final int size = 8;
  static final int[] row = {-1, -1, +0, +1, +1, +1, +0, -1};
  static final int[] col = {+0, +1, +1, +1, +0, -1, -1, -1};
}

class Environment {
  EType[][] map;
  final int nRows, nCols, scale;
  final HashMap<EType, Integer> colors;

  Environment(int nRows, int nCols, int scale) {
    this.map = new EType[nRows][nCols];
    this.nRows = nRows;
    this.nCols = nCols;
    this.scale = scale;
    this.colors = new HashMap<EType, Integer>();
    this.colors.put(EType.WATER, #e0f0ff);
    this.colors.put(EType.SAND,  #f4f3a6);
    this.colors.put(EType.GRASS, #cef4a6);
    this.colors.put(EType.ROCK,  #8c8b6d);
    this.colors.put(EType.FOOD,  #efac5b);

    for (int r = 0; r < nRows; ++r) {
      for (int c = 0; c < nCols; ++c) { map[r][c] = EType.WATER; }
    }
  }

  void drawEnvironment() {
    PGraphics pg = createGraphics(this.nRows * this.scale, this.nCols * this.scale);
    pg.beginDraw();
    //pg.stroke(#ffffff);  // for grid
    pg.noStroke();  // no grid
    pg.fill(#e0f0ff);

    for (int r = 0; r < env.nRows; ++r) {
      for (int c = 0; c < env.nCols; ++c) {
        pg.fill(this.getColor(r, c));
        pg.rect(r * scale, c * scale, scale, scale);
      }
    }
    pg.endDraw();
    image(pg, 0, 0);
  }

  color getColor(int r, int c) {
    // find color at (r, c)
    color result = this.colors.get(this.map[r][c]);
    int tR, tC;  // target row and column

    // find neighbours and average
    for (int i = 0; i < Card.size; ++i) {
      // set target row and column
      tR = constrain(r + Card.row[i], 0, this.nRows - 1);
      tC = constrain(c + Card.col[i], 0, this.nCols - 1);
      result = lerpColor(result, color(this.colors.get(this.map[tR][tC])), 0.125);
    }

    return result;
  }

  Boolean getInBounds(int r, int c) {
    return r > 0 && r < this.nRows && c > 0 && c < this.nCols; 
  }

  Boolean getInBounds(float r, float c) {
    return getInBounds(int(r), int(c));
  }

  EType getEType(int r, int c) {
    return this.map[constrain(r, 0, this.nRows - 1)][constrain(c, 0, this.nCols - 1)];
  }

  EType getEType(float r, float c) {
    return getEType(int(r), int(c));
  }

  void changeCell(float r, float c, EType t) { changeCell(int(r), int(c), t); }

  void changeCell(int r, int c, EType t) {
    // ensure array is not overflowed
    r = constrain(r, 0, this.nRows - 1);
    c = constrain(c, 0, this.nCols - 1);

    /*
    if (t == EType.GRASS && this.map[r][c] == EType.WATER) {
      t = EType.SAND;
    }
    */
    
    // assign new type
    this.map[r][c] = t;
  }
}
