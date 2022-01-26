import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:local_notifaiction/models/task.dart';
import 'package:local_notifaiction/ui/widgets/style.dart';
import 'package:local_notifaiction/utils/utils_functions.dart';
import 'package:nb_utils/src/extensions/int_extensions.dart';
import 'package:nb_utils/src/extensions/widget_extensions.dart';
import 'transtion/add_todo_button.dart';
import 'transtion/custom_rect_tween.dart';
import 'transtion/hero_dialog_route.dart';

class MyCard extends StatelessWidget {
  static const String _heroAddTodo = 'add-todo-hero';
  final Issue? issue;
  const MyCard(
    this.issue, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
        onTap: () {
          Navigator.of(context).push(HeroDialogRoute(builder: (context) {
            return TaskTile(issue);
          }));
        },
        child: Hero(
          tag: issue!.id.toString(),
          createRectTween: (begin, end) {
            return CustomRectTween(begin: begin!, end: end!);
          },
          child: Material(
            color: primaryClr,
            elevation: 2,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
            child:
                // AddTodoButton()
                // TaskTile(issue)
                const Icon(
              Icons.add_rounded,
              size: 56,
            ),
          ),
        ),
      
    ).paddingAll(32);
  }
}

class TaskTile extends StatelessWidget {
  static const String _heroAddTodo = 'add-todo-hero1';

  final Issue? issue;
  const TaskTile(this.issue, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: issue!.id.toString(),
      createRectTween: (begin, end) {
        return CustomRectTween(begin: begin!, end: end!);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.only(bottom: 12),
        child: Container(
          padding: const EdgeInsets.all(16),
          //  width: SizeConfig.screenWidth * 0.78,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: _getBGClr(issue?.color ?? 0),
          ),

          child: Row(children: [
             Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    issue?.name.toString() ?? "",
                    style: const TextStyle(
                        fontSize: 16,
                        fontFamily: StyleWidget.fontName,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                   12.height,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.access_time_rounded,
                        color: Colors.grey[200],
                        size: 18,
                      ),
                      4.width,
                      // Text(
                      //   "${issue!.startTime} - ${issue!.endTime}",
                      //   style: GoogleFonts.lato(
                      //     textStyle:
                      //         TextStyle(fontSize: 13, color: Colors.grey[100]),
                      //   ),
                      // ),
                    ],
                  ),
                  12.height,
                  Text(
                    issue?.note ?? "",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey[100],
                      fontFamily: StyleWidget.fontName,
                    ),
                  ),
                ],
              ).expand( ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              height: 60,
              width: 0.5,
              color: Colors.grey[200]!.withOpacity(0.7),
            ),
            RotatedBox(
              quarterTurns: 3,
              child: Text(
                issue!.isCompleted == 1 ? "منجز" : "نشطة",
                style: const TextStyle(
                    fontSize: 10,
                    fontFamily: StyleWidget.fontName,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ]),
        ),
      ),
    );
  }

  _getBGClr(int no) {
    switch (no) {
      case 0:
        return bluishClr;
      case 1:
        return pinkClr;
      case 2:
        return yellowClr;
      default:
        return bluishClr;
    }
  }
}
