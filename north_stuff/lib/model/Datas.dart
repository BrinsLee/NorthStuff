import 'package:north_stuff/model/ShoesInfo.dart';

class Datas {
  String msg;
  int num;
  int status;
  List<ShoesInfo> datas;
  Datas({this.msg, this.num, this.status, this.datas});

  factory Datas.fromJson(Map<String, dynamic> json){
    final originList = json['datas'] as List;
    List<ShoesInfo> infos = originList.map((value) => ShoesInfo.fromJson(value)).toList();
    return Datas(msg : json['msg'],num: json['num'],
        status: json['status'],datas: infos);
  }
}