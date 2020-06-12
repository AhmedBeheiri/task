import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:task/core/error/failures.dart';
import 'package:task/features/Task/domain/entities/task_entity.dart';
import 'package:task/features/Task/domain/repositories/task_repo.dart';

class GetTaskUseCase {
  TaskRepo _repo;

  GetTaskUseCase({
    @required TaskRepo repo,
  }) : _repo = repo;

  Future<Either<Failure, TaskEntity>> call() async {
    return await _repo.getTask();
  }
}
