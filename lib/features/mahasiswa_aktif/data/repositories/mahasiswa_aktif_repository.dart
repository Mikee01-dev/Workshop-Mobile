import 'package:aplikasi_mobile/features/mahasiswa_aktif/data/models/mahasiswa_aktif_model.dart';

class MahasiswaAktifRepository {

  Future<List<MahasiswaAktifModel>> getMahasiswaList() async {

    await Future.delayed(const Duration(seconds: 1));
    
    return [

      MahasiswaAktifModel(
        nama: 'Mahasiswa A',
        nim: '123456789',
        semester: 5,
        ipk: 3.5,
      ),

      MahasiswaAktifModel(
        nama: 'Mahasiswa B',
        nim: '987654321',
        semester: 4,
        ipk: 3.8,
      ),

      MahasiswaAktifModel(
        nama: 'Mahasiswa C',
        nim: '456789123',
        semester: 3,
        ipk: 3.2,
      ),
      
    ];
  }
}