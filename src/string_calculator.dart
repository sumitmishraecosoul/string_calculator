class StringCalculator {
  int add(String numbers) {
    if (numbers.isEmpty) {
      return 0;
    }
    
    var parts = numbers.split(RegExp(r'[,\n]'));
    var sum = 0;
    for (var part in parts) {
      sum += int.parse(part);
    }
    return sum;
  }
}