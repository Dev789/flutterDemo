import 'package:flutterbase/modules/core/utils/common_import.dart';

class PopularProductListScreen extends StatefulWidget {
  const PopularProductListScreen({Key? key}) : super(key: key);

  @override
  State<PopularProductListScreen> createState() =>
      _PopularProductListScreenState();
}

class _PopularProductListScreenState extends State<PopularProductListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          getTranslate(APPStrings.drawerPopularProduct)!,
          style: getTextStyle(Theme.of(context).primaryTextTheme.headline4!,
              Dimens.margin14, FontWeight.normal),
        ),
        actions: [
          Container(
              margin: const EdgeInsets.only(right: 10, left: 15),
              child: GestureDetector(
                  onTap: () {
                    //TODO filter Tapped
                    _openBottomSheet();
                  },
                  child: Image.asset(
                    APPImages.iconFilter,
                    height: 30,
                    width: 30,
                  ))),
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: GestureDetector(
                onTap: () {
                  //TODO Cart Tapped
                },
                child: Image.asset(
                  APPImages.iconCart,
                  height: 30,
                  width: 30,
                )),
          ),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.all(15),
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2 / 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10),
            scrollDirection: Axis.vertical,
            itemCount: 25,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  debugPrint('$index');
                },
                child: Card(
                  elevation: 0.5,
                  color: Theme.of(context).backgroundColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: const BorderSide(
                          color: AppColors.colorCultured, width: 1.0)),
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
    );
  }

  void _openBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
            decoration: BoxDecoration(color: Theme.of(context).backgroundColor),
            child: CustomScrollView(
              scrollDirection: Axis.vertical,
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      SizedBox(height: 50, child: filterTopBar()),
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }

  Widget filterTopBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          getTranslate(APPStrings.textFilter)!,
          style: getTextStyle(Theme.of(context).primaryTextTheme.headline2!,
              Dimens.margin20, FontWeight.normal),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: GestureDetector(
            onTap: () {},
            child: Image.asset(
              APPImages.iconFilterClose,
              height: Dimens.margin24,
            ),
          ),
        ),
      ],
    );
  }
}
