```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
    } else {
      final errorMessage = 'Failed to load data: ${response.statusCode} - ${response.reasonPhrase}';
      throw HttpException(errorMessage, response.statusCode);
    }
  } on HttpException catch (e) {
    print('HTTP Error: ${e.message}');
    // Handle HTTP-specific errors
  } on FormatException catch (e) {
    print('JSON Parsing Error: $e');
    // Handle JSON parsing errors
  } catch (e, stackTrace) {
    print('Unexpected Error: $e, Stack Trace: $stackTrace');
    // Handle other unexpected exceptions
    // Consider using a logging library for more sophisticated error reporting
  }
}
```