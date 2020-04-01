# https://discourse.processing.org/t/rosetta-examples-development/18945/

attr_reader :len, :gen

def setup
  sketch_title 'Heighway Dragon'
  background(0, 0, 255)
  translate(170, 170)
  stroke(255)
  @len = 3
  @gen = 14
  turn_left(len, gen)
end

def turn_right(len, gen)
  return draw_line(len) if gen.zero?

  turn_left(len, gen - 1)
  rotate(90.radians)
  turn_right(len, gen - 1)
end

def draw_line(len)
  line(0, 0, 0, -len)
  translate(0, -len)
end

def turn_left(len, gen)
  return draw_line(len) if gen.zero?

  turn_left(len, gen - 1)
  rotate(-90.radians)
  turn_right(len, gen - 1)
end

def settings
  size(700, 600)
end
