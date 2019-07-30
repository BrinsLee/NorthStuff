import 'package:north_stuff/common/state/ShowState.dart';
import 'package:meta/meta.dart';
import 'package:north_stuff/common/reducer/showReducer.dart';

class AppState {
  AppState({@required this.showState});

  final ShowState showState;
  factory AppState.inital(){
    return AppState(
      showState: ShowState.inital()
    );
  }
}

AppState appReducer(AppState state, dynamic action){
  return AppState(
      showState: showReducer(state.showState,action)
  );
}
