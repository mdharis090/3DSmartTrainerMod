import 'package:flutter_riverpod/legacy.dart';
import 'package:transformationtracker/features/personal_name/model/user_data_model.dart';

class UserDataNotifier extends StateNotifier<UserData> {
  UserDataNotifier()
      : super(UserData(
          gender: Gender.male,
          age: 19,
          height: 160,
          weight: 55,
        ));

  void setGender(Gender gender) {
    state = state.copyWith(gender: gender);
  }

  void setAge(int age) {
    state = state.copyWith(age: age);
  }

  void setHeight(int height) {
    state = state.copyWith(height: height);
  }

  void setWeight(int weight) {
    state = state.copyWith(weight: weight);
  }
}

final userDataProvider = StateNotifierProvider<UserDataNotifier, UserData>(
  (ref) => UserDataNotifier(),
);