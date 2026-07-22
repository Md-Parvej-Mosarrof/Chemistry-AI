import '../../domain/entities/home_entity.dart';

class HomeModel {
  final String id;
  final String title;
  final String subtitle;
  final String imageUrl;
  final double progress;
  final String category;

  const HomeModel({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    required this.progress,
    required this.category,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(
      id: json['id'] as String,

      title: json['title'] as String,

      subtitle: json['subtitle'] as String,

      imageUrl: json['imageUrl'] as String,

      progress: (json['progress'] as num).toDouble(),

      category: json['category'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,

      'title': title,

      'subtitle': subtitle,

      'imageUrl': imageUrl,

      'progress': progress,

      'category': category,
    };
  }

  HomeEntity toEntity() {
    return HomeEntity(
      id: id,

      title: title,

      subtitle: subtitle,

      imageUrl: imageUrl,

      progress: progress,

      category: category,
    );
  }
}
