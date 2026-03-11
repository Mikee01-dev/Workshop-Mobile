import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:aplikasi_mobile/features/profile/data/models/profile_model.dart';
import 'package:aplikasi_mobile/features/profile/data/repositories/profile_provider.dart';

/// Repository Provider
final profileRepositoryProvider = Provider<ProfileRepository>((ref) {
  return ProfileRepository();
});

/// Future Provider untuk mengambil data profile sekali load
final profileNotifierProvider = FutureProvider.autoDispose<ProfileModel>((ref) async {
  final repository = ref.watch(profileRepositoryProvider);
  return repository.getUserProfile();
});
