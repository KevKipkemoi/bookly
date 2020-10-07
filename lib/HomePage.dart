import 'package:bookly/DocInfoPage.dart';
import 'package:bookly/colorScheme.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirstPage(),
      routes: {
        "/DocInfoPage": (context) => DocInfoPage(),
      },
      theme: ThemeData(
        fontFamily: 'avenir',
      ),
    );
  }
}

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Stack(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: CustomPaint(
              painter: PathPainter(),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  leading: Icon(
                    Icons.menu,
                    color: Colors.black,
                    size: 30,
                  ),
                  actions: <Widget>[
                    Container(
                      height: 75,
                      width: 75,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: [getStartedColorStart, getStartedColorEnd],
                          stops: [0, 1],
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "C",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: 14, right: 10, top: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Select a Doctor or Category",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w700
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 120,
                        margin: EdgeInsets.only(top: 10),
                        child: ListView(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            categoryContainer("ct1.png", "Orthopedic"),
                            categoryContainer("ct2.png", "Dietician"),
                            categoryContainer("ct3.png", "Physician"),
                            categoryContainer("ct4.png", "Paralysis"),
                            categoryContainer("ct5.png", "Cardiology"),
                            categoryContainer("ct6.png", "MRI"),
                            categoryContainer("ct7.png", "CT-Scan"),
                            categoryContainer("ct8.png", "Gynaecology"),
                          ],
                        ),
                      ),
                      Text(
                        "Chief Doctors",
                        style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
                      ),
                      SizedBox(height: 20,),
                      Container(
                        height: 400,
                        child: SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          child: Column(
                            children: <Widget>[
                              docWidget("doc1.png", "Susan Laika"),
                              docWidget("doc2.png", "Rashid Lango"),
                              docWidget("doc3.png", "Lulu Faiz"),
                              docWidget("doc1.png", "Susan Cherono"),
                              docWidget("doc2.png", "Kamau Njoroge"),
                              docWidget("doc2.png", "Deng Malek"),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container categoryContainer(String imgName, String title) {
    return Container(
      width: 130,
      child: Column(
        children: <Widget>[
          Image.asset('assets/images/category/$imgName'),
          Text(
            "$title",
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 17,
            ),
          )
        ],
      ),
    );
  }

  Container docWidget(String imgName, String docName) {
    return Container(
      child: InkWell(
        child: Container(
          margin: EdgeInsets.only(bottom: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            color: docContentBgColor,
          ),
          child: Container(
            padding: EdgeInsets.all(7),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Container(
                  width: 70,
                  height: 90,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/docProfile/$imgName"),
                      fit: BoxFit.cover
                    )
                  ),
                ),
                SizedBox(width: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Dr. $docName",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 5,),
                    Container(
                      width: 250,
                      height: 50,
                      child: Text(
                        "A brief description of the doctor added here",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                        overflow: TextOverflow.clip,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        onTap: docInfo,
      ),
    );
  }

  void docInfo() {
    Navigator.pushNamed(context, '/DocInfoPage');
  }
}

class PathPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = new Paint();
    paint.color = path2Color;

    Path path = new Path();
    path.moveTo(0, 0);
    path.lineTo(size.width * 0.3, 0);
    path.quadraticBezierTo(
        size.width * 0.5,
        size.height * 0.03,
        size.width * 0.42,
        size.height * 0.17
    );
    path.quadraticBezierTo(
        size.width * 0.35,
        size.height * 0.32, 0,
        size.height * 0.29
    );
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}