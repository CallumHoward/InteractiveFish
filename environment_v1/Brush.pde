class Brush {
  color currentColor;
  float size;  // diameter

  Brush(color initial, float size) {
    this.currentColor = initial;
    this.size = size;
  }

  void drawBrush() {
    stroke(#ff0000);
    fill(this.currentColor);
    ellipse(mouseX, mouseY, this.size, this.size);
  }

  ArrayList<PVector> getMask(int r0, int c0) {
    ArrayList<PVector> result = new ArrayList<PVector>();
    final int radius = ceil(this.size / 2);
    int r = radius;
    int c = 0;
    int err = 0;

    // fill in pixels in the circle using the Midpoint Circle Algorithm
    while (r >= c) {
        result.addAll(between(new PVector(r0 - r, c0 + c), new PVector(r0 + r, c0 + c)));
        result.addAll(between(new PVector(r0 - r, c0 - c), new PVector(r0 + r, c0 - c)));
        result.addAll(between(new PVector(r0 - c, c0 + r), new PVector(r0 + c, c0 + r)));
        result.addAll(between(new PVector(r0 - c, c0 - r), new PVector(r0 + c, c0 - r)));

        err += (2 * ++c) + 1;
        if (2 * (err - r) + 1 > 0) {
            err += 1 - (2 * --r);
        }
    }

    return result;
  }

  ArrayList<PVector> between(PVector a, PVector b) {
    ArrayList<PVector> result = new ArrayList<PVector>();
    for (int i = int(a.x); i < int(b.x); ++i) {
      result.add(new PVector(i, a.y));
    }

    return result;
  }
}