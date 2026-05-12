import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:transformationtracker/core/error/app_error.dart';
import '../model/home_item_model.dart';
import '../../../core/providers/providers.dart';
import '../../../core/utils/app_logger.dart';

/// AsyncNotifier automatically handles loading/error/data states
class HomeController extends AsyncNotifier<List<HomeItemModel>> {
  @override
  Future<List<HomeItemModel>> build() => _fetchItems();

  Future<List<HomeItemModel>> _fetchItems() async {
    final api    = ref.read(apiClientProvider);
    final result = await api.get<List<HomeItemModel>>(
      '/items',   // 👈 replace with your endpoint
      fromJson: (json) => (json as List)
          .map((e) => HomeItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

    return result.when(
      success: (data) {
        AppLogger.info('Fetched ${data.length} items');
        return data;
      },
      failure: (msg, _) => throw Exception(msg),
    );
  }

  /// Pull-to-refresh
  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(_fetchItems);
  }
}

final homeControllerProvider =
    AsyncNotifierProvider<HomeController, List<HomeItemModel>>(
        HomeController.new);
