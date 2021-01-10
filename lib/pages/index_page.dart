import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'home_page.dart';
import 'cart_page.dart';
import 'category_page.dart';
import 'member_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IndexPage extends StatefulWidget {
  IndexPage({Key key}) : super(key: key);

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  final List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.home),
        // ignore: deprecated_member_use
        title: Text('首页')),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.search),
        // ignore: deprecated_member_use
        title: Text('分类')),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.shopping_cart),
        // ignore: deprecated_member_use
        title: Text('购物车')),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.profile_circled),
        // ignore: deprecated_member_use
        title: Text('个人中心')),
  ];
  final List<Widget> tabBodies = [
    HomePage(),
    CategoryPage(),
    CartPage(),
    MemberPage()
  ];
  int currentIndex = 0;
  var currentPage;
  @override
  void initState() {
    currentPage = tabBodies[currentIndex];
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // ScreenUtil._instance = ScreenUtil(width: 750, height: 1334)..init(context);

    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 245, 245, 1.0),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        items: bottomTabs,
        onTap: (index) {
          setState(() {
            currentIndex = index;
            currentPage = tabBodies[currentIndex];
          });
        },
      ),
      body: IndexedStack(
        index: currentIndex,
        children: tabBodies,
      ),
    );
  }
}
