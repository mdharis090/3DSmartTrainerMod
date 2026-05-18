// --- Data Model ---
enum Gender { male, female }

class UserData {
  final Gender gender;
  final int age;
  final int height;
  final int weight;

  UserData({
    required this.gender,
    required this.age,
    required this.height,
    required this.weight,
  });

  UserData copyWith({
    Gender? gender,
    int? age,
    int? height,
    int? weight,
  }) {
    return UserData(
      gender: gender ?? this.gender,
      age: age ?? this.age,
      height: height ?? this.height,
      weight: weight ?? this.weight,
    );
  }
}
