import 'package:shopping_app/features/home/models/store.dart';

class StoresDB {
  static List<StoreModel> stores = [
    StoreModel(
      name: 'Papa John\'s',
      address: 'Nasr City, Egypt',
      imageUrl: 'assets/images/stores/papaJohns.jpeg',
      latitude: 30.0511,
      longitude: 31.3656,
    ),
    StoreModel(
      name: 'Max',
      address: 'Dokki, Egypt',
      imageUrl: 'assets/images/stores/max.jpg',
      latitude: 30.039452,
      longitude: 31.202534,
    ),
    StoreModel(
      name: 'Defacto',
      address: '6th of October City, Egypt',
      imageUrl: 'assets/images/stores/defacto.jpg',
      latitude: 29.9744,
      longitude: 30.9182,
    ),
    StoreModel(
      name: 'LC Waikiki',
      address: 'Al Haram, Egypt',
      imageUrl: 'assets/images/stores/lc.jpg',
      latitude: 30.0107,
      longitude: 31.0879,
    ),
    StoreModel(
      name: 'MCdonald\'s',
      address: 'Dokki, Egypt',
      imageUrl: 'assets/images/stores/mac.jpg',
      isFavorite: false,
      latitude: 30.0444,
      longitude: 31.2357,
    ),
    StoreModel(
      name: 'Buffalo Burger',
      address: 'Zamalek, Egypt',
      imageUrl: 'assets/images/stores/bufflo.jpg',
      latitude: 30.0665,
      longitude: 31.2168,
    ),
    StoreModel(
      name: 'Zara',
      address: '6th of October City, Egypt',
      imageUrl: 'assets/images/stores/zara.jpg',
      latitude: 29.9876,
      longitude: 30.9547,
    ),
    StoreModel(
      name: 'Dejavu',
      address: 'Nasr City, Egypt',
      imageUrl: 'assets/images/stores/dejavu.jpg',
      latitude: 30.0626,
      longitude: 31.3364,
    ),
  ];
}
