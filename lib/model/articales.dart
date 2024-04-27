class article{
  final String title;
  final String descreption ;
  final String image;

  article({required this.title
  , required this.descreption
  , required this.image});
  factory article.fromJson(Map<String, dynamic> json) {
    return article(
      descreption: json['description'] ?? 'No description',
      title: json['title'] ?? 'No title',
      image: json['urlToImage'] ?? 'default_image_url_here',
    );
  }
}