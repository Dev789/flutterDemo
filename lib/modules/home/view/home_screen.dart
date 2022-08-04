import 'dart:math';
import 'package:flutter/gestures.dart';
import 'package:flutterbase/modules/core/utils/common_import.dart';
import 'package:flutterbase/modules/home/view/popular_product_screen.dart';
import 'package:hexcolor/hexcolor.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        /*appBar: AppBar(
            elevation: 0,
            backgroundColor: AppColors.colorCyanSky,
            //leading: const Icon(Icons.menu),
            title: const Text(
              'Pharmacy',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            ),
            actions: [
              Container(
                padding:
                    const EdgeInsets.only(left: 8, right: 8, top: 5, bottom: 5),
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
              ),
              Container(
                  margin: const EdgeInsets.only(right: 10),
                  child: const Icon(CupertinoIcons.cart,
                      color: Colors.white, size: 25))
            ]),*/

        //drawer: HomePage(),
        /*const MyDrawer(

          notificationCount: 5,
        ),*/
        backgroundColor: Theme.of(context).backgroundColor,
        body: Column(
          children: [
            GestureDetector(
              onTap: () {
                debugPrint('Click search');
              },
              child: Container(
                color: AppColors.colorCyanSky,
                height: 60,
                margin: const EdgeInsets.all(0),
                child: Container(
                  margin: const EdgeInsets.only(
                      left: 16, right: 16, top: 10, bottom: 10),
                  padding: const EdgeInsets.only(left: 15),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(2)),
                  child: Row(
                    children: [
                      Icon(
                        Icons.search,
                        color: HexColor('8e8f90'),
                        size: 20,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Search...',
                        style: TextStyle(
                          color: HexColor('8e8f90'),
                          fontSize: 15,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //topGridView()
                      SizedBox(
                        height: 150,
                        child: topGridView(),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      categoryWidget(),
                      popularList(),
                      recomendProduct(),

                      /*SizedBox(child: categoryWidget(),
                      height: 250,)*/

                      SizedBox(
                        height: 210,
                        child: latestNewsAndBlog(),
                      ),
                      ourInstagramFeed(),
                      followUsOn()
                    ],
                  )),
            )
            //topGridView(),
          ],
        ));
  }

//TODO Top widget
  Widget topGridView() {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: 20, //data.length,
        itemBuilder: (context, position) {
          return Card(
              margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              color: AppColors.colorWhite,
              child: SizedBox(
                width: 250,
                //margin: EdgeInsets.only(left: 20,right: 20),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.network(
                    randomImage(),
                    fit: BoxFit.fill,
                  ),
                ),
              ));
        });
  }

//TODO Category Widget
  Widget categoryWidget() {
    return Column(
      //crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 15, right: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Category',
                style: getTextStyle(
                    Theme.of(context).primaryTextTheme.headline3!,
                    Dimens.margin18,
                    FontWeight.normal),
              ),
              ElevatedButton(
                onPressed: () {
                  //Tapped All Category show
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.transparent,
                  shadowColor: Colors.transparent,
                  minimumSize: Size.zero, // Set this
                  padding: EdgeInsets.zero, // and this
                ),
                child: Text(
                  'View All Category',
                  style: getTextStyle(
                      Theme.of(context).primaryTextTheme.headline5!,
                      Dimens.margin14,
                      FontWeight.normal),
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 140,
          child: categoryList(),
        ),

        //Expanded(child: categoryList())
      ],
    );
  }

  //Category List
  Widget categoryList() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      dragStartBehavior: DragStartBehavior.start,
      shrinkWrap: true,
      itemCount: 50,
      //data.length,
      itemBuilder: (context, position) {
        return SizedBox(
          width: 100,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment:  CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: AppColors.colorCyanSky,
                    borderRadius: BorderRadius.circular(5)),
                child: Image.asset(
                  'images/icon_facebook.png',
                  //height: 60,
                ),
              ),
              Text(
                'Wine/Liqour dvgf gdvf',
                style: getTextStyle(
                    Theme.of(context).primaryTextTheme.headline2!,
                    Dimens.margin14,
                    FontWeight.normal),
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );
      },
    );
  }

