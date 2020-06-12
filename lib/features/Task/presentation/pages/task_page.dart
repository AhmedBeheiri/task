import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:task/features/Task/presentation/manager/task_view_model.dart';
import 'package:task/features/Task/presentation/widgets/mobile_layout.dart';
import 'package:task/features/Task/presentation/widgets/tab_layout.dart';

class TaskPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TaskViewModel vm = Provider.of<TaskViewModel>(context);
    vm.toast.addListener(() {
      if (vm.toast.value.getContentIfNotHandled() != null) {
        Fluttertoast.showToast(msg: vm.toast.value.peekContent());
      }
    });
    var shortestSide = MediaQuery.of(context).size.shortestSide;
    final bool useMobileLayout = shortestSide < 600;
    return useMobileLayout ? MobileLayout() : TabletLayout();
  }
}
