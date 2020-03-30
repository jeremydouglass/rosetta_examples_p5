"""
JuliaSet
https://rosettacode.org/wiki/Julia_set#Processing
Processing 3.4
2020-03 Alexandre

Task:

Generate and draw a Julia set.
https://en.wikipedia.org/wiki/Julia_set
"""

from __future__ import division
  
def setup():
    size(640, 480)
 
cX = -0.7
cY = 0.27015
maxIter = 300
       
def draw():    
    for x in range(width):
        for y in range(height):
            zx = 1.5 * (x - width / 2) / (0.5 * width)
            zy = (y - height / 2) / (0.5 * height)
            i = maxIter
            while zx * zx + zy * zy < 4 and i > 0:
                tmp = zx * zx - zy * zy + cX
                zy = 2.0 * zx * zy + cY
                zx = tmp
                i -= 1
            colorMode(HSB)
            c = color(i / maxIter * 255, 255, 255 if i > 1 else 0)
            set(x, y, c)
    noLoop()
