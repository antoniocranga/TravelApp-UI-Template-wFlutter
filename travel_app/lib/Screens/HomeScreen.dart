import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/globals.dart';

import '../export.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> activities = ["Beach", "Mountain", "Forest", "Desert"];
  final TextEditingController _controller = new TextEditingController();
  int _bottomNavBarIndex = 0;
  int _categoryIndex = 0;
  void onTap(int index) {
    setState(() {
      _bottomNavBarIndex = index;
    });
  }

  void onChange(int index) {
    setState(() {
      _categoryIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _bottomNavBarIndex,
        onTap: onTap,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: "Favorites"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined), label: "Profile"),
        ],
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: TopBar(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text("Let's go trip\nwith us!",
                  style: TextStyle(
                      color: darkblue,
                      fontSize: 22,
                      fontWeight: FontWeight.w600)),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: CutomTextField(controller: _controller),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("Category",
                      style: TextStyle(
                          fontSize: 18,
                          color: darkblue,
                          fontWeight: FontWeight.w600)),
                  Text("View All",
                      style: TextStyle(
                          fontSize: 14,
                          color: grey,
                          fontWeight: FontWeight.w400))
                ],
              ),
            ),
            SizedBox(
              height: 60,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: activities.length,
                itemBuilder: (context, index) {
                  return InkWell(
                      onTap: () {
                        onChange(index);
                      },
                      child: CategoryTag(
                        selected: index == _categoryIndex,
                        text: activities[index],
                      ));
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("Popular",
                      style: TextStyle(
                          fontSize: 18,
                          color: darkblue,
                          fontWeight: FontWeight.w600)),
                ],
              ),
            ),
            Container(
              height: 220,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return PopularWidget(activity: featured[index]);
                },
                itemCount: featured.length,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("Recommended",
                      style: TextStyle(
                          fontSize: 18,
                          color: darkblue,
                          fontWeight: FontWeight.w600)),
                  Text("View All",
                      style: TextStyle(
                          fontSize: 14,
                          color: grey,
                          fontWeight: FontWeight.w400))
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 16),
              height: 50,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return RecommendedWidget(
                    activity: recommended[index],
                  );
                },
                itemCount: recommended.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PopularWidget extends StatelessWidget {
  final Activities activity;
  const PopularWidget({
    this.activity,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => TripScreen(activity: this.activity)));
      },
      child: Stack(children: [
        Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.only(left: 16),
          width: 170,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
                image: ExactAssetImage(activity.photo), fit: BoxFit.cover),
          ),
        ),
        Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.only(left: 16),
          width: 170,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.black.withOpacity(0.5),
                  Colors.white.withOpacity(0)
                ]),
          ),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Text(activity.name,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 22)),
          ),
        ),
      ]),
    );
  }
}

class RecommendedWidget extends StatelessWidget {
  final Activities activity;
  const RecommendedWidget({
    this.activity,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      margin: EdgeInsets.only(left: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 10,
            offset: Offset(0, 3),
          )
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              image: DecorationImage(
                  image: ExactAssetImage(activity.photo), fit: BoxFit.cover),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(activity.name,
                  style:
                      TextStyle(color: darkblue, fontWeight: FontWeight.bold)),
              Text(activity.location,
                  style: TextStyle(color: Colors.grey.withOpacity(0.7))),
            ],
          ),
        ],
      ),
    );
  }
}

class CategoryTag extends StatelessWidget {
  final bool selected;
  final String text;
  const CategoryTag({
    this.selected,
    this.text,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16, top: 10, bottom: 10),
      width: 100,
      decoration: BoxDecoration(
        color: selected ? Colors.blue : Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            offset: Offset(0, 0),
            blurRadius: 5,
            spreadRadius: 1,
          ),
        ],
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
          child: Text(text,
              style: TextStyle(
                  color: selected ? Colors.white : darkblue,
                  fontWeight: FontWeight.w600))),
    );
  }
}

class CutomTextField extends StatelessWidget {
  const CutomTextField({
    Key key,
    @required TextEditingController controller,
  })  : _controller = controller,
        super(key: key);

  final TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        controller: _controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(Icons.search),
          labelText: "Search...",
        ),
      ),
    );
  }
}

class TopBar extends StatelessWidget {
  const TopBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 23,
          width: 23,
          child: Image.asset(
            'assets/menu.png',
            color: darkblue,
          ),
        ),
        Row(
          children: [
            Icon(
              Icons.place_outlined,
              color: darkblue,
            ),
            Text(" Bali, Indonesia",
                style: TextStyle(fontWeight: FontWeight.w600, color: darkblue)),
          ],
        ),
        CircleAvatar(
          radius: 20,
          backgroundImage: AssetImage('assets/profile.jpg'),
        )
      ],
    );
  }
}
