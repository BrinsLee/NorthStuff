import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.white, accentColor: Colors.grey[600]),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);
  String title = '北货';

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int indexCurrent = 1;
  final _widgetOptions = [Text("主页"), Text("分类"), Text("我的")];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title,style: TextStyle(color: Colors.black ,fontSize: 18 ,fontWeight: FontWeight.w600 ,wordSpacing: 5),),
        elevation: 0,
      ),
      body: Center(
        child: _widgetOptions.elementAt(indexCurrent),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('主页')),
          BottomNavigationBarItem(icon: Icon(Icons.widgets), title: Text('分类')),
          BottomNavigationBarItem(icon: Icon(Icons.person), title: Text('主页')),
        ],
        currentIndex: indexCurrent,
        fixedColor: Colors.blue[300],
        onTap: _onItemTap,
      ),
    );
  }

  void _onItemTap (int index){
    setState(() {
      indexCurrent = index;
    });
  }
}
