import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/user.dart';

class UserRepository {
  final http.Client _client;
  static const String _baseUrl = 'https://jsonplaceholder.typicode.com/users';
  
  UserRepository({http.Client? client}) : _client = client ?? http.Client();
  
  Future<User> getUser(String userId) async {
    final response = await _client.get(Uri.parse('$_baseUrl/$userId'));
    
    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load user (Status ${response.statusCode})');
    }
  }
}