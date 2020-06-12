import 'package:flutter/material.dart';
import 'package:task/core/Util/Event.dart';
import 'package:task/core/error/failures.dart';
import 'package:task/features/Task/domain/entities/task_entity.dart';
import 'package:task/features/Task/domain/use_cases/get_task_use_case.dart';

class TaskViewModel extends ChangeNotifier {
  ValueNotifier<bool> _loading = ValueNotifier(false);

  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<Event<String>> _toast = ValueNotifier(Event(''));

  ValueNotifier<Event<String>> get toast => _toast;

  TaskEntity _entity = TaskEntity(
      headerImages: List(),
      interest: '',
      title: '',
      date: '2019-04-05T14:00:51.000Z',
      coachName: '',
      aboutCoach: '',
      aboutCourse: '',
      normalCost: 0,
      specialCost: 0,
      fastCost: 0,
      coachImage: '',
      isFavourite: false);

  TaskEntity get entity => _entity;
  GetTaskUseCase _taskUseCase;
  int _pageNumber = 0;

  set pageNumber(int num) {
    _pageNumber = num;
    notifyListeners();
  }

  int get pageNumber => _pageNumber;

  TaskViewModel({
    @required GetTaskUseCase taskUseCase,
  }) : _taskUseCase = taskUseCase {
    getTask();
  }

  void getTask() async {
    _loading.value = true;
    final failureOrTask = await _taskUseCase();
    failureOrTask.fold((l) => _toast.value = Event(SERVER_FAILURE_MESSAGE), (r) {
      _entity = r;
      notifyListeners();
    });
    _loading.value = false;
  }

  void toggleFavourite() {
    _entity.isFavourite = !_entity.isFavourite;
    notifyListeners();
  }
}
