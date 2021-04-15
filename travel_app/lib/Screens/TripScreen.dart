import 'package:flutter/material.dart';
import 'package:travel_app/globals.dart';

class TripScreen extends StatefulWidget {
  final Activities activity;
  TripScreen({Key key, this.activity}) : super(key: key);

  @override
  _TripScreenState createState() => _TripScreenState();
}

class _TripScreenState extends State<TripScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              alignment: Alignment.center,
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                Icons.navigate_before,
                size: 30,
                color: Colors.black,
              ),
            ),
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Icon(
                  Icons.more_vert,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        top: false,
        bottom: true,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 400,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: ExactAssetImage(widget.activity.photo),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40))),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.activity.name,
                          style: TextStyle(
                              color: darkblue,
                              fontSize: 24,
                              fontWeight: FontWeight.bold)),
                      Row(
                        children: [
                          Icon(
                            Icons.place_outlined,
                            color: Colors.blue,
                          ),
                          Text(widget.activity.location,
                              style: TextStyle(
                                  color: darkblue,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.star_border_outlined, color: Colors.orange),
                      Text(" 2.4k",
                          style: TextStyle(
                              color: darkblue, fontWeight: FontWeight.bold))
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text("About",
                  style: TextStyle(
                      fontSize: 18,
                      color: darkblue,
                      fontWeight: FontWeight.w600)),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                  "Bali is an Indonesian island known for its forested volcanic mountains, iconic rice paddies, beaches and coral reefs. The island is home to religious sites such as cliffside Uluwatu Temple. To the south, the beachside city of Kuta has lively bars, while Seminyak, Sanur and Nusa Dua are popular resort towns.",
                  style: TextStyle(color: Colors.grey.withOpacity(0.8))),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text("Image",
                  style: TextStyle(
                      fontSize: 18,
                      color: darkblue,
                      fontWeight: FontWeight.w600)),
            ),
            Container(
              height: 60,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => ImagesWidget(widget: widget),
                itemCount: 10,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          blurRadius: 10,
                          offset: Offset(0, 3),
                        )
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.favorite_outline,
                        color: Colors.red,
                      ),
                    ),
                  ),
                  Container(
                    width: 260,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          blurRadius: 10,
                          offset: Offset(0, 3),
                        )
                      ],
                    ),
                    child: Center(
                      child: Text("Book Now",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ImagesWidget extends StatelessWidget {
  const ImagesWidget({
    Key key,
    @required this.widget,
  }) : super(key: key);

  final TripScreen widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16),
      width: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          image: DecorationImage(
              image: ExactAssetImage(widget.activity.photo),
              fit: BoxFit.cover)),
    );
  }
}
