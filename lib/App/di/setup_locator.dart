import 'package:get_it/get_it.dart';
import 'package:loja_virtual/App/data/repository/base_repository_impl.dart';
import 'package:loja_virtual/App/data/source/remote/firebase/firebaseAuth/firebase_auth_I.dart';
import 'package:loja_virtual/App/data/source/remote/firebase/firebaseAuth/firebase_auth_impl.dart';
import 'package:loja_virtual/App/data/source/remote/firebase/firebaseStore/firebase_store_I.dart';
import 'package:loja_virtual/App/data/source/remote/firebase/firebaseStore/firebase_store_Impl.dart';
import 'package:loja_virtual/App/domain/repository/base_repository.dart';
import 'package:loja_virtual/App/domain/usecase/base_usecase_impl.dart';
import 'package:loja_virtual/App/presentation/ui/base/base_viewmodel.dart';
import 'package:loja_virtual/App/presentation/ui/login/login_viewmodel.dart';
import 'package:loja_virtual/App/presentation/ui/signUp/sign_up_viewmodel.dart';

final getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton<BaseScreenViewModel>(() => BaseScreenViewModel());
  getIt.registerLazySingleton<SignUpViewModel>(() => SignUpViewModel());
  getIt.registerLazySingleton<LoginViewModel>(() => LoginViewModel());
  getIt.registerLazySingleton<BaseRepository>(() => BaseRepositoryImpl());
  getIt.registerLazySingleton<BaseUseCase>(() => BaseUseCaseImpl());
  getIt.registerLazySingleton<FirebaseAuthI>(() => FireBaseAuthImpl());
  getIt.registerLazySingleton<FirebaseStoreI>(() => FirebaseStoreImpl());
}
