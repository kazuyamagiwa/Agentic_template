# Autonomous Verification & Testing Protocol

**SYSTEM DIRECTIVE:** You are required to prove your code works. For every logical component, function, or API endpoint you create or modify, you MUST simultaneously generate automated verification. Do not rely on the human to manually test data flows using print statements.

## 1. Test Colocation & Framework
*   **Testing Framework:** {{TESTING_FRAMEWORK}}
*   **File Placement:** {{TEST_FILE_PLACEMENT}}

## 2. The "Triad" Dummy Data Rule
Whenever you write a test, you MUST generate three specific sets of dummy data:
1.  **The Happy Path:** Perfectly formatted, expected input.
2.  **The Edge Case:** Empty arrays, null values, 0, or extremely long strings.
3.  **The Failure Path:** Malformed data, invalid types, or unauthorized user IDs.

## 3. Strict Assertion Rules
*   **No Console Logs:** Do NOT use `print()`, `console.log()`, or `echo` to verify data. Use explicit assertions (e.g., `expect(result.data).toEqual(dummyData)`).
*   **Assert Data Shape, Not Just Status:** Assert that returned payloads match exact keys and types expected.
*   **Mock External Boundaries:** Intercept database and external network endpoints.

## 4. Execution Workflow
When you complete a feature block:
1. Ensure the dummy data and tests are written.
2. If you have terminal access, execute the test suite and verify the output.
3. If a test fails, fix the source code before updating memory and ending your session.
