import 'package:dio/dio.dart';
import 'package:flutter_doctors_community_app/core/networking/api_services.dart';
import 'package:flutter_doctors_community_app/core/networking/dio_factory.dart';
import 'package:flutter_doctors_community_app/features/login/data/repos/login_repo.dart';
import 'package:flutter_doctors_community_app/features/login/logic/login_cubit/login_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  Dio dio = DioFactory.getDio();

  getIt.registerLazySingleton<ApiServices>(()=>ApiServices(dio));

  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerLazySingleton<LoginCubit>(() => LoginCubit(getIt()));
}
