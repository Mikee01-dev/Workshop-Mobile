import 'package:aplikasi_mobile/features/dosen/data/models/dosen_model.dart';

class DosenRepository {

  Future<List<DosenModel>> getDosenList() async {

    await Future.delayed(const Duration(seconds: 1));
    
    return [

      DosenModel(
        nama: 'Dosen A',
        nip: '123456789',
        email: 'dosen.a@example.com',
        jurusan: 'Teknik Informatika',
      ),

      DosenModel(
        nama: 'Dosen B',
        nip: '987654321',
        email: 'dosen.b@example.com',
        jurusan: 'Sistem Informasi',
      ),

      DosenModel(
        nama: 'Dosen C',
        nip: '456789123',
        email: 'dosen.c@example.com',
        jurusan: 'Teknik Komputer',
      ),
      
    ];
  }
}