class ArticleModel {
  String title;
  String author;
  String description;
  String urlToImage;
  //DateTime publshedAt;
  String content;
  String url;

  ArticleModel(
      {required this.title,
      required this.description,
      required this.author,
      required this.content,
      //required this.publshedAt,
      required this.urlToImage,
      required this.url});
}
