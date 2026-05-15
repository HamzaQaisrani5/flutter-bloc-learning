import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocObserver extends BlocObserver {
  // @override
  // // void onCreate(BlocBase bloc) {
  // //   super.onCreate(bloc);
  // //   log('$bloc');
  // // }

  // // @override
  // // void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
  // //   super.onChange(bloc, change);
  // //   log('$change');
  // // }

  @override
  void onTransition(
    Bloc<dynamic, dynamic> bloc,
    Transition<dynamic, dynamic> transition,
  ) {
    super.onTransition(bloc, transition);
    log('${bloc.runtimeType}');
    log(
      'Currentstate: ${transition.currentState.runtimeType}, Event: ${transition.event.runtimeType}, NextState: ${transition.nextState.runtimeType}',
    );
  }
}
