import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/exclusive_hotel/bloc/ExclusiveHotelListBloc.dart';
import 'package:flutter_task/exclusive_hotel/model/HotelModel.dart';

class ExclusiveHotelListView extends StatefulWidget {
  @override
  _ExclusiveHotelListState createState() => _ExclusiveHotelListState();
}

class _ExclusiveHotelListState extends State<ExclusiveHotelListView> {
  ExclusiveHotelListBloc _exclusiveHotelListBloc;

  @override
  void initState() {
    super.initState();
    _exclusiveHotelListBloc = ExclusiveHotelListBloc();
    _exclusiveHotelListBloc.getTopDestinationsList();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Hotel>>(
        stream: _exclusiveHotelListBloc.hotelListSubject.stream,
        builder: (context, snapshot) {
          return snapshot.hasData
              ? buildItem(snapshot)
              : Center(child: CircularProgressIndicator());
        });
  }

  Widget buildItem(AsyncSnapshot<List<Hotel>> snapshot) {
    return Container(
      height: 270,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: snapshot.data.length,
        itemBuilder: (BuildContext context, int index) {
          Hotel hotelModel = snapshot.data[index];
          return buildDestinationCardView(hotelModel);
        },
      ),
    );
  }

  Container buildImageContainer(Hotel hotelModel) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 20,
          ),
          Stack(
            children: <Widget>[
              buildImage(hotelModel),
            ],
          ),
        ],
      ),
    );
  }

  ClipRRect buildImage(Hotel hotelModel) {
    return ClipRRect(
      borderRadius: new BorderRadius.circular(10.0),
      child: Image(
        image: AssetImage(
          hotelModel.imageUrl,
        ),
        height: 170,
        width: 170,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget buildDestinationCardView(Hotel hotelModel) {
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
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Spacer(),
                  Text(
                    hotelModel.name,
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    hotelModel.address,
                    style: TextStyle(
                        fontSize: 12,
                        color: Color(0xFFBDBDBD),
                        fontWeight: FontWeight.normal),
                  ),
                  Text(
                    '\$' + hotelModel.price.toString() + ' / night',
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.normal),
                  )
                ],
              ),
            ),
          ),
        ),
        buildImageContainer(hotelModel),
      ],
    );
  }
}
