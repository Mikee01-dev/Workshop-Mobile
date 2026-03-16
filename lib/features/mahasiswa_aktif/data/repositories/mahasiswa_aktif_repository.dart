import 'package:dio/dio.dart';
import '../models/mahasiswa_aktif_model.dart';

class MahasiswaAktifRepository {
  final Dio _dio = Dio();

  Future<List<MahasiswaAktifModel>> getMahasiswaAktifList() async {
    try {
      final response = await _dio.get(
        'https://jsonplaceholder.typicode.com/posts',
      );

      List data = response.data;

      return data.map((e) => MahasiswaAktifModel.fromJson(e)).toList();
    } catch (e) {
      throw Exception("Gagal memuat data mahasiswa aktif");
    }
  }
}