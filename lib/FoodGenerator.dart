import 'package:test_bloc_flutter/model/food.dart';

class FoodGenerator {
  static List<Food> generateDummyFoods() {
    return [
      Food(
        id: "1",
        name: "Seswaa",
        thumbnailUrl:
        "https://picsum.photos/200",
        price: "P18.00",
      ),
      Food(
        id: "2",
        name: "Bogobe jwa Lerotse",
        thumbnailUrl:
        "https://picsum.photos/400",
        price: "P20.00",
      ),
      Food(
        id: "3",
        name: "Morogo wa Dinawa",
        thumbnailUrl:
        "https://picsum.photos/600",
        price: "P25.00",
      ),
      Food(
        id: "4",
        name: "Chakalaka",
        thumbnailUrl:
        "https://picsum.photos/800",
        price: "P18.00",
      ),
      Food(
        id: "5",
        name: "Nama ya Kgomo",
        thumbnailUrl:
        "https://picsum.photos/600",
        price: "P17.00",
      ),
    ];
  }
}