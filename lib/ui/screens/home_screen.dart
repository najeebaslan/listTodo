// ignore_for_file: avoid_print
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:local_notifaiction/Api/issue_provider.dart';
import 'package:local_notifaiction/db/db_helper.dart';
import 'package:local_notifaiction/models/task.dart';
import 'package:local_notifaiction/ui/widgets/bottom_sheet.dart';
import 'package:local_notifaiction/ui/widgets/custom_transitions.dart';
import 'package:local_notifaiction/ui/widgets/decrostion.dart';
import 'package:local_notifaiction/ui/widgets/style.dart';
import 'package:local_notifaiction/utils/error_response.dart';

import 'package:local_notifaiction/localizition/type_language.dart';
import 'package:local_notifaiction/services/notification_services.dart';
import 'package:local_notifaiction/utils/sherdperfomsnce.dart';
import 'package:local_notifaiction/utils/utils_functions.dart';
// ignore: implementation_imports
import 'package:nb_utils/src/extensions/int_extensions.dart';
import 'package:nb_utils/src/extensions/widget_extensions.dart';

import 'package:provider/provider.dart';
import 'body_home_screen.dart';
import 'issue_detials_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomeScreen> {
  var notifyHelper;
  setLangaueg() async {
    return await MySharedPreferences.setString(LANGUAGEkEY, LANGUAGEtYPE[0]);
  }

  Future<Null> _refreshData() async {
    await Provider.of<IssueProvder>(context, listen: false).getIssue(context);

    setState(() {});
  }

  Future<dynamic> _refreshData1() async {
    await DBHelper.db.query();
  }

  cencelNotification(id) async {
    await notifyHelper.cancelNotificationById(id);
  }

  late Future _doctorsFuture;
  @override
  void initState() {
    super.initState();
    notifyHelper = NotifyHelper();
    notifyHelper
        .initializeNotification(); /* this is for  Initialize Notification Permissions Android And Ios*/
    notifyHelper.requestIOSPermissions();
    setLangaueg();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: Column(
          children: [
            2.height,
            fliterAndSort(),
            _showIssue(),
          ],
        ),
      ),
    );
  }

  Widget fliterAndSort() {
    return Column(
      children: [
        Container(
          // padding: const EdgeInsets.only(top: 0, bottom: 0),
          decoration: boxDecorationWithRoundedCorners(
            borderRadius: radius(0),
            boxShadow: defaultBoxShadow(),
            backgroundColor: Colors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                textDirection: TextDirection.rtl,
                children: [
                  IconButton(
                    icon: const Icon(Icons.filter_alt),
                    color: Colors.grey,
                    onPressed: () {
                      ErrorResponse.awesomeDialog(
                        context: context,
                        error: 'سيتم تفعيل الخدمة قربياً',
                        dialogType: DialogType.QUESTION,
                      );
                    },
                  ),
                  8.width,
                  Text("فلتر",
                      style: TextStyle(
                          color: StyleWidget.grey.withOpacity(0.7),
                          fontSize: 15,
                          fontFamily: StyleWidget.fontName,
                          fontWeight: FontWeight.w700)),
                ],
              ),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.sort),
                    color: Colors.grey,
                    onPressed: () {
                      ErrorResponse.awesomeDialog(
                        error: 'سيتم تفعيل الخدمة قربياً',
                        context: context,
                        dialogType: DialogType.QUESTION,
                      );
                    },
                  ),
                  8.width,
                  Text(
                    "ترتيب",
                    style: TextStyle(
                        color: StyleWidget.grey.withOpacity(0.7),
                        fontSize: 15,
                        fontFamily: StyleWidget.fontName,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _showIssue() {
    return FutureBuilder<List<Issue>>(
        future: IssueProvder().getIssue(context),
        builder: (context, AsyncSnapshot<List<Issue>> snapshot) {
          if (snapshot.error != null) {
            return ErrorResponse.awesomeDialog(
              error: snapshot.error.toString(),
              context: context,
              dialogType: DialogType.ERROR,
            );
          }
          print(snapshot.error);
          if (!snapshot.hasData) {
            return const CircularProgressIndicator();
          } else if (snapshot.data!.isEmpty) {
            return Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'images/notfound.png',
                ),
                const Text(
                  '! ...لا توجد بيانات',
                  style: TextStyle(
                      color: primaryClr, fontSize: 30, fontFamily: 'Cairo'),
                )
              ],
            ));
          } else {
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  var data = snapshot.data![index];

                  return GestureDetector(
                      onLongPress: () {
                        ShowBottomSheet.customShowBottomSheet(
                            issue: data,
                            // taskController: IssueProvder(),
                            context: context,
                            setState: setState,
                            key: 0);
                      },
                      onTap: () {
                        Navigator.push(
                            context, CostumNvigator(IssueDetails(data)));
                      },
                      child: BodyHomeScreen(data, snapshot.data!.length));
                }).paddingAll(5).expand();
          }
        });
  }
}

class MyConsumerAuthProvider extends StatelessWidget {
  final Widget Function(BuildContext, IssueProvder, Widget?) builder;
  const MyConsumerAuthProvider({Key? key, required this.builder})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<IssueProvder>(builder: builder);
  }
}
