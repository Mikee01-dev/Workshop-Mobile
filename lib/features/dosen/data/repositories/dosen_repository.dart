import 'package:aplikasi_mobile/features/dosen/data/models/dosen_model.dart';
import 'package:dio/dio.dart';

class DosenRepository {
  final Dio _dio = Dio();

  Future<List<DosenModel>> getDosenList() async {
    try {
      final response = await _dio.get(
        'https://jsonplaceholder.typicode.com/users',
      );

      List data = response.data;

      return data.map((e) => DosenModel.fromJson(e)).toList();
    } catch (e) {
      throw Exception("Gagal memuat data dosen");
    }
  }
}