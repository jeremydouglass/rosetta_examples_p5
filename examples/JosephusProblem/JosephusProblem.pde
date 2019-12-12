/**
 * JosephusProblem
 * 2019-08 Jeremy Douglass Processing 3.4
 * https://rosettacode.org/wiki/Josephus_problem#Processing
 *
 * Josephus problem is a math puzzle with a grim description:
 * n prisoners are standing on a circle, sequentially numbered from 0 to n-1.
 * An executioner walks along the circle, starting from prisoner 0, removing 
 * every k-th prisoner and killing him.
 * 
 * As the process goes on, the circle becomes smaller and smaller, until only
 * one prisoner remains, who is then freed. >
 * 
 * For example, if there are 5 prisoners and k=2, the order the prisoners are
 * killed in (let's call it the "killing sequence") will be 1, 3, 0, and 4, and 
 * the survivor will be #2.
 * 
 * Task:
 * Given any n, k>0, find out which prisoner will be the final survivor.
 * 
 * In one such incident, there were 41 prisoners and every 3rd prisoner was 
 * being killed (k=3).
 * 
 * Among them was a clever chap name Josephus who worked out the problem, stood 
 * at the surviving position, and lived on to tell the tale.
 * 
 * Which number was he?
 * 
 * Translation of Java example.
 */

void setup() {
  println("Survivor: " + execute(41, 3));
  println("Survivors: " + executeAllButM(41, 3, 3));
}

int execute(int n, int k) {
  int killIdx = 0;
  IntList prisoners = new IntList(n);
  for (int i = 0; i < n; i++) {
    prisoners.append(i);
  }
  println("Prisoners executed in order:");
  while (prisoners.size() > 1) {
    killIdx = (killIdx + k - 1) % prisoners.size();
    print(prisoners.get(killIdx) + " ");
    prisoners.remove(killIdx);
  }
  println();
  return prisoners.get(0);
}

IntList executeAllButM(int n, int k, int m) {
  int killIdx = 0;
  IntList prisoners = new IntList(n);
  for (int i = 0; i < n; i++) {
    prisoners.append(i);
  }
  println("Prisoners executed in order:");
  while (prisoners.size() > m) {
    killIdx = (killIdx + k - 1) % prisoners.size();
    print(prisoners.get(killIdx) + " ");
    prisoners.remove(killIdx);
  }
  println();
  return prisoners;
}
