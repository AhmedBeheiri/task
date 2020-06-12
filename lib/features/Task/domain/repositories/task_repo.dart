import 'package:dartz/dartz.dart';
import 'package:task/core/error/failures.dart';
import 'package:task/features/Task/domain/entities/task_entity.dart';

abstract class TaskRepo {
  Future<Either<Failure, TaskEntity>> getTask();
}
