import 'package:axen_tech_assignment/features/auth/presentation/bloc/sign_in_bloc.dart';
import 'package:axen_tech_assignment/features/setting/cubit/theme_selector_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

// Auth imports
import 'package:axen_tech_assignment/features/auth/data/datasource/auth_datasource.dart';
import 'package:axen_tech_assignment/features/auth/data/repositories/auth_repositories_impl.dart';
import 'package:axen_tech_assignment/features/auth/domain/repositories/auth_repositories.dart';
import 'package:axen_tech_assignment/features/auth/domain/usecase/sign_in_usecase.dart';

final GetIt injector = GetIt.instance;

Future<void> initializeDependencies() async {
  // Data Sources
  injector.registerLazySingleton<AuthDataSource>(() => AuthDataSourceImpl());

  // Repositories
  injector.registerLazySingleton<AuthRepository>(
    () => AuthRepositoriesImpl(injector()),
  );

  injector.registerLazySingleton<SignInUseCase>(
    () => SignInUseCase(injector()),
  );
  injector.registerFactory<ThemeSelectorCubit>(
    () => ThemeSelectorCubit(),
  );

  injector.registerFactory<SignInBloc>(() => SignInBloc(
        signInUseCase: injector<SignInUseCase>(),
      ));
}
