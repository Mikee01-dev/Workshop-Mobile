import 'package:aplikasi_mobile/features/mahasiswa/data/models/mahasiswa_model.dart';

class MahasiswaRepository {

  Future<List<MahasiswaModel>> getMahasiswaList() async {

    await Future.delayed(const Duration(seconds: 1));
    
    return [

      MahasiswaModel(
        nama: 'Mahasiswa A',
        nim: '123456789',
        jurusan: 'Teknik Informatika',
      ),

      MahasiswaModel(
        nama: 'Mahasiswa B',
        nim: '987654321',
        jurusan: 'Sistem Informasi',
      ),

      MahasiswaModel(
        nama: 'Mahasiswa C',
        nim: '456789123',
        jurusan: 'Teknik Komputer',
      ),
      
    ];
  }
}