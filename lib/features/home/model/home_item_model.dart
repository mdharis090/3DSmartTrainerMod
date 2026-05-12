class HomeItemModel {
  final String id;
  final String title;
  final String? description;

  const HomeItemModel({
    required this.id,
    required this.title,
    this.description,
  });

  factory HomeItemModel.fromJson(Map<String, dynamic> json) => HomeItemModel(
    id:          json['id']          as String,
    title:       json['title']       as String,
    description: json['description'] as String?,
  );
}
