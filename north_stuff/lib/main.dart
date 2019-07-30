import 'package:flutter/material.dart';
import 'package:north_stuff/utils/DataUtils.dart';
import 'package:north_stuff/utils/ThemeUtils.dart';
import 'package:north_stuff/pages/HomePage.dart';
import 'package:north_stuff/pages/SortPage.dart';
import 'package:north_stuff/pages/MePage.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:north_stuff/common/createStore.dart';
import 'package:north_stuff/common/state/AppState.dart';

void main() => runApp(MyHomePage(store));
final store = createStore();

class MyHomePage extends StatefulWidget {
  MyHomePage(this.store);

  final Store<AppState> store;
  String title = '北货';

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int indexCurrent = 0;

  Color themeColor = ThemeUtils.currentColorTheme;
  var pages;
  var _body;

  @override
  void initState() {
    super.initState();
    DataUtils.getColorTheme().then((index) {
      print('colorTheme: $index');
      if (index != null) {
        ThemeUtils.currentColorTheme = ThemeUtils.supportColors[index];
      }
    });
    pages = <Widget>[HomePage(), SortPage(), MePage()];
  }

  @override
  Widget build(BuildContext context) {
    _body = IndexedStack(
      children: pages,
      index: indexCurrent,
    );
    return StoreProvider<AppState>(
      store: widget.store,
      child: MaterialApp(
        theme: ThemeData(
            primaryColor: Colors.white, accentColor: Colors.grey[600]),
        home: Scaffold(
          appBar: AppBar(
            title: Text(
              widget.title,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  wordSpacing: 5),
            ),
            elevation: 0,
            actions: <Widget>[
              IconButton(
                  icon: Icon(
                    Icons.search,
                    color: Colors.blue[200],
                  ),
                  onPressed: () {})
            ],
          ),
          body: _body,
          bottomNavigationBar: BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(Icons.home), title: Text('主页')),
              BottomNavigationBarItem(
                  icon: Icon(Icons.widgets), title: Text('分类')),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), title: Text('我的')),
            ],
            currentIndex: indexCurrent,
            fixedColor: themeColor,
            onTap: _onItemTap,
          ),
        ),
      ),
    );
  }

  void _onItemTap(int index) {
    setState(() {
      indexCurrent = index;
    });
  }
}
