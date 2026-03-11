import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:aplikasi_mobile/core/widgets/common_widgets.dart';
import 'package:aplikasi_mobile/features/mahasiswa/presentation/providers/mahasiswa_provider.dart';
import 'package:aplikasi_mobile/core/constants/app_constants.dart';
import 'package:aplikasi_mobile/features/mahasiswa/presentation/widgets/mahasiswa_widget.dart';

class MahasiswaPage extends ConsumerWidget {
  const MahasiswaPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final mahasiswaState = ref.watch(mahasiswaNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Mahasiswa'),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh_rounded),
            onPressed: () {
              ref.invalidate(mahasiswaNotifierProvider);
            },
            tooltip: 'Refresh',
          ),
        ],
      ),

      body: mahasiswaState.when(

        /// Loading
        loading: () => const LoadingWidget(),

        /// Error
        error: (error, stack) => CustomErrorWidget(
          message: 'Gagal memuat data mahasiswa: ${error.toString()}',
          onRetry: () {
            ref.read(mahasiswaNotifierProvider.notifier).refresh();
          },
        ),

        /// Data
          data: (mahasiswaList) {
            return RefreshIndicator(
              onRefresh: () async {
                ref.invalidate(mahasiswaNotifierProvider);
              },
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: mahasiswaList.length,
                itemBuilder: (context, index) {

                  final mahasiswa = mahasiswaList[index];

                  return ModernMahasiswaCard(
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
