class IteamModel {
  final String titile;
  final double rating;
  final bool fav;
  final String image;
  final double price;
  final String discrption;
  final String? making;
  final String? video;
  final String category;
  IteamModel({
    required this.category,
    required this.titile,
    required this.rating,
    required this.fav,
    required this.image,
    required this.price,
    required this.discrption,
    this.making,
    this.video,
  });
}
