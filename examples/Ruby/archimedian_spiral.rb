# archimedian_spiral
# https://discourse.processing.org/t/rosetta-code-examples-for-jrubyart/17982/5

INCR = 0.1
attr_reader :x, :theta

def setup
  sketch_title 'Archimedian Spiral'
  @theta = 0
  @x = 0
  background(255)
  translate(width / 2.0, height / 2.0)
  begin_shape
  while x < width / 2
    @x = theta * cos(theta / PI)
    curve_vertex(x, theta * sin(theta / PI))
    @theta += INCR
  end
  end_shape
end

def settings
  size(300, 300)
end
