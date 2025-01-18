```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      // Handle the successful response
      final jsonData = jsonDecode(response.body);
      // Process jsonData
    } else {
      // Handle the error response
      throw Exception('Failed to load data. Status code: ${response.statusCode}');
    }
  } catch (e) {
    // Handle exceptions during the network request
    print('Error fetching data: $e');
    // This is where the error is usually handled and rethrown
    rethrow;
  }
}
```