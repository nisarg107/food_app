import 'dart:convert';

List<ProductModel> productsfromJson(String str) =>
    List<ProductModel>.from(json.decode(str).map((x) => ProductModel.fromJson(x)));

class ProductModel {
  int totalSize;
  int typeId;
  int offset;
  Product? products;

  ProductModel({
    required this.totalSize,
    required this.typeId,
    required this.offset,
    required this.products,
  });

  factory ProductModel.fromJson(Map<String,dynamic> json)=>ProductModel(
    totalSize: json['totalSize'], 
    typeId: json['typeId'], 
    offset: json['offset'], 
    products: json['products'] != null ? new Product.fromJson(json['products']) : null);
}

class Product {
  int id;
  String name;
  String description;
  int price;
  int stars;
  String img;
  String location;
  DateTime createdAt;
  DateTime updatedAt;
  int typeId;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.stars,
    required this.img,
    required this.location,
    required this.createdAt,
    required this.updatedAt,
    required this.typeId,
  });

  factory Product.fromJson(Map<String,dynamic> json)=>Product(
    id: json['id'], 
    name: json['name'], 
    description: json['description'], 
    price: json['price'], 
    stars: json['stars'], 
    img: json['img'], 
    location: json['location'], 
    createdAt: json['createdAt'], 
    updatedAt: json['updatedAt'], 
    typeId: json['typeId']);
}
