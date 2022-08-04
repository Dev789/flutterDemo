import 'package:flutterbase/modules/core/utils/common_import.dart';

class RewardsPointHistory extends StatefulWidget {
  const RewardsPointHistory({Key? key}) : super(key: key);

  @override
  State<RewardsPointHistory> createState() => _RewardsPointHistoryState();
}

class _RewardsPointHistoryState extends State<RewardsPointHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.colorCyanSky,
        //leading: const Icon(Icons.menu),
        title: Text(
          getTranslate(APPStrings.drawerRewardPointsHistory)!,
          style: getTextStyle(Theme.of(context).primaryTextTheme.headline4!,
              Dimens.margin14, FontWeight.normal),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 10, bottom: 20),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Card(
              color: Theme.of(context).backgroundColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                  side: BorderSide(color: Theme.of(context).shadowColor)),
              margin: const EdgeInsets.fromLTRB(15, 10, 15, 0),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Credited from Order 123-321-123',
                          style: getTextStyle(
                              Theme.of(context).primaryTextTheme.headline2!,
                              Dimens.margin14,
                              FontWeight.normal),
                          maxLines: 2,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          '20/03/2021 | 10:15',
                          style: getTextStyle(
                              Theme.of(context).primaryTextTheme.headline1!,
                              Dimens.margin14,
                              FontWeight.normal),
                          maxLines: 2,
                        ),
                      ],
                    ),
                    Text(
                      '-5000',
                      style: getTextStyle(
                          Theme.of(context).primaryTextTheme.bodyText2!,
                          Dimens.margin14,
                          FontWeight.normal),
                      maxLines: 2,
                    ),
                  ],
                ),
              ),
            );
          },
          itemCount: 50,
        ),
      ),
    );
  }
}
