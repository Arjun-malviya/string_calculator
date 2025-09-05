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

    final negatives = <int>[];
    var sum = 0;

    for (final p in parts) {
      final n = int.parse(p);
      if (n < 0) negatives.add(n);
      sum += n;
    }

    if (negatives.isNotEmpty) {
      throw FormatException('negative numbers not allowed ${negatives.join(',')}');
    }

    return sum;
  }
}
