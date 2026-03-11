class MahasiswaModel {
  final String nama;
  final String nim;
  final String jurusan;

  MahasiswaModel({
    required this.nama,
    required this.nim,
    required this.jurusan,
  });

  factory MahasiswaModel.fromJson(Map<String, dynamic> json) {
    return MahasiswaModel(
      nama: json['nama'] ?? '',
      nim: json['nim'] ?? '',
      jurusan: json['jurusan'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nama': nama,
      'nim': nim,
      'jurusan': jurusan,
    };
  }
}