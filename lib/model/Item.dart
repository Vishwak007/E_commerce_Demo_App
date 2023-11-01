import 'package:flutter/material.dart';

class Item {
  final String id;
  final String title;
  final String description;
  final String price;
  final String discountPercentage;
  final String rating;
  final String stock;
  final String brand;
  final String category;
  final String thumbnail;
  List<String> images;

  Item(
      this.id,
      this.title,
      this.description,
      this.price,
      this.discountPercentage,
      this.rating,
      this.stock,
      this.brand,
      this.category,
      this.thumbnail,
      this.images);

  factory Item.fromMap(Map<String, dynamic> json) {
    return Item(
        json["id"],
        json["title"],
        json["description"],
        json["price"],
        json["discountPercentage"],
        json["rating"],
        json["stock"],
        json["brand"],
        json["category"],
        json["thumbnail"],
        json["images"]);
  }
  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
        json["id"].toString(),
        json["title"].toString(),
        json["description"].toString(),
        json["price"].toString(),
        json["discountPercentage"].toString(),
        json["rating"].toString(),
        json["stock"].toString(),
        json["brand"].toString(),
        json["category"].toString(),
        json["thumbnail"].toString(),
        json["images"] != null ? List.from(json["images"]) : []);
  }

  String getItemSpec(String key) {
    switch (key) {
      case "id":
        {
          return this.id;
        }
      case "title":
        {
          return this.title;
        }
      case "description":
        {
          return this.description;
        }
      case "price":
        {
          return this.price;
        }
      case "discountPercentage":
        {
          return this.discountPercentage;
        }
      case "rating":
        {
          return this.rating;
        }
      case "stock":
        {
          return this.stock;
        }
      case "brand":
        {
          return this.brand;
        }
      case "category":
        {
          return this.category;
        }
      default:
        {
          return this.id;
        }
    }
  }
}
