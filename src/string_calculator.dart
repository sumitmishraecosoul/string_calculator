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
    var sum = 0;
    for (var part in parts) {
      sum += int.parse(part);
    }
    return sum;
  }
}