import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:aplikasi_mobile/features/mahasiswa_aktif/data/models/mahasiswa_aktif_model.dart';
import 'package:aplikasi_mobile/features/mahasiswa_aktif/data/repositories/mahasiswa_aktif_repository.dart';

/// Repository Provider
final mahasiswaAktifRepositoryProvider = Provider<MahasiswaAktifRepository>((ref) {
  return MahasiswaAktifRepository();
});

/// StateNotifier untuk mengelola state mahasiswa
class MahasiswaAktifNotifier extends StateNotifier<AsyncValue<List<MahasiswaAktifModel>>> {

  final MahasiswaAktifRepository _repository;

  MahasiswaAktifNotifier(this._repository) : super(const AsyncValue.loading()) {
    loadMahasiswaList();
  }

  /// Load data mahasiswa
  Future<void> loadMahasiswaList() async {

    state = const AsyncValue.loading();

    try {

      final data = await _repository.getMahasiswaList();

      state = AsyncValue.data(data);

    } catch (error, stackTrace) {

      state = AsyncValue.error(error, stackTrace);

    }
  }

  /// Refresh data
  Future<void> refresh() async {
    await loadMahasiswaList();
  }
}

/// Provider
final mahasiswaAktifNotifierProvider =
StateNotifierProvider.autoDispose<
    MahasiswaAktifNotifier,
    AsyncValue<List<MahasiswaAktifModel>>>((ref) {

  final repository = ref.watch(mahasiswaAktifRepositoryProvider);

  return MahasiswaAktifNotifier(repository);
});
