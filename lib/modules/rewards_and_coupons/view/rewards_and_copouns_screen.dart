import 'package:flutterbase/modules/core/utils/common_import.dart';
import 'package:flutterbase/modules/rewards_and_coupons/view/rewards_points_history.dart';

class RewardsAndCouponsScreen extends StatefulWidget {
  const RewardsAndCouponsScreen({Key? key}) : super(key: key);

  @override
  State<RewardsAndCouponsScreen> createState() =>
      _RewardsAndCouponsScreenState();
}

class _RewardsAndCouponsScreenState extends State<RewardsAndCouponsScreen> {
  @override
  Widget build(BuildContext context) {
    //TODO Rewards Points Widget
    Widget rewardsPoints() {
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                getTranslate(APPStrings.rewardPoints)!,
                style: getTextStyle(
                    Theme.of(context).primaryTextTheme.headline2!,
                    Dimens.margin18,
                    FontWeight.normal),
              ),
              ElevatedButton(
                onPressed: () {
                  //View History
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RewardsPointHistory()));
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.transparent,
                  shadowColor: Colors.transparent,
                  minimumSize: Size.zero,
                  padding: EdgeInsets.zero,
                ),
                child: Text(
                  getTranslate(APPStrings.viewHistory)!,
                  style: getTextStyle(
                      Theme.of(context).primaryTextTheme.headline5!,
                      Dimens.margin14,
                      FontWeight.normal),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Card(
            //margin: const EdgeInsets.all(15),
            color: AppColors.colorWhite,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    APPImages.iconPremiumQuality,
                    height: 60,
                    width: 60,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '1000',
                        style: getTextStyle(
                            Theme.of(context).primaryTextTheme.headline5!,
                            Dimens.margin30,
                            FontWeight.normal),
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        getTranslate(APPStrings.currentRewardPoints)!,
                        style: getTextStyle(
                            Theme.of(context).primaryTextTheme.headline2!,
                            Dimens.margin14,
                            FontWeight.normal),
                        textAlign: TextAlign.left,
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      );
    }

    //TODO:- Coupon Section
    ///[couponsSection] is used for xyz
    Widget couponsSection() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            getTranslate(APPStrings.coupons)!,
            style: getTextStyle(Theme.of(context).primaryTextTheme.headline2!,
                Dimens.margin18, FontWeight.normal),
            textAlign: TextAlign.left,
          ),
          const SizedBox(
            height: 15,
          ),
          ListView.builder(
            itemBuilder: (context, index) {
              return Card(
                color: AppColors.colorWhite,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 55,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(8)),
                          gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                AppColors.colorTiffanyBlue,
                                AppColors.colorSkyBlueCrayola,
                              ])),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              '5%',
                              style: getTextStyle(
                                  Theme.of(context).primaryTextTheme.headline4!,
                                  Dimens.margin30,
                                  FontWeight.normal),
                              textAlign: TextAlign.left,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              getTranslate(APPStrings.offEntireOnOrder)!,
                              style: getTextStyle(
                                  Theme.of(context).primaryTextTheme.headline4!,
                                  Dimens.margin14,
                                  FontWeight.normal),
                              textAlign: TextAlign.left,
                            ),
                            const Spacer(),
                            Align(
                              alignment: Alignment.topRight,
                              child: Container(
                                padding: const EdgeInsets.all(7),
                                decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(8),
                                        bottomLeft: Radius.circular(8)),
                                    color: AppColors.colorCoralRed),
                                child: Text(
                                  getTranslate(APPStrings.textNew)!,
                                  style: getTextStyle(
                                      Theme.of(context)
                                          .primaryTextTheme
                                          .headline4!,
                                      Dimens.margin14,
                                      FontWeight.normal),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Lorem Ipsum is simply dummy text of the and typesetting industry.',
                            style: getTextStyle(
                                Theme.of(context).primaryTextTheme.headline1!,
                                Dimens.margin14,
                                FontWeight.normal),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    color: AppColors.colorCultured),
                                padding: const EdgeInsets.all(8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'SD5DS2',
                                      style: getTextStyle(
                                          Theme.of(context)
                                              .primaryTextTheme
                                              .headline2!,
                                          Dimens.margin14,
                                          FontWeight.normal),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    GestureDetector(
                                        onTap: () {
                                          //TODO:- Copied to clip board
                                        },
                                        child: const Icon(
                                          Icons.copy,
                                          size: 20,
                                          color: AppColors.colorPrimary,
                                        ))
                                  ],
                                ),
                              ),
                              Text(
                                'exp Apr 25',
                                style: getTextStyle(
                                    Theme.of(context)
                                        .primaryTextTheme
                                        .headline1!,
                                    Dimens.margin14,
                                    FontWeight.normal),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
            itemCount: 10,
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
          ),
        ],
      );
    }

    return Scaffold(
      body: SafeArea(
        top: true,
        bottom: true,
        child: CustomScrollView(
          scrollDirection: Axis.vertical,
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 20, left: 15, right: 15, bottom: 10),
                child: rewardsPoints(),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 10, left: 15, right: 15, bottom: 10),
                child: couponsSection(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
