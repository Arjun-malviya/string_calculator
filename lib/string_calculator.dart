class StringCalculator {
  int add(String numbers) {
    if (numbers.isEmpty) return 0;

    String nums = numbers;
    final delimiters = [',', '\n'];

    // Handle custom delimiter declaration
    if (nums.startsWith('//')) {
      final newlineIndex = nums.indexOf('\n');
      if (newlineIndex == -1) {
        throw FormatException(
            'Invalid input: missing newline after delimiter declaration');
      }

      final delimiterDef = nums.substring(2, newlineIndex);

      // Regex to support multi-character delimiters inside []
      final bracketReg = RegExp(r'\[([^\]]+)\]');
      final matches =
          bracketReg.allMatches(delimiterDef).map((m) => m.group(1)!).toList();

      if (matches.isNotEmpty) {
        // Handles multi-character delimiters like [***]
        delimiters.addAll(matches);
      } else {
        // Handles single-character delimiters like ";"
        delimiters.add(delimiterDef);
      }

      nums = nums.substring(newlineIndex + 1);
    }

    // Split input based on delimiters
    final pattern = RegExp(delimiters.map((d) => RegExp.escape(d)).join('|'));
    final parts = nums.split(pattern);

    final negatives = <int>[];
    var sum = 0;

    for (final part in parts) {
      final token = part.trim();
      if (token.isEmpty) continue;
      final n = int.parse(token);
      if (n < 0) negatives.add(n);
      sum += n;
    }

    if (negatives.isNotEmpty) {
      throw FormatException(
          'negative numbers not allowed ${negatives.join(',')}');
    }

    return sum;
  }
}
