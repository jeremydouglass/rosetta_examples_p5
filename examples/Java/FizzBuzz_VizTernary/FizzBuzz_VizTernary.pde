/**
 * FizzBuzz: Console and Visualization, Ternary
 * https://rosettacode.org/wiki/FizzBuzz#Processing
 * Processing 3.4
 * 2019-12 Jeremy Douglass
 * 2014-01-09 Phospheros "Visualization & Console, Ternary"
 * 
 * Task:
 * 
 * Write a program that prints the integers from 1 to 100 (inclusive).
 * But:
 * -  for multiples of three, print   Fizz (instead of the number)
 * -  for multiples of five,  print   Buzz (instead of the number)
 * -  for multiples of both three and five, print FizzBuzz (instead of the number)
 * The FizzBuzz problem was presented as the lowest level of comprehension required'
 * to illustrate adequacy.
 */

// Reserved variable "width" in Processing is 100 pixels by default,
// suitable for this FizzBuzz exercise.
// Accordingly, range is pixel index from 0 to 99.

for (int i = 0; i < width; i++) {
  stroke((i % 5 == 0 && i % 3 == 0) ? #FFFF00 : (i % 5 == 0) ? #00FF00 : (i % 3 == 0) ? #FF0000 : #0000FF);
  line(i, 0, i, height);
  println((i % 5 == 0 && i % 3 == 0) ? "FizzBuzz!" : (i % 5 == 0) ? "Buzz" : (i % 3 == 0) ? "Fizz" : i);
}
