class StringCalculator {
  int add(String numbers) {
    if (numbers.isEmpty) return 0;

    String nums = numbers;
    final delimiters = [',', '\n'];

    if (nums.startsWith('//')) {
      final newlineIndex = nums.indexOf('\n');
      final delimiter = nums.substring(2, newlineIndex);
      delimiters.add(delimiter);
      nums = nums.substring(newlineIndex + 1);
    }

    final parts = nums.split(RegExp(delimiters.map(RegExp.escape).join('|')));
    return parts.map(int.parse).reduce((a, b) => a + b);
  }
}
