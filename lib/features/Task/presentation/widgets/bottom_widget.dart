import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/features/Task/presentation/manager/task_view_model.dart';

class BottomWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TaskViewModel vm = Provider.of<TaskViewModel>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'تكلفة الدورة',
            style: TextStyle(color: Colors.grey, fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'الحجز العادي',
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                  Text(
                    '${vm.entity.normalCost} SAR',
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  )
                ],
              ),
              SizedBox(
                height: 5.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'الحجز المميز',
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                  Text(
                    '${vm.entity.specialCost} SAR',
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  )
                ],
              ),
              SizedBox(
                height: 5.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'الحجز السريع',
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                  Text(
                    '${vm.entity.fastCost} SAR',
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  )
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        InkWell(
          onTap: () {},
          splashColor: Colors.purpleAccent,
          child: Container(
            width: double.infinity,
            height: 60,
            color: Colors.purple.shade700,
            child: Center(
              child: Text(
                'قم بالحجز الان',
                style: TextStyle(color: Colors.white, fontSize: 19.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        )
      ],
    );
  }
}
