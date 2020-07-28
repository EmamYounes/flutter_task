import 'package:flutter_task/exclusive_hotel/model/HotelModel.dart';
import 'package:flutter_task/exclusive_hotel/repo/ExclusiveHotelListRepo.dart';
import 'package:rxdart/rxdart.dart';

class ExclusiveHotelListBloc {
  BehaviorSubject<List<Hotel>> hotelListSubject = BehaviorSubject.seeded([]);

  getTopDestinationsList() {
    hotelListSubject.sink.add(ExclusiveHotelListRepo().getExclusiveHotelList());
  }

  void dispose() {
    hotelListSubject.close();
  }
}
