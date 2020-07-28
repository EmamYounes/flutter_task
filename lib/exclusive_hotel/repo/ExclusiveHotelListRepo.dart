import 'package:flutter_task/exclusive_hotel/model/HotelModel.dart';

class ExclusiveHotelListRepo {
  List<Hotel> getExclusiveHotelList() {
    return hotels;
  }
}

final List<Hotel> hotels = [
  Hotel(
    imageUrl: 'assets/hotel0.jpg',
    name: 'Hotel 0',
    address: '404 Great St',
    price: 175,
  ),
  Hotel(
    imageUrl: 'assets/hotel1.jpg',
    name: 'Hotel 1',
    address: '404 Great St',
    price: 300,
  ),
  Hotel(
    imageUrl: 'assets/hotel2.jpg',
    name: 'Hotel 2',
    address: '404 Great St',
    price: 240,
  ),
];
