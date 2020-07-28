import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/top_destinations/bloc/TopDestinationsListBloc.dart';
import 'package:flutter_task/top_destinations/model/DestinationModel.dart';

class TopDestinationsListView extends StatefulWidget {
  @override
  _TopDestinationsListState createState() => _TopDestinationsListState();
}

class _TopDestinationsListState extends State<TopDestinationsListView> {
  TopDestinationsListBloc _topDestinationsListBloc;

  @override
  void initState() {
    super.initState();
    _topDestinationsListBloc = TopDestinationsListBloc();
    _topDestinationsListBloc.getTopDestinationsList();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<DestinationModel>>(
        stream: _topDestinationsListBloc.topListSubject.stream,
        builder: (context, snapshot) {
          return snapshot.hasData
              ? Container(
                  height: 150,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      DestinationModel model = snapshot.data[index];
                      return Container(
                        margin: EdgeInsets.all(10),
                        child: ClipRRect(
                          borderRadius: new BorderRadius.circular(10.0),
                          child: Image(
                            image: AssetImage(
                              model.imageUrl,
                            ),
                            width: 150,
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
                )
              : Center(child: CircularProgressIndicator());
        });
  }
}
