class Floor
{
  float _x, _y, _w, _h;
  
  Floor(float x, float y, float w, float h)
  {
    if (w <= 0 || h <= 0)
    {
      throw new IllegalArgumentException();
    }
      
    _x = x;
    _y = y;
    _w = w;
    _h = h;
  }
  
  void draw()
  {
    // 囲い
    noFill();
    colorMode(RGB, 1);
    stroke(1);
    rect(_x, _y, _w, _h);
    
    // 虹線
    final float lineRange = 3;
    final int lineNum = round(_w / lineRange);
    noFill();
    strokeWeight(2);
    colorMode(HSB, 1.0);
    for (int i = 0; i < lineNum; ++i)
    {
      float hue = float(i) / lineNum;
      stroke(hue, 1, 1);
      float x = _x + lineRange / 2 + i * lineRange + random(-lineRange / 2, lineRange / 2);
      float y1 = _y;
      float y2 = _y + _h;
      line(x, y1, x, y2);
    }
  }
}
