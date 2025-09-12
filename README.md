# String Calculator

I built this String Calculator in Dart following TDD practices. It was my first real attempt at doing TDD properly - no shortcuts, just pure red-green-refactor cycles.

## What it does

- `add("")` → `0`
- `add("1")` → `1` 
- `add("1,2,3")` → `6`
- `add("1\n2,3")` → `6`
- `add("//;\n1;2")` → `3`
- `add("-1")` → throws "negative numbers not allowed -1"

## How to run

```bash
dart pub get
dart test
```

## My TDD approach

I made myself follow the red-green-refactor cycle for every single feature:

1. Write a failing test
2. Write minimal code to pass
3. Refactor if needed
4. Commit

That's it. No exceptions.

## My commits

I ended up with 15 commits total:

1. `test: add failing test for empty string returns 0`
2. `impl: return 0 when input is empty`
3. `test: add failing test for single number returns itself`
4. `impl: parse single number and return it`
5. `test: add failing test for two comma-separated numbers`
6. `impl: split on comma and sum numbers`
7. `test: add failing test for multiple numbers`
8. `test: add failing test for newline separators`
9. `impl: accept newlines and commas as separators`
10. `test: add failing test for custom delimiter syntax`
11. `impl: parse and support custom delimiter`
12. `test: add failing test for negative numbers throwing exception`
13. `impl: throw exception with required message when negatives present`
14. `refactor: extract helper methods and clean up duplication`
15. `docs: update README with TDD narrative and instructions`

## What I learned

TDD is harder than it looks. The discipline of writing failing tests first and taking tiny steps felt unnatural at first, but it actually made me think more carefully about what I was building.

The refactoring step was surprisingly satisfying - extracting those helper methods made the code so much cleaner.

