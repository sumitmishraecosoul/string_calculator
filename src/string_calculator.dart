class StringCalculator {
  int add(String numbers) {
    if (numbers.isEmpty) {
      return 0;
    }
    
    var delimiter = RegExp(r'[,\n]');
    var input = numbers;
    
    if (numbers.startsWith('//')) {
      var lines = numbers.split('\n');
      delimiter = RegExp(RegExp.escape(lines[0].substring(2)));
      input = lines[1];
    }
    
    var parts = input.split(delimiter);
    var numbers_list = parts.map(int.parse).toList();
    
    var negatives = numbers_list.where((n) => n < 0).toList();
    if (negatives.isNotEmpty) {
      throw ArgumentError('negative numbers not allowed ${negatives.join(',')}');
    }
    
    return numbers_list.reduce((a, b) => a + b);
  }
}