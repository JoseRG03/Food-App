part of 'explore_recipe.dart';

class Post {
  final String id;
  final String dishImage;
  final String title;
  final String duration;
  final String source;
  final List<String> information;

  Post({
    required this.id,
    required this.dishImage,
    required this.title,
    required this.duration,
    required this.source,
    required this.information,
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
    id: json["id"],
    dishImage: json["dishImage"],
    title: json["title"],
    duration: json["duration"],
    source: json["source"],
    information: List<String>.from(json["information"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "dishImage": dishImage,
    "title": title,
    "duration": duration,
    "source": source,
    "information": List<dynamic>.from(information.map((x) => x)),
  };
}
