import 'package:aplikasi_mobile/features/profile/data/models/profile_model.dart';

class ProfileRepository {

  Future<ProfileModel> getUserProfile() async {

    await Future.delayed(const Duration(seconds: 1));
    
    return ProfileModel(
      nama: 'Michael',
      nim: '210103123',
      email: 'michael@mahasiswa.dati.ac.id',
      jurusan: 'D4 Teknik Informatika',
      semester: 6,
    );
  }
}
