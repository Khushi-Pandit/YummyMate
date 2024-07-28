import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  Future<void> createUser(String name) async {
    const url = 'http://localhost:3000/api/users';
    final response = await http.post(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
    }, body: jsonEncode({'name': name}));

    if (response.statusCode == 201) {
      // print('User created successfully');
    } else {
      // print('Error creating user: ${response.statusCode}');
    }
  }
}