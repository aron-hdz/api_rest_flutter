// Archivo: lib/models/post_model.dart
class Post {
  final int userId; //  Nuevo campo
  final int id;
  final String title;
  final String body;

  Post({
    required this.userId, // Requerido en constructor
    required this.id,
    required this.title,
    required this.body,
  });

  // Constructor factory: crea un Post a partir del Map
  // que resulta de decodificar el JSON
  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userId: json['userId'] as int, //  Mapeo desde el JSON
      id: json['id'] as int,
      title: json['title'] as String,
      body: json['body'] as String,
    );
  }
}