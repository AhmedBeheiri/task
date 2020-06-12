import 'package:get_it/get_it.dart';
import 'package:task/features/Task/data/data_sources/task_remote_data_source.dart';
import 'package:task/features/Task/data/repositories/task_repo_impl.dart';
import 'package:task/features/Task/domain/repositories/task_repo.dart';
import 'package:task/features/Task/domain/use_cases/get_task_use_case.dart';
import 'package:task/features/Task/presentation/manager/task_view_model.dart';

import 'core/Network/network.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(() => TaskViewModel(taskUseCase: sl()));
  sl.registerLazySingleton(() => GetTaskUseCase(repo: sl()));
  sl.registerLazySingleton<TaskRepo>(() => TaskRepoImpl(remoteDataSource: sl()));
  sl.registerLazySingleton<TaskRemoteDataSource>(() => TaskRemoteDataSourceImpl(network: sl()));
  sl.registerLazySingleton(() => Network());
}
