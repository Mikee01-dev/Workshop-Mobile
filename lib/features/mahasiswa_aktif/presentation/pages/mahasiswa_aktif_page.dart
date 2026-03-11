import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:aplikasi_mobile/core/widgets/common_widgets.dart';
import 'package:aplikasi_mobile/features/mahasiswa_aktif/presentation/providers/mahasiswa_aktif_provider.dart';
import 'package:aplikasi_mobile/core/constants/app_constants.dart';
import 'package:aplikasi_mobile/features/mahasiswa_aktif/presentation/widgets/mahasiswa_aktif_widget.dart';

class MahasiswaAktifPage extends ConsumerWidget {
  const MahasiswaAktifPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final mahasiswaAktifState = ref.watch(mahasiswaAktifNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Mahasiswa Aktif'),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh_rounded),
            onPressed: () {
              ref.invalidate(mahasiswaAktifNotifierProvider);
            },
            tooltip: 'Refresh',
          ),
        ],
      ),

      body: mahasiswaAktifState.when(

        /// Loading
        loading: () => const LoadingWidget(),

        /// Error
        error: (error, stack) => CustomErrorWidget(
          message: 'Gagal memuat data mahasiswa: ${error.toString()}',
          onRetry: () {
            ref.read(mahasiswaAktifNotifierProvider.notifier).refresh();
          },
        ),

        /// Data
          data: (mahasiswaAktifList) {
            return RefreshIndicator(
              onRefresh: () async {
                ref.invalidate(mahasiswaAktifNotifierProvider);
              },
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: mahasiswaAktifList.length,
                itemBuilder: (context, index) {

                  final mahasiswa = mahasiswaAktifList[index];

                  return ModernMahasiswaAktifCard(
                    mahasiswa: mahasiswa,
                    gradientColors: AppConstants.dashboardGradients[
                    index % AppConstants.dashboardGradients.length
                    ],
                  );

                },
              ),
            );
          }
      ),
    );
  }
}
