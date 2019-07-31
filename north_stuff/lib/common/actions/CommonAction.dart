import 'package:north_stuff/model/ShoesInfo.dart';

class InitCompleteAction {
}

class RequestShowsAction {

}

class ReceivedShowsAction{
  ReceivedShowsAction(this.shows);
  final List<ShoesInfo> shows;
}

class ErrorLoadingShowsAction{

}
