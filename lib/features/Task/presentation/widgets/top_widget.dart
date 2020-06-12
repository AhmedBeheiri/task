import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:task/features/Task/presentation/manager/task_view_model.dart';

class TopWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TaskViewModel vm = Provider.of<TaskViewModel>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            '#${vm.entity.interest}',
            style: TextStyle(color: Colors.grey, fontSize: 14),
          ),
        ),
        SizedBox(
          height: 8.0,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            vm.entity.title,
            style: TextStyle(color: Colors.black45, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 8.0,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: <Widget>[
              Icon(
                Icons.date_range,
                color: Colors.grey,
              ),
              SizedBox(
                width: 10.0,
              ),
              Text(
                DateFormat('MMMMEEEEd').format(DateTime.parse(vm.entity.date)),
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: <Widget>[
              Image.asset(
                'assets/images/pin.png',
                height: 20.0,
                color: Colors.grey,
              ),
              SizedBox(
                width: 10.0,
              ),
              Text(
                vm.entity.title,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
      ],
    );
  }
}
