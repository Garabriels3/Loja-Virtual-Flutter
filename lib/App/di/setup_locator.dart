import 'package:get_it/get_it.dart';
import 'package:loja_virtual/app/data/source/remote/firebase/firebaseAuth/firebase_auth_I.dart';
import 'package:loja_virtual/app/data/source/remote/firebase/firebaseAuth/firebase_auth_impl.dart';
import 'package:loja_virtual/app/data/source/remote/firebase/firebaseStore/firebase_store_I.dart';
import 'package:loja_virtual/app/data/source/remote/firebase/firebaseStore/firebase_store_Impl.dart';
import 'package:loja_virtual/app/domain/repository/user_repository.dart';
import 'package:loja_virtual/app/presentation/ui/base/base_viewmodel.dart';
import 'package:loja_virtual/app/presentation/ui/login/login_viewmodel.dart';
import 'package:loja_virtual/app/presentation/ui/signUp/sign_up_viewmodel.dart';
import 'package:loja_virtual/app/data/repository/user_repository_impl.dart';
import 'package:loja_virtual/app/domain/usecase/user_usecase_impl.dart';

final getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton<BaseScreenViewModel>(() => BaseScreenViewModel());
  getIt.registerLazySingleton<SignUpViewModel>(() => SignUpViewModel());
  getIt.registerLazySingleton<LoginViewModel>(() => LoginViewModel());
  getIt.registerLazySingleton<UserRepository>(() => UserRepositoryImpl());
  getIt.registerLazySingleton<UserUseCase>(() => UserUseCaseImpl());
  getIt.registerLazySingleton<FirebaseAuthI>(() => FireBaseAuthImpl());
  getIt.registerLazySingleton<FirebaseStoreI>(() => FirebaseStoreImpl());
}
