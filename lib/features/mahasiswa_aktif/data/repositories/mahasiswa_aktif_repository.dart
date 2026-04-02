import 'package:aplikasi_mobile/core/network/dio_client.dart';
import 'package:aplikasi_mobile/features/mahasiswa_aktif/data/models/mahasiswa_aktif_model.dart';
import 'package:dio/dio.dart';

class MahasiswaAktifRepository {
  final DioClient _dioClient;
  MahasiswaAktifRepository({DioClient? dioClient}) : _dioClient = dioClient ?? DioClient();

  Future<List<MahasiswaAktifModel>> getMahasiswaList() async {
    try {
      final Response response = await _dioClient.dio.get('/posts');
      final List<dynamic> data = response.data;
      return data.map((json) => MahasiswaAktifModel.fromJson(json)).toList();
    } on DioException catch (e) {
      throw Exception('Gagal memuat data mahasiswa: ${e.response?.statusCode} - ${e.message}');
    }
  }
}