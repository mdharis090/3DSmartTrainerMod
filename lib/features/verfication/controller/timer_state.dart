class TimerState {
  final int remainingSeconds;
  final bool canResend;

  TimerState({required this.remainingSeconds, required this.canResend});

  TimerState copyWith({int? remainingSeconds, bool? canResend}) {
    return TimerState(
      remainingSeconds: remainingSeconds ?? this.remainingSeconds,
      canResend: canResend ?? this.canResend,
    );
  }
}