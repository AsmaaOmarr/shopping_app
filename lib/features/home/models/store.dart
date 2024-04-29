// Model for Store
class StoreModel {
  final String name;
  final String address;
  final String imageUrl;
  bool isFavorite;

  StoreModel({
    required this.name,
    required this.address,
    required this.imageUrl,
    this.isFavorite = false,
  });

  factory StoreModel.fromJson(Map<String, dynamic> json) {
    return StoreModel(
      name: json['name'],
      address: json['address'],
      imageUrl: json['imageUrl'],
      isFavorite: json['isFavorite'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'address': address,
      'imageUrl': imageUrl,
      'isFavorite': isFavorite,
    };
  }
}
