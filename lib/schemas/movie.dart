class Movie {
  final int id;
  final String title;
  final List<String> banners;

  Movie({
    required this.id,
    required this.title,
    required this.banners,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      title: json['title'],
      banners: json['banners'].cast<String>()
    );
  }
}