//TODO Popular product widget
  Widget popularList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 20, left: 15, top: 15),
          child: Text(
            'Popular Product',
            style: getTextStyle(Theme.of(context).primaryTextTheme.headline3!,
                Dimens.margin18, FontWeight.normal),
          ),
        ),
        productList()
      ],
    );
  }

  Widget productList() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  //maxCrossAxisExtent: 200,
                  childAspectRatio: 2 / 3,
                  /*crossAxisSpacing: 20,
                  mainAxisExtent: 20,*/
                  crossAxisSpacing: 10,
                  crossAxisCount: 2),
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: 3,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: Card(
                    elevation: 0.5,
                    color: Theme.of(context).backgroundColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side:
                            BorderSide(color: HexColor('f5f5f5'), width: 1.0)),
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        children: [
                          Expanded(
                            child: Image.network(
                              randomImage(),
                              fit: BoxFit.fill,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Doritos Tangy Cheese Corn Chips',
                            style: getTextStyle(
                                Theme.of(context).primaryTextTheme.headline2!,
                                Dimens.margin14,
                                FontWeight.normal),
                            textAlign: TextAlign.center,
                            maxLines: 2,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "\$2.25",
                            style: getTextStyle(
                                Theme.of(context).primaryTextTheme.headline5!,
                                Dimens.margin14,
                                FontWeight.normal),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
        ),
        Container(
          alignment: Alignment.topCenter,
          margin: const EdgeInsets.only(
            top: 10,
          ),
          child: ElevatedButton(
            onPressed: () {
              //Tapped view all show
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PopularProductListScreen()));
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.transparent,
              shadowColor: Colors.transparent,
              minimumSize: Size.zero, // Set this
              padding: EdgeInsets.zero, // and this
            ),
            child: Text(
              'View more',
              style: getTextStyle(Theme.of(context).primaryTextTheme.headline5!,
                  Dimens.margin14, FontWeight.normal),
              textAlign: TextAlign.right,
            ),
          ),
        ),
      ],
    );
  }

//TODO recommended product widget
  Widget recomendProduct() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 20, left: 15, top: 15),
          child: Text(
            'Recommend Product',
            style: getTextStyle(Theme.of(context).primaryTextTheme.headline3!,
                Dimens.margin18, FontWeight.normal),
          ),
        ),
        productList()
      ],
    );
  }

//TODO Latest News and Blog Widget
  Widget latestNewsAndBlog() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 10, left: 15, top: 15),
          child: Text(
            'Latest News & Blog',
            style: getTextStyle(Theme.of(context).primaryTextTheme.headline3!,
                Dimens.margin18, FontWeight.normal),
          ),
        ),
        Expanded(child: latestNewsAndBlogList()),
        const SizedBox(
          height: 10,
        ),
        Center(
          child: ElevatedButton(
            onPressed: () {
              //Tapped view all show
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.transparent,
              shadowColor: Colors.transparent,
              minimumSize: Size.zero, // Set this
              padding: EdgeInsets.zero, // and this
            ),
            child: Text(
              'View more',
              style: getTextStyle(Theme.of(context).primaryTextTheme.headline5!,
                  Dimens.margin14, FontWeight.normal),
              textAlign: TextAlign.right,
            ),
          ),
        ),
      ],
    );
  }

  Widget latestNewsAndBlogList() {
    return ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Card(
            color: Theme.of(context).backgroundColor,
            margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
            elevation: 0.5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: BorderSide(color: HexColor('f5f5f5'), width: 1.0),
            ),
            child: SizedBox(
              width: 240,
              child: Column(
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(8.0),
                          topRight: Radius.circular(8.0),
                          bottomRight: Radius.zero,
                          bottomLeft: Radius.zero),
                      child: Image.network(
                        randomImage(),
                        fit: BoxFit.fitWidth,
                        width: 240,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                        right: 15, left: 15, top: 10, bottom: 10),
                    child: Column(
                      children: [
                        Text(
                          'Lorem Ipsum is simply dummy text of the printing and typesetting in…',
                          style: getTextStyle(
                              Theme.of(context).primaryTextTheme.headline2!,
                              Dimens.margin14,
                              FontWeight.normal),
                          maxLines: 2,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Category Name',
                              style: getTextStyle(
                                  Theme.of(context).primaryTextTheme.headline1!,
                                  Dimens.margin14,
                                  FontWeight.normal),
                              maxLines: 2,
                            ),
                            Text(
                              '1 hours ago',
                              style: getTextStyle(
                                  Theme.of(context).primaryTextTheme.headline1!,
                                  Dimens.margin14,
                                  FontWeight.normal),
                              maxLines: 2,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

//TODO Instagram feed Widget
  Widget ourInstagramFeed() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.all(15),
          child: Text(
            'Our Instagram Feed',
            style: getTextStyle(Theme.of(context).primaryTextTheme.headline3!,
                Dimens.margin18, FontWeight.normal),
          ),
        ),
        SizedBox(
          height: 160,
          child: ListView.builder(
              itemCount: 10,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Theme.of(context).backgroundColor,
                  ),
                  width: 160,
                  child: GestureDetector(
                    onTap: () {
                      debugPrint('click on list');
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        randomImage(),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                );
              }),
        ),
      ],
    );
  }

