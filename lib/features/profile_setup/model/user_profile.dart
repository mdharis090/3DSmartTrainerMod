class UserProfile {
  final String name;
  final int age;
  final double weight;
  final double height;
  final String goal;
  final double targetWeight;

  UserProfile({
    required this.name,
    required this.age,
    required this.weight,
    required this.height,
    required this.goal,
    required this.targetWeight,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'age': age,
      'weight': weight,
      'height': height,
      'goal': goal,
      'targetWeight': targetWeight,
    };
  }

  factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
    name: json['name'],
    age: json['age'],
    weight: json['weight'],
    height: json['height'],
    goal: json['goal'],
    targetWeight: json['targetWeight'],
  );
}