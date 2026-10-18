// Archivo: lib/services/api_service.dart
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../models/post_model.dart';
import '../models/user_model.dart';

class ApiService {
  final String _baseUrl = 'https://jsonplaceholder.typicode.com';

  
  Future<List<Post>> fetchPosts() async {
    final url = Uri.parse('$_baseUrl/posts');
    try {
      final response = await http.get(url).timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = jsonDecode(response.body);
        return jsonList.map((json) => Post.fromJson(json)).toList();
      } else {
        throw Exception('El servidor respondió con un error. Estado: ${response.statusCode}');
      }
    } on TimeoutException {
      throw Exception('La conexión tardó demasiado. Intenta de nuevo.');
    } on SocketException {
      throw Exception('Sin conexión a internet. Revisa tu señal.');
    }
  }

  // Método nuevo para usuarios (Reto 4)
  Future<List<User>> fetchUsers() async {
    final url = Uri.parse('$_baseUrl/users');
    try {
      final response = await http.get(url).timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = jsonDecode(response.body);
        return jsonList.map((json) => User.fromJson(json)).toList();
      } else {
        throw Exception('Error del servidor: ${response.statusCode}');
      }
    } on TimeoutException {
      throw Exception('Tiempo agotado al cargar usuarios.');
    } on SocketException {
      throw Exception('Sin conexión a internet.');
    }
  }
}
