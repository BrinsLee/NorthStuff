import 'package:north_stuff/model/loading_status.dart';
import 'package:north_stuff/model/ShoesInfo.dart';
import 'package:meta/meta.dart';
import 'package:kt_dart/collection.dart';

class ShowState {
  ShowState({@required this.loadingStatus, @required this.info});

  final LoadingStatus loadingStatus;
  final KtList<ShoesInfo> info;

  factory ShowState.inital() {
    return ShowState(
      loadingStatus: LoadingStatus.idle,
      info: emptyList(),
    );
  }
}
