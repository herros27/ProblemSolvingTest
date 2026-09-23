List<int> denseRanking(List<int> scores, List<int> playerScores) {
  final uniqueScores = scores.toSet().toList();

  return playerScores.map((scores) {
    int left = 0;
    int right = uniqueScores.length;

    while (left < right) {
      int mid = (left + right) ~/ 2;
      if (uniqueScores[mid] <= scores) {
        right = mid;
      } else {
        left = mid + 1;
      }
    }

    return left + 1;
  }).toList();
}

void main() {
  print("=== Dense Ranking ===");
  // input 1
  final scores1 = [100, 90, 90, 80, 75, 60];
  final playerScores1 = [50, 65, 77, 90, 102];

  final result1 = denseRanking(scores1, playerScores1);
  print("Input 1: " + result1.join(' '));

  // input 2
  final scores2 = [200, 150, 150, 120, 120, 120, 80, 50];
  final playerScores2 = [40, 80, 100, 120, 150, 250];

  final result2 = denseRanking(scores2, playerScores2);
  print("Input 2: " + result2.join(' '));
  
  // input 3
  final scores3 = [500, 400, 400, 300, 200, 200, 100];
  final playerScores3 = [100, 200, 250, 400, 450, 500];

  final result3 = denseRanking(scores3, playerScores3);
  print("Input 3: " + result3.join(' '));
}
