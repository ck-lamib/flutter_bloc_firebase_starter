import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'dependency_injection.config.dart';

///this is used for configuring dependencies
final getIt = GetIt.instance;

@InjectableInit()
void configureDependencyInjection() => getIt.init();
