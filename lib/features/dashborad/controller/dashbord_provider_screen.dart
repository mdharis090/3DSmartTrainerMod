import 'package:flutter_riverpod/legacy.dart';
import 'package:transformationtracker/features/dashborad/controller/dashbord_state.dart';
final appProvider = StateNotifierProvider<AppProvider, AppState>((ref) {
  return AppProvider();
});
class AppProvider extends StateNotifier<AppState> {
  AppProvider()
      : super(AppState(
          daysSinceStartValue: 5,
          currentWeightValue: 75.5,
          progressPercentValue: 0.6,
          streakValue: 12,
        ));

  void updateProgress(double weight, double percent, int streak) {
    state = state.copyWith(
      currentWeightValue: weight,
      progressPercentValue: percent,
      streakValue: streak,
    );
  }
}