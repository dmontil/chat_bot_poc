import 'package:bloc/bloc.dart';
import 'package:chat_bot_poc/shared/exceptions/log.dart';

class BlocDebugObserver extends BlocObserver {
  const BlocDebugObserver();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    printLog('Bloc: onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    printLog('Bloc: onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}
