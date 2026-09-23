String highestPalindrome(String s, int k) {
  if (k < 0 || !is_ValidNumb(s, 0)) {
    return "-1";
  }

  final digits = s.codeUnits.toList();
  final changed = List<bool>.filled(digits.length, false);

  // tahap 1
  final remaining = makePalindrome(digits, changed, 0, s.length - 1, k);

  if (remaining < 0) {
    return "-1";
  }

  // tahap 2
  maximizePalindrome(digits, changed, 0, s.length - 1, remaining);

  return String.fromCharCodes(digits);
}

int makePalindrome(
  List<int> digits,
  List<bool> changed,
  int left,
  int right,
  int k,
) {
  if (left >= right) {
    return k;
  }

  if (digits[left] == digits[right]) {
    return makePalindrome(digits, changed, left + 1, right - 1, k);
  }

  if (k == 0) {
    return -1;
  }

  if (digits[left] > digits[right]) {
    digits[right] = digits[left];
  } else {
    digits[left] = digits[right];
  }

  changed[left] = true;
  changed[right] = true;

  return makePalindrome(digits, changed, left + 1, right - 1, k - 1);
}

int maximizePalindrome(
  List<int> digits,
  List<bool> changed,
  int left,
  int right,
  int k,
) {
  if (left > right) {
    return k;
  }

  // Jika panjang string ganjil
  if (left == right) {
    if (k > 0 && digits[left] != 57) {
      digits[left] = 57;
      k--;
    }

    return k;
  }

  // Sudah 99
  if (digits[left] == 57 && digits[right] == 57) {
    return maximizePalindrome(digits, changed, left + 1, right - 1, k);
  }

  // Salah satu digit pernah diubah
  if (changed[left] || changed[right]) {
    if (k >= 1) {
      digits[left] = 57;
      digits[right] = 57;
      k--;
    }
  }
  // Keduanya belum pernah diubah
  else {
    if (k >= 2) {
      digits[left] = 57;
      digits[right] = 57;
      k -= 2;
    }
  }

  return maximizePalindrome(digits, changed, left + 1, right - 1, k);
}

bool is_ValidNumb(String s, int index) {
  if (s.isEmpty) {
    return false;
  }

  if (index == s.length) {
    return true;
  }

  final code = s.codeUnitAt(index);

  if (code < 48 || code > 57) {
    return false;
  }

  return is_ValidNumb(s, index + 1);
}

void main() {
  print("=== Highest Palindrome ===");
  print("input1: " + highestPalindrome('3943', 1));
  print("input2: " + highestPalindrome('932239', 2));
  print("input3: " + highestPalindrome('12345', 1));
}
