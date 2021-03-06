import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Flutter App",
      theme: new ThemeData(primaryColor: Colors.blue,),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin{ //penambahan
  TabController tabController;
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    tabController = new TabController(length: 2, vsync: this); //penambahan
    var tabBarItem = new TabBar(
      tabs: <Widget>[
        new Tab(
          icon: new Icon(Icons.list),
        ),
        new Tab(
          icon: new Icon(Icons.list),
        ),
        new Tab(
          icon: new Icon(Icons.grid_on),
        ),
      ],
      controller: tabController,
      indicatorColor: Colors.white,
    );

    var listItem = new ListView.builder(
      itemCount: 10,
      itemBuilder: (BuildContext context, int index){
        return new ListTile(
          title: new Card(
            elevation: 5.0,
            child: new Container(
              alignment: Alignment.center,
              margin: new EdgeInsets.only(top:10.0, bottom: 10.0),
              child: new Text("Daftar Item $index"),
            ),
          ),
          onTap: (){
            showDialog(
              barrierDismissible: false,
              context: context,
              child: new CupertinoAlertDialog(
                title: new Column(
                  children: <Widget>[
                    new Text("Daftar View"),
                    new Icon(
                      Icons.favorite,
                      color: Colors.red,
                    )
                  ],
                ),
                content: new Text("Item terpilih $index"),
                actions: <Widget>[
                  new FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: new Text("OK"),
                  )
                ],
              )
            );
          },
        );
      }
    );

    var gridView = new GridView.builder(
      itemCount: 10,
      gridDelegate: 
          new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3) ,
      itemBuilder: (BuildContext context, int index) {
        return new GestureDetector(
          child: new Card(
            elevation: 5.0,
            child: new Container(
              alignment: Alignment.center,
              child: new Text("Item $index"),
            ),
          ),
          onTap: (){
            showDialog(
              barrierDismissible: false,
              context: context,
              child: new CupertinoAlertDialog(
                title: new Column(
                  children: <Widget>[
                    new Text("GridView"),
                    new Icon(
                      Icons.favorite,
                      color:Colors.green,
                    ),
                  ],
                ),
                content: new Text("Item yang dipilih $index"),
                actions: <Widget>[
                  new FlatButton(
                    onPressed: (){
                      Navigator.of(context).pop();
                    },
                    child: new Text("OK"),
                  )
                ],
              )
            );
          },
        );
      }
    );

    return new DefaultTabController(
      length: 2,
      child: new Scaffold(
        appBar: new AppBar(
          title: new Text("TabBar"),
          bottom: tabBarItem,
        ),
        body: new TabBarView(
          controller: tabController,
          children: <Widget>[
            listItem,
            gridView,
          ],
        ),
      ),
    );
  }
}