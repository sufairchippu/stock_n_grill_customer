import 'package:stock_n_grill_customer/model/data/iteam_model.dart';

class CategoryModel {
  final String titile;
  final List<IteamModel> iteams;
  final List<AddOn> ingredients;
  final String image;
  // final List<
  // final string
  CategoryModel({
    required this.titile,
    required this.iteams,
    required this.ingredients,
    required this.image,
  });
}

class AddOn {
  final String name;
  final double price;
  AddOn(this.name, this.price);
}

class DrawerItem {
  final String icon;
  final String titile;
  final void Function()? nav;
  DrawerItem(this.icon, this.nav, this.titile);
}
