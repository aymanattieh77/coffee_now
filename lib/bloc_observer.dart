import 'package:flutter_bloc/flutter_bloc.dart';

class MyBLocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print(bloc);

    print(change);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print(error.toString());
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    print(event);
    super.onEvent(bloc, event);
  }
}
