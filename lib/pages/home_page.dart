import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'my_feed_page.dart';
import 'my_likes_page.dart';
import 'my_profile_page.dart';
import 'my_search_page.dart';
import 'my_upload_page.dart';

class Home extends StatefulWidget {
  const Home({Key key, this.title}) : super(key: key);

  static final String id = 'home';
  final String title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  PageController _pageController;
  int _currentTap = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          MyFeed(pageController: _pageController),
          MySearch(title: 'search'),
          MyUpload(pageController: _pageController,),
          MyLikes(title: 'likes'),
          MyProfile(title: 'profile'),
        ],
        onPageChanged: (int index){
          setState(() {
            _currentTap = index;
          });
        },
      ),
      bottomNavigationBar: CupertinoTabBar(
        onTap: (int index){
          setState(() {
            _currentTap = index;
            _pageController.animateToPage(
              index, duration: Duration(milliseconds: 200), curve: Curves.easeIn
            );
          });
        },
        currentIndex: _currentTap,
        activeColor: Color.fromRGBO(245, 96, 64, 1),
        items: [
          BottomNavigationBarItem(
            icon: Icon(
                Icons.home,
              size: 32,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              size: 32,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_box,
              size: 32,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
              size: 32,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle,
              size: 32,
            ),
          ),
        ],
      ),
    );
  }
}
