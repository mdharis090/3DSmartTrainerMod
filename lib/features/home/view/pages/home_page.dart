import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../controller/home_controller.dart';
import '../../../../core/widgets/app_loading.dart';
import '../../../../core/widgets/app_error_widget.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeControllerProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: state.when(
        loading: () => const AppLoading(),
        error:   (e, _) => AppErrorWidget(
          message: e.toString(),
          onRetry: () => ref.read(homeControllerProvider.notifier).refresh(),
        ),
        data: (items) => RefreshIndicator(
          onRefresh: () =>
              ref.read(homeControllerProvider.notifier).refresh(),
          child: items.isEmpty
              ? const Center(child: Text('No items found'))
              : ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: items.length,
                  itemBuilder: (_, i) {
                    final item = items[i];
                    return Card(
                      child: ListTile(
                        title:    Text(item.title),
                        subtitle: item.description != null
                            ? Text(item.description!)
                            : null,
                      ),
                    );
                  },
                ),
        ),
      ),
    );
  }
}
