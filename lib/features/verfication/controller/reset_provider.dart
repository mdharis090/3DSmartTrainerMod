import 'package:flutter_riverpod/legacy.dart';
import 'package:transformationtracker/features/verfication/controller/timer_state.dart';
final timerProvider = StateNotifierProvider<TimerNotifier, TimerState>((ref) {
  return TimerNotifier();
});
class TimerNotifier extends StateNotifier<TimerState> {
  TimerNotifier() : super(TimerState(remainingSeconds: 6, canResend: false)) {
    startTimer();
  }

  void startTimer() {
    state = TimerState(remainingSeconds: 6, canResend: false);
    Future.delayed(Duration.zero, () {
      _runTimer();
    });
  }

  void _runTimer() async {
    for (int i = 6; i > 0; i--) {
      await Future.delayed(const Duration(seconds: 1));
      if (state.remainingSeconds == i) {
        state = state.copyWith(remainingSeconds: i - 1);
      }
    }
    state = state.copyWith(canResend: true);
  }

  void resendCode() {
    if (!state.canResend) return;
    startTimer();
  }
}