//TODO Follow Us On Widget
  Widget followUsOn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 20, left: 15, bottom: 10),
          child: Text(
            'FOLLOW US ON',
            style: getTextStyle(Theme.of(context).primaryTextTheme.headline3!,
                Dimens.margin18, FontWeight.normal),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 15),
          child: Wrap(
            direction: Axis.horizontal,
            alignment: WrapAlignment.start,
            spacing: 15.0,
            runAlignment: WrapAlignment.spaceBetween,
            runSpacing: 10.0,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.facebook,
                    color: Colors.blue,
                    size: 45,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.facebook,
                    color: Colors.blue,
                    size: 45,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.facebook,
                    color: Colors.blue,
                    size: 45,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.facebook,
                    color: Colors.blue,
                    size: 45,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.facebook,
                    color: Colors.blue,
                    size: 45,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.facebook,
                    color: Colors.blue,
                    size: 45,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.facebook,
                    color: Colors.blue,
                    size: 45,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.facebook,
                    color: Colors.blue,
                    size: 45,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.facebook,
                    color: Colors.blue,
                    size: 45,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.facebook,
                    color: Colors.blue,
                    size: 45,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.facebook,
                    color: Colors.blue,
                    size: 45,
                  )),
            ],
          ),
        )
        /*GridView(
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          // mainAxisSpacing: 5,
          // crossAxisSpacing: 5,
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5
          ),
          children: [
            Container(
              height: 55,
                width: 55,
                padding: const EdgeInsets.all(5),
                child: IconButton(onPressed: (){

                }, icon: const Icon(Icons.facebook, color: Colors.blue,size: 45,))
            ),
            Container(
                height: 55,
                width: 55,
                padding: const EdgeInsets.all(5),
                child: IconButton(onPressed: (){

                }, icon: const Icon(Icons.facebook, color: Colors.blue,size: 45,))
            ),
            Container(
                height: 55,
                width: 55,
                padding: const EdgeInsets.all(5),
                child: IconButton(onPressed: (){

                }, icon: const Icon(Icons.facebook, color: Colors.blue,size: 45,))
            ),
            Container(
                padding: const EdgeInsets.all(5),
                child: IconButton(onPressed: (){

                }, icon: const Icon(Icons.facebook, color: Colors.blue,size: 45,))
            ),
            Container(
                height: 55,
                width: 55,
                padding: const EdgeInsets.all(5),
                child: IconButton(onPressed: (){

                }, icon: const Icon(Icons.facebook, color: Colors.blue,size: 45,))
            ),
            Container(
                height: 55,
                width: 55,
                padding: const EdgeInsets.all(5),
                child: IconButton(onPressed: (){

                }, icon: const Icon(Icons.facebook, color: Colors.blue,size: 45,))
            ),
            Container(
                height: 55,
                width: 55,
                padding: const EdgeInsets.all(5),
                child: IconButton(onPressed: (){

                }, icon: const Icon(Icons.facebook, color: Colors.blue,size: 45,))
            ),

          ],
        ),*/
      ],
    );
  }
}

//TODO Generate random image
String randomImage() {
  var rng = Random();
  return "https://picsum.photos/500/500?random=${rng.nextInt(500)}";
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        // etc.
      };
}

/*class NotificationScreen extends StatelessWidget {
  static const String routeName = '/notificationPage';

  NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: Text("notifications"),
        ),
        drawer: MyDrawer(
          notificationCount: 5,
        ),
        body: Center(child: Text("This is notification page")));
  }
}
*/
