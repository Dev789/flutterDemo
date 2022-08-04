import 'package:flutterbase/modules/core/utils/common_import.dart';


class NotificationListScreen extends StatefulWidget {
  const NotificationListScreen({Key? key}) : super(key: key);

  @override
  State<NotificationListScreen> createState() => _NotificationListScreenState();
}

class _NotificationListScreenState extends State<NotificationListScreen> {
  @override
  Widget build(BuildContext context) {
    var isRead = true;
    return Scaffold(
      //backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: (){
            debugPrint('$index');
          },
          child: Card(
            color: Theme.of(context).backgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
              side: BorderSide(color: Theme.of(context).shadowColor)
            ),
            margin: const EdgeInsets.fromLTRB(15, 10, 15, 10),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Earned Reward 10 Points',
                    style: isRead ? getTextStyle(Theme.of(context).primaryTextTheme.headline1!,
                        Dimens.margin14, FontWeight.normal) : getTextStyle(Theme.of(context).primaryTextTheme.headline2!,
                        Dimens.margin14, FontWeight.normal),
                    maxLines: 2,
                  ),
                  const SizedBox(height: 10,),
                  Text(
                    '10 min ago',
                    style: getTextStyle(Theme.of(context).primaryTextTheme.headline1!,
                        Dimens.margin14, FontWeight.normal),
                    maxLines: 2,
                  ),
                ],
              ),
            ),
          ),
        );
      },

      ),
    );
  }


}
