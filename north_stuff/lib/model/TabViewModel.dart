import 'package:north_stuff/model/loading_status.dart';
import 'package:redux/redux.dart';
import 'package:north_stuff/common/state/AppState.dart';
import 'package:north_stuff/model/ShoesInfo.dart';
import 'package:meta/meta.dart';

class TabViewModel {
  TabViewModel({
     @required this.status,
     @required this.events});

  final LoadingStatus status;
  final List<ShoesInfo> events;

  static TabViewModel fromStore(Store<AppState> store) {
    return TabViewModel(status: store.state.showState.loadingStatus, events: store.state.showState.info);
  }
}
