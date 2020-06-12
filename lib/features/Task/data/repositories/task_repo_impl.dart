import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:task/core/error/exception.dart';
import 'package:task/core/error/failures.dart';
import 'package:task/features/Task/data/data_sources/task_remote_data_source.dart';
import 'package:task/features/Task/domain/entities/task_entity.dart';
import 'package:task/features/Task/domain/repositories/task_repo.dart';

class TaskRepoImpl implements TaskRepo {
  TaskRemoteDataSource _remoteDataSource;

  TaskRepoImpl({
    @required TaskRemoteDataSource remoteDataSource,
  }) : _remoteDataSource = remoteDataSource;

  @override
  Future<Either<Failure, TaskEntity>> getTask() async {
    try {
      final task = await _remoteDataSource.getTask();
      return Right(task);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
