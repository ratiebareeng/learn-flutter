import 'package:equatable/equatable.dart';

class Food extends Equatable {
  final String id, name, thumbnailUrl, price;

  const Food(
      {required this.id,
      required this.name,
      required this.thumbnailUrl,
      required this.price});

  @override
  List<Object?> get props => [id, name, thumbnailUrl, price];
}
