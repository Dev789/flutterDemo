import 'package:flutter/cupertino.dart';
import 'package:flutterbase/modules/all_category/view/all_category_screen.dart';
import 'package:flutterbase/modules/core/utils/common_import.dart';
import 'package:flutterbase/modules/home/view/home_screen.dart';
import 'package:flutterbase/modules/notifications/view/notifications_screen.dart';

import '../../rewards_and_coupons/view/rewards_and_copouns_screen.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key, required this.notificationCount}) : super(key: key);

  final int notificationCount;
  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          ListTile(
            title: Text(
              'Home',
              style: getTextStyle(Theme.of(context).primaryTextTheme.headline1!,
                  Dimens.margin16, FontWeight.normal),
            ),
            leading: Image.asset(
              'images/drawer/icon_drawer_home.png',
              height: 30,
              width: 30,
            ),
            onTap: () {
              //Navigator.pop(context);
              Navigator.pushReplacementNamed(context, AppRoutes.routesHome);
            },
          ),
          ListTile(
            title: Text(
              'All Category',
              style: getTextStyle(Theme.of(context).primaryTextTheme.headline1!,
                  Dimens.margin16, FontWeight.normal),
            ),
            leading: Image.asset(
              'images/drawer/icon_drawer_allcategory.png',
              height: 30,
              width: 30,
            ),
            onTap: () {
              //Navigator.pop(context);

              Navigator.pushReplacementNamed(
                  context, AppRoutes.routesNotification);
            },
          ),
          ListTile(
            title: Text(
              'My Order',
              style: getTextStyle(Theme.of(context).primaryTextTheme.headline1!,
                  Dimens.margin16, FontWeight.normal),
            ),
            leading: Image.asset(
              'images/drawer/icon_drawer_myorder.png',
              height: 30,
              width: 30,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text(
              'My Wishlist',
              style: getTextStyle(Theme.of(context).primaryTextTheme.headline1!,
                  Dimens.margin16, FontWeight.normal),
            ),
            leading: Image.asset(
              'images/drawer/icon_drawer_mywishlist.png',
              height: 30,
              width: 30,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text(
              'My Profile',
              style: getTextStyle(Theme.of(context).primaryTextTheme.headline1!,
                  Dimens.margin16, FontWeight.normal),
            ),
            leading: Image.asset(
              'images/drawer/icon_drawer_myprofile.png',
              height: 30,
              width: 30,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text(
              'Notification',
              style: getTextStyle(Theme.of(context).primaryTextTheme.headline1!,
                  Dimens.margin16, FontWeight.normal),
            ),
            leading: Image.asset(
              'images/drawer/icon_drawer_notification.png',
              height: 30,
              width: 30,
            ),
            trailing: Container(
              height: 20,
              width: 20,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Text(
                '${widget.notificationCount}',
                style: getTextStyle(
                    Theme.of(context).primaryTextTheme.headline1!,
                    Dimens.margin16,
                    FontWeight.normal),
              ),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text(
              'Rewards & Coupons',
              style: getTextStyle(Theme.of(context).primaryTextTheme.headline1!,
                  Dimens.margin16, FontWeight.normal),
            ),
            leading: Image.asset(
              'images/drawer/icon_drawer_rewards.png',
              height: 30,
              width: 30,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text(
              'News & Blog',
              style: getTextStyle(Theme.of(context).primaryTextTheme.headline1!,
                  Dimens.margin16, FontWeight.normal),
            ),
            leading: Image.asset(
              'images/drawer/icon_drawer_news.png',
              height: 30,
              width: 30,
            ),
            onTap: () {
              Navigator.pop(context);
              //Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPassWordScreen()));
            },
          ),
          ListTile(
            title: Text(
              'Settings',
              style: getTextStyle(Theme.of(context).primaryTextTheme.headline1!,
                  Dimens.margin16, FontWeight.normal),
            ),
            leading: Image.asset(
              'images/drawer/icon_drawer_setting.png',
              height: 30,
              width: 30,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}

class DrawerItem {
  String title;
  Image icon;
  DrawerItem(this.title, this.icon);
}

class SideDrawer extends StatefulWidget {
  //const SideDrawer({Key? key}) : super(key: key);

  final drawerItems = [
    DrawerItem(
      "Home",
      Image.asset(
        'images/drawer/icon_drawer_home.png',
        height: 30,
        width: 30,
      ),
    ),
    DrawerItem(
      "Music",
      Image.asset(
        'images/drawer/icon_drawer_home.png',
        height: 30,
        width: 30,
      ),
    ),
    DrawerItem(
      "Places",
      Image.asset(
        'images/drawer/icon_drawer_home.png',
        height: 30,
        width: 30,
      ),
    )
  ];

  SideDrawer({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SideDrawerState();
  }
}

class _SideDrawerState extends State<SideDrawer> {
  int _selectedDrawerIndex = 0;
  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return const HomeScreen();
      case 1:
        return const Text("Second");
      case 2:
        return const Text("Third");
      default:
        return const Text("Error");
    }
  }

  _onSelectItem(int index) {
    setState(() => _selectedDrawerIndex = index);
    Navigator.of(context).pop(); // close the drawer
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> drawerOptions = [];
    for (var i = 0; i < widget.drawerItems.length; i++) {
      var d = widget.drawerItems[i];
      drawerOptions.add(ListTile(
        leading: d.icon,
        title: Text(d.title),
        selected: i == _selectedDrawerIndex,
        trailing: _selectedDrawerIndex == 5
            ? const Icon(
                Icons.notification_add_rounded,
                size: 30,
              )
            : const Icon(
                Icons.notification_add_rounded,
                size: 0,
              ),
        onTap: () => _onSelectItem(i),
      ));
    }
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: <Widget>[Column(children: drawerOptions)],
        ),
      ),
      body: _getDrawerItemWidget(_selectedDrawerIndex),
    );
  }
}

/*
class DrawerItem {
  String title;
  IconData icon;

  DrawerItem(this.title, this.icon);
}

class HomePage extends StatefulWidget {
  final drawerItems = [
     DrawerItem("Sales", Icons.shopping_basket),
     DrawerItem("Items", Icons.category),
     DrawerItem("Setting", Icons.settings)
  ];

  @override
  State<StatefulWidget> createState() {
    return _HomepageState();
  }
}

class _HomepageState extends State<HomePage> with TickerProviderStateMixin {
  int _selectedDrawerIndex = 0;

  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return const HomeScreen();
      case 1:
        return const Text("Second Page");

      default:
        return const Text("Error");
    }
  }

  _onSelectItem(int index) {
    setState(() => _selectedDrawerIndex = index);
    Navigator.of(context).pop(); // close the drawer
  }

  @override
  Widget build(BuildContext context) {
    var drawerOptions = <Widget>[];
    for (var i = 0; i < widget.drawerItems.length; i++) {
      var d = widget.drawerItems[i];
      drawerOptions.add( ListTile(
        leading:  Icon(d.icon),
        title:  Text(d.title),
        selected: i == _selectedDrawerIndex,
        onTap: () => _onSelectItem(i),
      ));
    }

    return  Scaffold(
      drawer:  Drawer(
        child:  Column(
          children: <Widget>[
             Column(children: drawerOptions)
          ],
        ),
      ),
      body: _getDrawerItemWidget(_selectedDrawerIndex),
    );
  }
}
*/

class DrawerItem1 {
  String title;
  Image icon;
  DrawerItem1(this.title, this.icon);
}

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  final drawerItems = [
    DrawerItem(
      getTranslate(APPStrings.drawerHome)!,
      Image.asset(
        APPImages.iconDrawerHome,
        height: 30,
        width: 30,
      ),
    ),
    DrawerItem(
      getTranslate(APPStrings.drawerAllCategory)!,
      Image.asset(
        APPImages.iconDrawerAllcategory,
        height: 30,
        width: 30,
      ),
    ),
    DrawerItem(
      getTranslate(APPStrings.drawerMyOrder)!,
      Image.asset(
        APPImages.iconDrawerMyorder,
        height: 30,
        width: 30,
      ),
    ),
    DrawerItem(
      getTranslate(APPStrings.drawerMyWishList)!,
      Image.asset(
        APPImages.iconDrawerMywishlist,
        height: 30,
        width: 30,
      ),
    ),
    DrawerItem(
      getTranslate(APPStrings.drawerMyProfile)!,
      Image.asset(
        APPImages.iconDrawerMyprofile,
        height: 30,
        width: 30,
      ),
    ),
    DrawerItem(
      getTranslate(APPStrings.drawerNotifications)!,
      Image.asset(
        APPImages.iconDrawerNotification,
        height: 30,
        width: 30,
      ),
    ),
    DrawerItem(
      getTranslate(APPStrings.drawerRewards)!,
      Image.asset(
        APPImages.iconDrawerRewards,
        height: 30,
        width: 30,
      ),
    ),
    DrawerItem(
      getTranslate(APPStrings.drawerNews)!,
      Image.asset(
        APPImages.iconDrawerNews,
        height: 30,
        width: 30,
      ),
    ),
    DrawerItem(
      getTranslate(APPStrings.drawerSettings)!,
      Image.asset(
        APPImages.iconDrawerSetting,
        height: 30,
        width: 30,
      ),
    ),
  ];
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedDrawerIndex = 0;
  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return const HomeScreen();
      case 1:
        return const AllCategoryListScreen();
      case 2:
        return const Text("My Order Page");
      case 3:
        return const Text("My Wishlist Page");
      case 4:
        return const Text("My Profile Page");
      case 5:
        return const NotificationListScreen();
      case 6:
        return const RewardsAndCouponsScreen();
      case 7:
        return const Text("News & Blog Page");
      case 8:
        return const Text("Settings Page");
      default:
        return const Text("Error");
    }
  }

  _onSelectItem(int index) {
    setState(() => _selectedDrawerIndex = index);
    Navigator.of(context).pop(); // close the drawer
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> drawerOptions = [];
    for (var i = 0; i < widget.drawerItems.length; i++) {
      var d = widget.drawerItems[i];
      drawerOptions.add(ListTile(
        leading: d.icon,
        title: Text(
          d.title,
          style: getTextStyle(Theme.of(context).primaryTextTheme.headline2!,
              Dimens.margin16, FontWeight.normal),
        ),
        selected: i == _selectedDrawerIndex,
        trailing: i == 5 ? notificationCount() : null,
        onTap: () => _onSelectItem(i),
      ));
    }

    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.colorCyanSky,
          //leading: const Icon(Icons.menu),
          title: Text(
            widget.drawerItems[_selectedDrawerIndex].title,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
          ),
          actions: [
            _selectedDrawerIndex == 0
                ? Container(
                    padding: const EdgeInsets.only(
                        left: 8, right: 8, top: 5, bottom: 5),
                    margin: const EdgeInsets.all(12),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    //height: 20,
                    child: Center(
                      child: Row(
                        children: const [
                          Icon(
                            Icons.percent,
                            color: Colors.red,
                            size: 15,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Deal',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                  )
                : const SizedBox(),
            Container(
                margin: const EdgeInsets.only(right: 10),
                child: const Icon(CupertinoIcons.cart,
                    color: Colors.white, size: 25))
          ]),
      body: _getDrawerItemWidget(_selectedDrawerIndex),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: SafeArea(
            top: true, bottom: true, child: Column(children: drawerOptions)),
      ),
    );
  }

  Widget notificationCount() {
    return Container(
      height: 20,
      width: 20,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text(
        '0',
        style: getTextStyle(Theme.of(context).primaryTextTheme.headline4!,
            Dimens.margin14, FontWeight.normal),
      ),
    );
  }

  /*
  Widget drawerItemList(){
    return  ListView(
      padding: EdgeInsets.zero,
      children: [
        ListTile(
          title: Text('Home',style: getTextStyle(Theme.of(context).primaryTextTheme.headline1!, Dimens.margin16, FontWeight.normal),),
          leading: Image.asset(APPImages.iconDrawerHome,
            height: 30,
            width: 30,
          ),
          onTap: (){
            Navigator.pop(context);
            setState(() {
              _selectedDrawerIndex = 0;
            });
          },
        ),
        ListTile(
          title: Text('All Category',style: getTextStyle(Theme.of(context).primaryTextTheme.headline1!, Dimens.margin16, FontWeight.normal),),
          leading: Image.asset(APPImages.iconDrawerAllcategory,
            height: 30,
            width: 30,
          ),
          onTap: (){
            Navigator.pop(context);
            setState(() {
              _selectedDrawerIndex = 1;
            });

            //Navigator.pushReplacementNamed(context, AppRoutes.routesNotification);
          },
        ),
        ListTile(
          title: Text('My Order',style: getTextStyle(Theme.of(context).primaryTextTheme.headline1!, Dimens.margin16, FontWeight.normal),),
          leading: Image.asset(APPImages.iconDrawerMyorder,
            height: 30,
            width: 30,
          ),
          onTap: (){
            Navigator.pop(context);
            setState(() {
              _selectedDrawerIndex = 2;
            });
          },
        ),
        ListTile(
          title: Text('My Wishlist',style: getTextStyle(Theme.of(context).primaryTextTheme.headline1!, Dimens.margin16, FontWeight.normal),),
          leading: Image.asset(APPImages.iconDrawerMywishlist,
            height: 30,
            width: 30,
          ),
          onTap: (){
            Navigator.pop(context);
            setState(() {
              _selectedDrawerIndex = 3;
            });
          },
        ),
        ListTile(
          title: Text('My Profile',style: getTextStyle(Theme.of(context).primaryTextTheme.headline1!, Dimens.margin16, FontWeight.normal),),
          leading: Image.asset(APPImages.iconDrawerMyprofile,
            height: 30,
            width: 30,
          ),
          onTap: (){
            Navigator.pop(context);
            setState(() {
              _selectedDrawerIndex = 4;
            });
          },
        ),
        ListTile(
          title: Text('Notification',style: getTextStyle(Theme.of(context).primaryTextTheme.headline1!, Dimens.margin16, FontWeight.normal),),
          leading: Image.asset(APPImages.iconDrawerNotification,
            height: 30,
            width: 30,
          ),
          trailing: Container(
            height: 20,
            width: 20,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(15),
            ),
            child:  Text(
              '0',style: getTextStyle(Theme.of(context).primaryTextTheme.headline1!, Dimens.margin16, FontWeight.normal),),
          ),
          onTap: (){
            Navigator.pop(context);
            setState(() {
              _selectedDrawerIndex = 5;
            });
          },
        ),
        ListTile(
          title: Text('Rewards & Coupons',style: getTextStyle(Theme.of(context).primaryTextTheme.headline1!, Dimens.margin16, FontWeight.normal),),
          leading: Image.asset(APPImages.iconDrawerRewards,
            height: 30,
            width: 30,
          ),
          onTap: (){
            Navigator.pop(context);
            setState(() {
              _selectedDrawerIndex = 6;
            });
          },
        ),
        ListTile(
          title: Text('News & Blog',style: getTextStyle(Theme.of(context).primaryTextTheme.headline1!, Dimens.margin16, FontWeight.normal),),
          leading: Image.asset(APPImages.iconDrawerNews,
            height: 30,
            width: 30,
          ),
          onTap: (){
            Navigator.pop(context);
            setState(() {
              _selectedDrawerIndex = 7;
            });
            //Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPassWordScreen()));
          },
        ),
        ListTile(
          title: Text('Settings',style: getTextStyle(Theme.of(context).primaryTextTheme.headline1!, Dimens.margin16, FontWeight.normal),),
          leading: Image.asset(APPImages.iconDrawerSetting,
            height: 30,
            width: 30,
          ),
          onTap: (){
            Navigator.pop(context);
            setState(() {
              _selectedDrawerIndex = 8;
            });
          },
        ),
      ],
    );
  }

   */
}
