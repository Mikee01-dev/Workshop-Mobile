class MahasiswaModel {
  final int postId;
  final int id;
  final String name;
  final String email;
  final String body;

  MahasiswaModel({
    required this.postId,
    required this.name,
    required this.id,
    required this.email,
    required this.body,
  });

  factory MahasiswaModel.fromJson(Map<String, dynamic> json) {
    return MahasiswaModel(
      postId: json['postId'] ?? 0,
      name: json['name'] ?? '',
      id: json['id'] ?? 0,
      email: json['email'] ?? '',
      body: json['body'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'postId': postId,
      'name': name,
      'id': id,
      'email': email,
      'body': body,
    };
  }
}