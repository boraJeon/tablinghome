class HomeModel {
  final String title;
  final String thumbUrl;
  final String rating;
  final String reviewCount;
  final String waitingCount;

  HomeModel({
    required this.title,
    required this.thumbUrl,
    required this.rating,
    required this.reviewCount,
    required this.waitingCount,
  });

// factory 뭐지.. 일단 다하고 찾아봐야지
  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
        title: json["title"],
        thumbUrl: json["thumbUrl"],
        rating: json["rating"],
        reviewCount: json["reviewCount"],
        waitingCount: json["waitingCount"],
      );
}
