import 'package:north_stuff/model/ShoesInfo.dart';

class InitCompleteAction {
}

class RequestShowsAction {
  RequestShowsAction(this.params);
  final Map<String, dynamic> params;
}

class ReceivedShowsAction{
  ReceivedShowsAction(this.shows);
  final List<ShoesInfo> shows;
}

class ErrorLoadingShowsAction{

}
