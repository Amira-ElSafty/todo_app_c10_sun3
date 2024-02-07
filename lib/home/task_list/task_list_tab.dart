import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_todo_c10_sun3/home/task_list/task_list_item.dart';
import 'package:flutter_app_todo_c10_sun3/my_theme.dart';

class TaskListTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            color: MyTheme.whiteColor,
            child: CalendarTimeline(
              initialDate: DateTime.now(),
              firstDate: DateTime.now().subtract(Duration(days: 365)),
              lastDate: DateTime.now().add(Duration(days: 365)),
              onDateSelected: (date) => print(date),
              leftMargin: 20,
              monthColor: MyTheme.blackColor,
              dayColor: MyTheme.blackColor,
              activeDayColor: MyTheme.whiteColor,
              activeBackgroundDayColor: Colors.redAccent[100],
              dotsColor: Color(0xFF333A47),
              selectableDayPredicate: (date) => true,
              locale: 'en_ISO',
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return TaskListItem();
              },
              itemCount: 30,
            ),
          )
        ],
      ),
    );
  }
}
