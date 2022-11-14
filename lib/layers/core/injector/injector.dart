import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:tasker/layers/data/datasources/change_task_completion_status_datasource.dart';
import 'package:tasker/layers/data/datasources/delete_task_datasource.dart';
import 'package:tasker/layers/data/datasources/get_all_tasks_datasource.dart';
import 'package:tasker/layers/data/datasources/local/change_task_completion_status_datasource_impl.dart';
import 'package:tasker/layers/data/datasources/local/delete_task_local_datasource_impl.dart';
import 'package:tasker/layers/data/datasources/local/get_all_tasks_local_datasource_impl.dart';
import 'package:tasker/layers/data/datasources/local/save_task_local_datasource_impl.dart';
import 'package:tasker/layers/data/datasources/save_task_datasource.dart';
import 'package:tasker/layers/data/repositories/change_task_completion_status_repository_impl.dart';
import 'package:tasker/layers/data/repositories/delete_task_repository_impl.dart';
import 'package:tasker/layers/data/repositories/get_all_tasks_repository_impl.dart';
import 'package:tasker/layers/data/repositories/save_task_repository_impl.dart';
import 'package:tasker/layers/domain/entities/task_entity.dart';
import 'package:tasker/layers/domain/repositories/change_task_completion_status_repository.dart';
import 'package:tasker/layers/domain/repositories/delete_task_repository.dart';
import 'package:tasker/layers/domain/repositories/get_all_tasks_repository.dart';
import 'package:tasker/layers/domain/repositories/save_task_repository.dart';
import 'package:tasker/layers/domain/usecases/change_task_completion_status/change_task_completion_status.dart';
import 'package:tasker/layers/domain/usecases/change_task_completion_status/change_task_completion_status_impl.dart';
import 'package:tasker/layers/domain/usecases/delete_task/delete_task_usecase.dart';
import 'package:tasker/layers/domain/usecases/delete_task/delete_task_usecase_impl.dart';
import 'package:tasker/layers/domain/usecases/get_all_tasks/get_all_tasks_usecase.dart';
import 'package:tasker/layers/domain/usecases/get_all_tasks/get_all_tasks_usecase_impl.dart';
import 'package:tasker/layers/domain/usecases/save_task/save_task_usecase.dart';
import 'package:tasker/layers/domain/usecases/save_task/save_task_usecase_impl.dart';
import 'package:tasker/layers/presentation/controllers/task_controller.dart';
import 'package:tasker/main.dart';

final GetIt serviceLocator = GetIt.I;

Future<void> setupLocator() async {
  // Usecases
  serviceLocator.registerLazySingleton<GetAllTasksUsecase>(
      () => GetAllTasksUsecaseImpl(serviceLocator()));
  serviceLocator.registerLazySingleton<DeleteTaskUsecase>(
      () => DeleteTaskUsecaseImpl(serviceLocator()));
  serviceLocator.registerLazySingleton<SaveTaskUsecase>(
      () => SaveTaskUsecaseImpl(serviceLocator()));
  serviceLocator.registerLazySingleton<ChangeTaskCompletionStatusUsecase>(
      () => ChangeTaskCompletionStatusUsecaseImpl(serviceLocator()));

  // Repos
  serviceLocator.registerLazySingleton<GetAllTasksRepository>(
      () => GetAllTasksRepositoryImpl(serviceLocator()));
  serviceLocator.registerLazySingleton<DeleteTaskRepository>(
      () => DeleteTaskRepositoryImpl(serviceLocator()));
  serviceLocator.registerLazySingleton<SaveTaskRepository>(
      () => SaveTaskRepositoryImpl(serviceLocator()));
  serviceLocator.registerLazySingleton<ChangeTaskCompletionStatusRepository>(
      () => ChangeTaskCompletionStatusRepositoryImpl(serviceLocator()));

  // Data sources
  serviceLocator.registerLazySingleton<GetAllTasksDatasource>(
      () => GetAllTasksDatasourceImpl(serviceLocator()));
  serviceLocator.registerLazySingleton<DeleteTaskDatasource>(
      () => DeleteTaskLocalDatasourceImpl(serviceLocator()));
  serviceLocator.registerLazySingleton<SaveTaskDatasource>(
      () => SaveTaskLocalDatasourceImpl(serviceLocator()));
  serviceLocator.registerLazySingleton<ChangeTaskCompletionStatusDatasource>(
      () => ChangeTaskCompletionStatusDatasourceImpl(serviceLocator()));

  // Controllers
  serviceLocator.registerLazySingleton<TaskController>(() => TaskController(
        serviceLocator(),
        serviceLocator(),
        serviceLocator(),
        serviceLocator(),
      ));

  // TaskEntity Box
  serviceLocator.registerLazySingleton<Box<TaskEntity>>(() => taskBox);
}
