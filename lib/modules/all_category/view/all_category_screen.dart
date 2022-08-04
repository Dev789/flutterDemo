import 'package:flutter/gestures.dart';
import 'package:flutterbase/modules/core/utils/common_import.dart';

class AllCategoryListScreen extends StatefulWidget {
  const AllCategoryListScreen({Key? key}) : super(key: key);

  @override
  State<AllCategoryListScreen> createState() => _AllCategoryListScreenState();
}

class _AllCategoryListScreenState extends State<AllCategoryListScreen> {
  @override
  Widget build(BuildContext context) {
    //var arrExpandedID = [];

    return Scaffold(
      body: SafeArea(
        top: true,
        bottom: true,
        child: ListView.builder(
          itemCount: 10,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          dragStartBehavior: DragStartBehavior.start,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Theme(
                  data: Theme.of(context)
                      .copyWith(dividerColor: Colors.transparent),
                  child: ExpansionTile(
                    childrenPadding: const EdgeInsets.all(10),
                    title: Text(
                      'Wine/Liqour',
                      style: getTextStyle(
                          Theme.of(context).primaryTextTheme.headline2!,
                          Dimens.margin14,
                          FontWeight.normal),
                    ),
                    collapsedIconColor: Theme.of(context).primaryColor,
                    leading: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Image.network(
                        randomImage(),
                        fit: BoxFit.fill,
                        width: 40,
                      ),
                    ),
                    /* trailing: IconButton(
                      onPressed: () {},
                      icon: arrExpandedID.contains(index)
                          ? Icon(
                              Icons.exposure_minus_1_rounded,
                              color: Theme.of(context).primaryColor,
                              size: 40,
                            )
                          : Icon(
                              Icons.plus_one_rounded,
                              color: Theme.of(context).primaryColor,
                              size: 40,
                            ),
                    ),*/
                    onExpansionChanged: (bool expanded) {
                      /*if (expanded) {
                        setState(() {
                          arrExpandedID.add(index);
                        });
                      } else {
                        setState(() {
                          arrExpandedID.remove(index);
                        });
                      }*/
                    },
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Divider(
                          color: Theme.of(context).dividerColor,
                          height: 1.0,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              mainAxisExtent: 40.0,
                              crossAxisCount: 2,
                              crossAxisSpacing: 10,
                            ),
                            physics: const NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              return SizedBox(
                                height: 50,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.arrow_right,
                                      color: Theme.of(context).primaryColor,
                                      size: 24,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'Bath & Body',
                                      style: getTextStyle(
                                          Theme.of(context)
                                              .primaryTextTheme
                                              .headline2!,
                                          Dimens.margin14,
                                          FontWeight.normal),
                                    )
                                  ],
                                ),
                              );
                            }),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 10, right: 10, top: 5, bottom: 5),
                  child: Divider(
                    color: Theme.of(context).dividerColor,
                    height: 1.0,
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
