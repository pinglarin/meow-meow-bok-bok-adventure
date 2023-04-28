import 'package:flutter/material.dart';
import 'package:wireless_term_project/db/db.dart';
import 'package:wireless_term_project/db/mockdb.dart';

class LeaderboardScreen extends StatefulWidget {

  DB db = MockDB(); // no matter how you instantiate singleton, you will get the same object

  LeaderboardScreen({Key? key, DB? dbi}) : super(key: key){
    if(dbi != null){
      db = dbi;
    }
  }
  
  @override
  _LeaderboardScreenState createState() => _LeaderboardScreenState();
}

class _LeaderboardScreenState extends State<LeaderboardScreen> {
  static TextStyle datetimeHeaderStyle = const TextStyle(color: Colors.black, fontSize: 20);
  static TextStyle nameHeaderStyle = const TextStyle(color: Colors.black, fontSize: 20);
  static TextStyle scoreHeaderStyle = const TextStyle(color: Colors.black, fontSize: 20);

  static TextStyle datetimeTextStyle = const TextStyle(color: Colors.black, fontSize: 10);
  static TextStyle nameTextStyle = const TextStyle(color: Colors.black, fontSize: 10);
  static TextStyle scoreTextStyle = const TextStyle(color: Colors.black, fontSize: 10);


  Table scoresTable = Table(
      border: TableBorder.all(color: Colors.black),
      children: [
         TableRow(children: [
              Text('Datetime', style: datetimeHeaderStyle,),
              Text('Name', style: nameHeaderStyle),
              Text('Score', style: scoreHeaderStyle,),
          ]
        )
      ]
  );
  @override
  void initState(){
    super.initState();
    generateTable().then(
      (table) => setState(
        () {
          scoresTable = table;
        }
      )
    );
  }

  Future<Table> generateTable() async{
    Iterable<TableRow> tableContent = (await widget.db.getAllScore()).map(
      (e) => TableRow(children: [
        Text(e.created.toString(), style: datetimeTextStyle), 
        Text(e.name, style: nameTextStyle),
        Text(e.score.toString(), style: scoreTextStyle,)
      ])
    );

    List<TableRow> rows = [
      TableRow(children: [
        Text('Datetime', style: datetimeHeaderStyle,),
        Text('Name', style: nameHeaderStyle),
        Text('Score', style: scoreHeaderStyle,),
      ])
    ];
    rows.addAll(tableContent);
    Table t = Table(
      border: TableBorder.all(color: Colors.black),
      children: rows
    );
    return t;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Widget scoresTableListView = ListView(children: [
      Container(
        color: Colors.white,
        padding: EdgeInsets.all(20.0),
        child: scoresTable
      )
    ]);
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: scoresTableListView
      ),
    );
  }

}
