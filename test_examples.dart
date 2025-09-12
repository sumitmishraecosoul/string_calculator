import 'src/string_calculator.dart';

void main() {
  var calculator = StringCalculator();
  
  print('🧪 Testing String Calculator Examples\n');

  // --- BASIC TESTS ---

  // Test 1: Empty string
  _run("Empty string", "", 0, calculator);

  // Test 2: Single number
  _run("Single number", "5", 5, calculator);

  // Test 3: Two numbers
  _run("Two comma-separated numbers", "1,5", 6, calculator);

  // Test 4: Multiple numbers
  _run("Multiple numbers", "1,2,3,4", 10, calculator);

  // Test 5: Newlines
  _run("Newline separators", "1\n2,3", 6, calculator);

  // Test 6: Custom delimiter
  _run("Custom delimiter ;", "//;\n1;2;3", 6, calculator);

  // Test 7: Negative numbers
  _expectException(
    "Negative numbers",
    "-1",
    "negative numbers not allowed -1",
    calculator,
  );

  // Test 8: Multiple negative numbers
  _expectException(
    "Multiple negatives",
    "2,-4,3,-5",
    "negative numbers not allowed -4,-5",
    calculator,
  );

  // --- COMPLEX TESTS ---

  // Test 9: Only newlines
  _run("Only newlines", "1\n2\n3", 6, calculator);

  // Test 10: Custom delimiter with |
  _run("Custom delimiter |", "//|\n1|2|3", 6, calculator);

  // Test 11: Large input with mixed delimiters
  _run("Large input with commas and newlines", "1,2\n3,4\n5,6,7,8,9,10", 55, calculator);

  // Test 12: Custom delimiter with different char #
  _run("Custom delimiter #", "//#\n10#20#30", 60, calculator);

  // Test 13: Edge case - single negative among positives
  _expectException(
    "Single negative among positives",
    "100,-200,300",
    "negative numbers not allowed -200",
    calculator,
  );

  // Test 14: Edge case - empty numbers between delimiters
  _run("Empty numbers between delimiters", "1,,2", 3, calculator);

  // Test 15: Large numbers (optional rule: ignore >1000)
  try {
    var result = calculator.add("2,1001");
    print("Test 15: Large numbers (>1000)");
    print("Input: \"2,1001\"");
    print("Expected: (if implemented) 2");
    print("Actual: $result");
    print("⚠️ Depends on implementation (PASS if rule implemented, else ignore)\n");
  } catch (e) {
    print("❌ FAIL - Unexpected exception: $e");
  }

  print('🎉 All tests completed!');
}

/// Helper to run normal cases
void _run(String title, String input, int expected, StringCalculator calculator) {
  print("Test: $title");
  print("Input: \"$input\"");
  print("Expected: $expected");
  var result = calculator.add(input);
  print("Actual: $result");
  print(result == expected ? "✅ PASS\n" : "❌ FAIL\n");
}

/// Helper to test exceptions
void _expectException(
    String title, String input, String expectedMessage, StringCalculator calculator) {
  print("Test: $title");
  print("Input: \"$input\"");
  print("Expected Exception: $expectedMessage");
  try {
    calculator.add(input);
    print("❌ FAIL - No exception thrown\n");
  } catch (e) {
    print("Actual: Exception thrown: $e");
    print(e.toString().contains(expectedMessage) ? "✅ PASS\n" : "❌ FAIL\n");
  }
}
