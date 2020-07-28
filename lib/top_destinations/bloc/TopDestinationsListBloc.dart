import 'package:flutter_task/top_destinations/model/DestinationModel.dart';
import 'package:flutter_task/top_destinations/repo/TopDestinationsListRepo.dart';
import 'package:rxdart/rxdart.dart';

class TopDestinationsListBloc {
  BehaviorSubject<List<DestinationModel>> topListSubject =
      BehaviorSubject.seeded([]);

  getTopDestinationsList() {
    topListSubject.sink.add(TopDestinationsListRepo().getTopDestinationsList());
  }

  void dispose() {
    topListSubject.close();
  }
}
