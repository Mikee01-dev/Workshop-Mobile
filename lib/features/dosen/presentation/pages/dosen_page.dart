import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:aplikasi_mobile/core/widgets/common_widgets.dart';
import 'package:aplikasi_mobile/features/dosen/presentation/providers/dosen_provider.dart';
import 'package:aplikasi_mobile/core/constants/app_constants.dart';
import 'package:aplikasi_mobile/features/dosen/presentation/widgets/dosen_widgets.dart';

class DosenPage extends ConsumerWidget {
  const DosenPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final dosenState = ref.watch(dosenNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Dosen'),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh_rounded),
            onPressed: () {
              ref.invalidate(dosenNotifierProvider);
            },
            tooltip: 'Refresh',
          ),
        ],
      ),

      body: dosenState.when(

        /// Loading
        loading: () => const LoadingWidget(),

        /// Error
        error: (error, stack) => CustomErrorWidget(
          message: 'Gagal memuat data dosen: ${error.toString()}',
          onRetry: () {
            ref.read(dosenNotifierProvider.notifier).refresh();
          },
        ),

        /// Data
          data: (dosenList) {
            return RefreshIndicator(
              onRefresh: () async {
                ref.invalidate(dosenNotifierProvider);
              },
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: dosenList.length,
                itemBuilder: (context, index) {

                  final dosen = dosenList[index];

                  return ModernDosenCard(
                    dosen: dosen,
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

