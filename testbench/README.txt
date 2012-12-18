Testing MPS

1. From IDEA

  1.1. The shared run configuration "GlobalTestSuite" should be used to run JUnit tests.

  1.1.1. The file "global_tests_patterns.txt" contains the Ant patterns to search for JUnit tests.

  1.1.2. The class GlobalTestSuite must be kept up-to-date with the tests by launching action "Collect JUnit tests" on it.

  1.1.3. The action "Collect JUnit tests" takes a set of Ant patterns and searches for all JUnit tests.

  1.2  The test "BrokenReferencesTest" tests for broken references in all models/modules matched by the patterns in the test itself

  1.3  The test "ProjectTest" tests all projects listed in the test itself

2. On TeamCity server

  2.1. The patterns for JUnit tests must not be altered.

  2.2  If make is required for a test, "MpsMakeHelper" should be called from a @BeforeClass static method.

      
