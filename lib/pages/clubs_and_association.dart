import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:app/constants/colors.dart';

const url = '';

const images = [
  'https://content3.jdmagicbox.com/comp/chennai/i8/044pxx44.xx44.191205160421.k1i8/catalogue/zodiac-recreation-club-jafferkhanpet-chennai-restaurants-7v3ef32i2q.jpg',
  'https://images.unsplash.com/photo-1545396872-a6682fc218ab?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
  'https://images.unsplash.com/photo-1525640932057-b18561aca9b5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
  'https://images.unsplash.com/photo-1526399232581-2ab5608b6336?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60'
];

class ClubsAndAssociationsPage extends StatefulWidget {
  const ClubsAndAssociationsPage({Key? key}) : super(key: key);

  @override
  State<ClubsAndAssociationsPage> createState() => _ClubsAndAssociationsPage();
}

class _ClubsAndAssociationsPage extends State<ClubsAndAssociationsPage> {
  Widget appBarTitle = const Text('Clubs And Associations');
  Icon searchIcon = const Icon(Icons.search);

  void onSearchPress() {
    setState(() {
      if (searchIcon.icon == Icons.search) {
        searchIcon = const Icon(Icons.close);
        appBarTitle = const TextField(
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search),
            hintText: 'Search...',
          ),
        );
      } else {
        searchIcon = const Icon(Icons.search);
        appBarTitle = const Text('Clubs And Associations');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appBarTitle,
        backgroundColor: ColorConstants.red,
        actions: [
          IconButton(
            icon: searchIcon,
            onPressed: onSearchPress,
          )
        ],
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: FittedBox(
              child: Material(
                color: Colors.white,
                elevation: 14.0,
                borderRadius: BorderRadius.circular(24.0),
                shadowColor: const Color(0x802196F3),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: myDetailsContainer1(),
                    ),
                    SizedBox(
                      width: 250,
                      height: 200,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(24.0),
                        child: Image(
                          fit: BoxFit.contain,
                          alignment: Alignment.topRight,
                          image: NetworkImage(images[0]),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: FittedBox(
              child: Material(
                color: Colors.white,
                elevation: 14.0,
                borderRadius: BorderRadius.circular(24.0),
                shadowColor: const Color(0x802196F3),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: myDetailsContainer4(),
                    ),
                    SizedBox(
                      width: 250,
                      height: 180,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(24.0),
                        child: Image(
                          fit: BoxFit.contain,
                          alignment: Alignment.topRight,
                          image: NetworkImage(images[1]),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: FittedBox(
              child: Material(
                color: Colors.white,
                elevation: 14.0,
                borderRadius: BorderRadius.circular(24.0),
                shadowColor: const Color(0x802196F3),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: myDetailsContainer3(),
                    ),
                    SizedBox(
                      width: 250,
                      height: 180,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(24.0),
                        child: Image(
                          fit: BoxFit.contain,
                          alignment: Alignment.topRight,
                          image: NetworkImage(images[2]),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: FittedBox(
              child: Material(
                color: Colors.white,
                elevation: 14.0,
                borderRadius: BorderRadius.circular(24.0),
                shadowColor: const Color(0x802196F3),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: myDetailsContainer2(),
                    ),
                    SizedBox(
                      width: 250,
                      height: 180,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(24.0),
                        child: Image(
                          fit: BoxFit.contain,
                          alignment: Alignment.topLeft,
                          image: NetworkImage(images[3]),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget myDetailsContainer1() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Text(
            "BENZE ZODIAC RECREATION CLUB",
            style: TextStyle(
                color: Color.fromARGB(255, 16, 12, 12),
                fontSize: 24.0,
                fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const <Widget>[
              Text(
                "4.3",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 18.0,
                ),
              ),
              Icon(
                FontAwesomeIcons.solidStar,
                color: Colors.amber,
                size: 15.0,
              ),
              Icon(
                FontAwesomeIcons.solidStar,
                color: Colors.amber,
                size: 15.0,
              ),
              Icon(
                FontAwesomeIcons.solidStar,
                color: Colors.amber,
                size: 15.0,
              ),
              Icon(
                FontAwesomeIcons.solidStar,
                color: Colors.amber,
                size: 15.0,
              ),
              Icon(
                FontAwesomeIcons.solidStarHalf,
                color: Colors.amber,
                size: 15.0,
              ),
              Text(
                "(321)",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 18.0,
                ),
              ),
            ],
          ),
        ),
        const Text(
          "Our goal is to offer all esteemed members a comfortable environment where one can relax ,Socialize , Have fun, Entertain and Enjoy",
          style: TextStyle(
            color: Colors.black54,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget myDetailsContainer2() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Text(
            "Chocolate Haven",
            style: TextStyle(
                color: Color(0xffe6020a),
                fontSize: 24.0,
                fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Row(
            children: const <Widget>[
              Text(
                "4.3",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 18.0,
                ),
              ),
              Icon(
                FontAwesomeIcons.solidStar,
                color: Colors.amber,
                size: 15.0,
              ),
              Icon(
                FontAwesomeIcons.solidStar,
                color: Colors.amber,
                size: 15.0,
              ),
              Icon(
                FontAwesomeIcons.solidStar,
                color: Colors.amber,
                size: 15.0,
              ),
              Icon(
                FontAwesomeIcons.solidStar,
                color: Colors.amber,
                size: 15.0,
              ),
              Icon(
                FontAwesomeIcons.solidStarHalf,
                color: Colors.amber,
                size: 15.0,
              ),
              Text(
                "(75) \u00B7 1.2 mi",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 18.0,
                ),
              ),
            ],
          ),
        ),
        const Text(
          "Pastries \u00B7 Phoenix,AZ",
          style: TextStyle(
            color: Colors.black54,
            fontSize: 18.0,
          ),
        ),
      ],
    );
  }

  Widget myDetailsContainer3() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Text(
            "Cake Walk",
            style: TextStyle(
                color: Color(0xffe6020a),
                fontSize: 24.0,
                fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Row(
            children: const <Widget>[
              Text(
                "4.0",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 18.0,
                ),
              ),
              Icon(
                FontAwesomeIcons.solidStar,
                color: Colors.amber,
                size: 15.0,
              ),
              Icon(
                FontAwesomeIcons.solidStar,
                color: Colors.amber,
                size: 15.0,
              ),
              Icon(
                FontAwesomeIcons.solidStar,
                color: Colors.amber,
                size: 15.0,
              ),
              Icon(
                FontAwesomeIcons.solidStar,
                color: Colors.amber,
                size: 15.0,
              ),
              Text(
                "(100) \u00B7 2.0 mi",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 18.0,
                ),
              ),
            ],
          ),
        ),
        const Text(
          "Pastries \u00B7 Phoenix,AZ",
          style: TextStyle(
            color: Colors.black54,
            fontSize: 18.0,
          ),
        ),
      ],
    );
  }

  Widget myDetailsContainer4() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Text(
            "Chocolate Bar",
            style: TextStyle(
                color: Color(0xffe6020a),
                fontSize: 24.0,
                fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Row(
            children: const <Widget>[
              Text(
                "3.5",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 18.0,
                ),
              ),
              Icon(
                FontAwesomeIcons.solidStar,
                color: Colors.amber,
                size: 15.0,
              ),
              Icon(
                FontAwesomeIcons.solidStar,
                color: Colors.amber,
                size: 15.0,
              ),
              Icon(
                FontAwesomeIcons.solidStar,
                color: Colors.amber,
                size: 15.0,
              ),
              Icon(
                FontAwesomeIcons.solidStarHalf,
                color: Colors.amber,
                size: 15.0,
              ),
              Text(
                "(50) \u00B7 2.5 mi",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 18.0,
                ),
              ),
            ],
          ),
        ),
        const Text(
          "Pastries \u00B7 Phoenix,AZ",
          style: TextStyle(
            color: Colors.black54,
            fontSize: 18.0,
          ),
        ),
      ],
    );
  }
}
