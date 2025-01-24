import 'dart:convert';

class CategoryModel {
    String slug;
    String name;
    String url;

    CategoryModel({
        required this.slug,
        required this.name,
        required this.url,
    });

    factory CategoryModel.fromRawJson(String str) => CategoryModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        slug: json["slug"],
        name: json["name"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "slug": slug,
        "name": name,
        "url": url,
    };
}
