import 'package:aplikasi_mobile/features/mahasiswa/data/models/mahasiswa_model.dart';
import 'package:dio/dio.dart';

class MahasiswaRepository {
  final Dio _dio = Dio();

  Future<List<MahasiswaModel>> getMahasiswaList() async {
    try {
      final response = await _dio.get(
        'https://jsonplaceholder.typicode.com/comments',
      );

      List data = response.data;

      return data.map((e) => MahasiswaModel.fromJson(e)).toList();
    } catch (e) {
      throw Exception("Gagal memuat data mahasiswa");
    }
  }
}