import 'package:north_stuff/common/state/ShowState.dart';
import 'package:north_stuff/common/actions/CommonAction.dart';
import 'package:north_stuff/model/loading_status.dart';

ShowState showReducer(ShowState state, dynamic action) {
  if (action is RequestShowsAction) {
    return ShowState(loadingStatus: LoadingStatus.loading,params: action.params);
  } else if (action is ReceivedShowsAction) {
    return ShowState(loadingStatus: LoadingStatus.success, info: action.shows );
  } else if (action is ErrorLoadingShowsAction) {
    return ShowState(loadingStatus: LoadingStatus.error);
  }
}
