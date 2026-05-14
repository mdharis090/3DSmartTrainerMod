class AppState {
  final int daysSinceStartValue;
  final double currentWeightValue;
  final double progressPercentValue;
  final int streakValue;

  AppState({
    required this.daysSinceStartValue,
    required this.currentWeightValue,
    required this.progressPercentValue,
    required this.streakValue,
  });

  AppState copyWith({
    int? daysSinceStartValue,
    double? currentWeightValue,
    double? progressPercentValue,
    int? streakValue,
  }) {
    return AppState(
      daysSinceStartValue: daysSinceStartValue ?? this.daysSinceStartValue,
      currentWeightValue: currentWeightValue ?? this.currentWeightValue,
      progressPercentValue: progressPercentValue ?? this.progressPercentValue,
      streakValue: streakValue ?? this.streakValue,
    );
  }
}