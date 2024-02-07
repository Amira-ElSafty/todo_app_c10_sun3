import 'package:flutter/material.dart';
import 'package:flutter_app_todo_c10_sun3/my_theme.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TaskListItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      child: Slidable(
        // The start action pane is the one at the left or the top side.
        startActionPane: ActionPane(
          extentRatio: 0.25,
          // A motion is a widget used to control how the pane animates.
          motion: const DrawerMotion(),
          // All actions are defined in the children parameter.
          children: [
            // A SlidableAction can have an icon and/or a label.
            SlidableAction(
              borderRadius: BorderRadius.circular(12),
              onPressed: (context) {
                /// delete task
              },
              backgroundColor: MyTheme.redColor,
              foregroundColor: MyTheme.whiteColor,
              icon: Icons.delete,
              label: 'Delete',
            ),
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: MyTheme.whiteColor),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.11,
                width: 4,
                color: MyTheme.primaryColor,
              ),
              SizedBox(
                width: 12,
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Title',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: MyTheme.primaryColor),
                  ),
                  Text('Desc.', style: Theme.of(context).textTheme.titleMedium)
                ],
              )),
              Container(
                padding: EdgeInsets.symmetric(vertical: 4, horizontal: 21),
                decoration: BoxDecoration(
                    color: MyTheme.primaryColor,
                    borderRadius: BorderRadius.circular(15)),
                child: Icon(
                  Icons.check,
                  color: MyTheme.whiteColor,
                  size: 35,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
