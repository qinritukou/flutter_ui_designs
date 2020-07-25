import 'package:TripUI/FadeAnimation.dart';
import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    home: HomePage(),
    debugShowCheckedModeBanner: false,
  )
);


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  PageController _pageController;
  int page = 1;

  void _onScroll() {

  }

  @override
  void initState() {
    super.initState();

    _pageController = PageController(
      initialPage: 0,
    )..addListener(_onScroll);
  }

  @override
  @override
  void dispose() { 
    _pageController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: <Widget>[
          makePage(
            page: 1,
            image: 'assets/images/one.png', 
            title: 'Room1',
            description: 'Room1 Description'
          ),
          makePage(
            page: 2,
            image: 'assets/images/two.png', 
            title: 'Room2',
            description: 'Room2 Description'
          ),
          makePage(
            page: 3,
            image: 'assets/images/three.png', 
            title: 'Room3',
            description: 'Room3 Description'
          ),
          makePage(
            page: 4,
            image: 'assets/images/four.png', 
            title: 'Room4',
            description: 'Room4 Description'
          ),
        ],
      ),
    );
  }

  Widget makePage({page, image, title, description}) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.fill
        )
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomRight,
            stops: [0.3, 0.9],
            colors: [
              Colors.black.withOpacity(0.9),
              Colors.black.withOpacity(0.2),
            ]
          )
        ),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column( crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: <Widget>[
                Text(page.toString(), style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),),
                Text('/4', style: TextStyle(color: Colors.white, fontSize: 15),)
              ],
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FadeAnimation(
                    2, 
                    Text(title, style: TextStyle(color: Colors.white, fontSize: 50, fontWeight: FontWeight.bold),),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(right: 3),
                        child: Icon(Icons.star, color: Colors.yellow, size: 15,),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 3),
                        child: Icon(Icons.star, color: Colors.yellow, size: 15,),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 3),
                        child: Icon(Icons.star, color: Colors.yellow, size: 15,),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 3),
                        child: Icon(Icons.star, color: Colors.yellow, size: 15,),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 3),
                        child: Icon(Icons.star, color: Colors.white, size: 15,),
                      ),
                      Text('4.0', style: TextStyle(color: Colors.white70)),
                      Text('(2300)', style: TextStyle(color: Colors.white38, fontSize: 12),)
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 50),
                    child: Text(description, style: TextStyle(color: Colors.white.withOpacity(.7), height: 1.9, fontSize: 15),),
                  ),
                  SizedBox(height: 20,),
                  Text('READ MORE', style: TextStyle(color: Colors.white),)
                ],
              ),
            )
          ],),
        ),
      ),
    );
  }
}