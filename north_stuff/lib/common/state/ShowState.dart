import 'package:north_stuff/model/loading_status.dart';
import 'package:north_stuff/model/ShoesInfo.dart';
import 'package:meta/meta.dart';

class ShowState {
  ShowState({@required this.loadingStatus, this.info, this.params});

  final LoadingStatus loadingStatus;
  final List<ShoesInfo> info;
  final Map<String,dynamic> params;

  factory ShowState.inital() {
    return ShowState(
      loadingStatus: LoadingStatus.idle,
      info: List<ShoesInfo>(),
    );
  }
}
