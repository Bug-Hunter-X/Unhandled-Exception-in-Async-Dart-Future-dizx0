```dart
Future<Map<String, dynamic>> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return jsonData;
    } else {
      throw CustomException('Failed to load data. Status code: ${response.statusCode}', response.statusCode);
    }
  } on CustomException catch (e) {
    // Handle specific custom exception
    print('Custom Error: ${e.message} (Code: ${e.statusCode})');
    rethrow; // Rethrow for higher-level handling
  } catch (e) {
    // Handle generic exceptions
    print('Generic Error: $e');
    rethrow; // Rethrow for higher-level handling
  }
}

class CustomException implements Exception {
  final String message;
  final int statusCode;

  CustomException(this.message, this.statusCode);

  @override
  String toString() => 'CustomException: $message (Code: $statusCode)';
}
```