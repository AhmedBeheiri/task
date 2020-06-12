import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/features/Task/presentation/manager/task_view_model.dart';

class MediumWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TaskViewModel vm = Provider.of<TaskViewModel>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: <Widget>[
              CircleAvatar(
                radius: 16.0,
                backgroundImage: NetworkImage(vm.entity.coachImage),
              ),
              SizedBox(width: 10.0),
              Text(
                vm.entity.coachName,
                style: TextStyle(color: Colors.grey, fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            vm.entity.aboutCoach,
            style: TextStyle(color: Colors.grey, fontSize: 14),
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Divider(
          height: 1.0,
          color: Colors.grey,
        ),
        SizedBox(
          height: 10.0,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'عن الدورة',
            style: TextStyle(color: Colors.grey, fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            vm.entity.aboutCourse,
            style: TextStyle(color: Colors.grey, fontSize: 14),
          ),
        ),
      ],
    );
  }
}
