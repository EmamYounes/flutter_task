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
              ? buildItem(snapshot)
              : Center(child: CircularProgressIndicator());
        });
  }

  Container buildItem(AsyncSnapshot<List<DestinationModel>> snapshot) {
    return Container(
      height: 150,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: snapshot.data.length,
        itemBuilder: (BuildContext context, int index) {
          DestinationModel model = snapshot.data[index];
          return Container(
            margin: EdgeInsets.all(10),
            child: Stack(
              children: <Widget>[
                buildImage(model),
                buildTextOnImage(model),
              ],
            ),
          );
        },
      ),
    );
  }

  Positioned buildTextOnImage(DestinationModel model) {
    return Positioned(
      bottom: 0,
      child: Column(
        children: <Widget>[
          Text(
            model.city,
            style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.normal),
          ),
          Row(
            children: <Widget>[
              Icon(
                Icons.call_made,
                color: Colors.white70,
                size: 10,
              ),
              Text(
                model.country,
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.white70,
                    fontWeight: FontWeight.normal),
              ),
            ],
          )
        ],
      ),
    );
  }

  ClipRRect buildImage(DestinationModel model) {
    return ClipRRect(
      borderRadius: new BorderRadius.circular(10.0),
      child: Image(
        image: AssetImage(
          model.imageUrl,
        ),
        height: 150,
        width: 150,
        fit: BoxFit.cover,
      ),
    );
  }
}
