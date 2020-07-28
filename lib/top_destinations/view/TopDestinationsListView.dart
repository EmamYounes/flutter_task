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

  Widget buildItem(AsyncSnapshot<List<DestinationModel>> snapshot) {
    return Container(
      height: 270,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: snapshot.data.length,
        itemBuilder: (BuildContext context, int index) {
          DestinationModel model = snapshot.data[index];
          return buildDestinationCardView(model);
        },
      ),
    );
  }

  Container buildImageContainer(DestinationModel model) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 20,
          ),
          Stack(
            children: <Widget>[
              buildImage(model),
              buildTextOnImage(model),
            ],
          ),
        ],
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
        height: 170,
        width: 170,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget buildDestinationCardView(DestinationModel destinationModel) {
    return Stack(
      children: <Widget>[
        Positioned(
          bottom: 0,
          child: Container(
            margin: EdgeInsets.all(20),
            height: 100,
            width: 200,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Spacer(),
                  Text(
                    destinationModel.activities.length.toString() +
                        ' activities',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    destinationModel.description,
                    style: TextStyle(
                        fontSize: 12,
                        color: Color(0xFFBDBDBD),
                        fontWeight: FontWeight.normal),
                  )
                ],
              ),
            ),
          ),
        ),
        buildImageContainer(destinationModel),
      ],
    );
  }
}
