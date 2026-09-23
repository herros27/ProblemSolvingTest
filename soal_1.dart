List<int> generateSloanesOEIS(int input) {
  return List.generate(input, (n) => (n * (n + 1)) ~/ 2 + 1);
}

void main() {
  final result1 = generateSloanesOEIS(7);
  final result2 = generateSloanesOEIS(8);
  final result3 = generateSloanesOEIS(6);

  print("=== A000124 of Sloane’s OEIS ===");
  print("Input 1: " + result1.join('-'));
  print("Input 2: " + result2.join('-'));
  print("Input 3: " + result3.join('-'));
}
