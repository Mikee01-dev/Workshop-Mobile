class MahasiswaAktifModel {
  int userId;
  int id;
  String title;
  String body;

  MahasiswaAktifModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory MahasiswaAktifModel.fromJson(Map<String, dynamic> json) {
    return MahasiswaAktifModel(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}