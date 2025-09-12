class StringCalculator {
  int add(String numbers) {
    if (numbers.isEmpty) return 0;
    
    var delimiter = _getDelimiter(numbers);
    var input = _getInput(numbers);
    
    var parts = input.split(delimiter);
    var numbersList = parts.map(int.parse).toList();
    
    _validateNoNegatives(numbersList);
    if(delimiter.toString().contains('*')){
      return numbersList.reduce((a, b) => a * b);
    }
    return numbersList.reduce((a, b) => a + b);
  }
  
  RegExp _getDelimiter(String numbers) {
    if (numbers.startsWith('//')) {
      var lines = numbers.split('\n');
      return RegExp(RegExp.escape(lines[0].substring(2)));
    }
    return RegExp(r'[,\n]');
  }
  
  String _getInput(String numbers) {
    if (numbers.startsWith('//')) {
      return numbers.split('\n')[1];
    }
    return numbers;
  }
  
  void _validateNoNegatives(List<int> numbers) {
    var negatives = numbers.where((n) => n < 0).toList();
    if (negatives.isNotEmpty) {
      throw ArgumentError('negative numbers not allowed ${negatives.join(',')}');
    }
  }
}