import 'package:kt_dart/collection.dart';
import 'package:north_stuff/model/ShoesInfo.dart';

class InitCompleteAction {
}

class RequestShowsAction {

}

class ReceivedShowsAction{
  ReceivedShowsAction(this.shows);
  final KtList<ShoesInfo> shows;
}

class ErrorLoadingShowsAction{

}
