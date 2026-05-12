import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../di/injection.dart';
import '../network/api_client.dart';
import '../storage/storage_service.dart';
import '../services/connectivity_service.dart';

/// Access GetIt-managed singletons via Riverpod providers.
/// This bridges DI and Riverpod cleanly.

final apiClientProvider = Provider<ApiClient>(
  (_) => sl<ApiClient>(),
);

final storageServiceProvider = Provider<StorageService>(
  (_) => sl<StorageService>(),
);

final connectivityProvider = Provider<ConnectivityService>(
  (_) => sl<ConnectivityService>(),
);

/// Stream provider: emits true when online, false when offline
final isOnlineProvider = StreamProvider<bool>((ref) {
  return ref
      .watch(connectivityProvider)
      .onStatusChange
      .map((results) => results.any((r) => r.name != 'none'));
});
