import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:task/core/Network/network.dart';
import 'package:task/core/error/exception.dart';
import 'package:task/features/Task/data/models/task_model.dart';

abstract class TaskRemoteDataSource {
  /// Throws [ServerException]
  Future<TaskModel> getTask();
}

class TaskRemoteDataSourceImpl implements TaskRemoteDataSource {
  Network _network;

  TaskRemoteDataSourceImpl({
    @required Network network,
  }) : _network = network;

  @override
  Future<TaskModel> getTask() async {
    Response response = await _network.getData(url: '3a1ec9ff-6a95-43cf-8be7-f5daa2122a34');
    if (response.statusCode == 200) {
      return TaskModel.fromJson(jsonDecode(response.body));
    } else {
      throw (ServerException());
    }
  }
}
