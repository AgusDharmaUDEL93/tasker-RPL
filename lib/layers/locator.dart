import 'package:get_it/get_it.dart';
import 'package:tasker/layers/data/datasources/get_all_tasks_datasource.dart';
import 'package:tasker/layers/data/datasources/local/get_all_tasks_local_datasource_impl.dart';
import 'package:tasker/layers/data/repositories/delete_task_repository_impl.dart';
import 'package:tasker/layers/data/repositories/get_all_tasks_repository_impl.dart';
import 'package:tasker/layers/domain/repositories/delete_task_repository.dart';
import 'package:tasker/layers/domain/repositories/get_all_tasks_repository.dart';
import 'package:tasker/layers/domain/usecases/delete_task/delete_task_usecase.dart';
import 'package:tasker/layers/domain/usecases/delete_task/delete_task_usecase_impl.dart';
import 'package:tasker/layers/domain/usecases/get_all_tasks/get_all_tasks_usecase.dart';
import 'package:tasker/layers/domain/usecases/get_all_tasks/get_all_tasks_usecase_impl.dart';

final GetIt serviceLocator = GetIt.I;

Future<void> setupLocator() async {
  // Usecases
  serviceLocator.registerLazySingleton<GetAllTasksUsecase>(
      () => GetAllTasksUsecaseImpl(serviceLocator()));
  serviceLocator.registerLazySingleton<DeleteTaskUsecase>(
      () => DeleteTaskUsecaseImpl(serviceLocator()));

  // Repos
  serviceLocator.registerLazySingleton<GetAllTasksRepository>(
      () => GetAllTasksRepositoryImpl(serviceLocator()));
  serviceLocator.registerLazySingleton<DeleteTaskRepository>(
      () => DeleteTaskRepositoryImpl(serviceLocator()));

  // Data sources
  serviceLocator.registerLazySingleton<GetAllTasksDatasource>(
      () => GetAllTasksDatasourceImpl(serviceLocator()));
}
