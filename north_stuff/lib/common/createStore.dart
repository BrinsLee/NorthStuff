import 'package:north_stuff/common/state/AppState.dart';
import 'package:redux/redux.dart';
import 'package:north_stuff/api/Api.dart';
import 'package:north_stuff/common/middleware/StuffMiddleware.dart';

Store<AppState> createStore(){

  return Store(
    appReducer,
    initialState: AppState.inital(),
    distinct: true,
    middleware: [
      StuffMiddleware(),
    ]
  );
}