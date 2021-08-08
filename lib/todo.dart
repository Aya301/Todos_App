import 'package:flutter/material.dart';

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ToDo',
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: todos(),
      ),
    );
  }
}

class todos extends StatefulWidget {
  todos({Key key,this.title}):super(key: key);
  final String title;
  @override
  _todosState createState()=> _todosState();
}
class _todos extends StatefulWidget{
  @override
  _todosState createState()=> _todosState();
}
class _todosState extends State<todos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text('Todos',
          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
        centerTitle: true,
        bottom: TabBar(
          tabs: [
            Tab(
              text: 'ALL',
              icon: Icon(Icons.all_inbox),
            ),
            Tab(
              text: 'Incomplete',
              icon: Icon(Icons.insert_comment),
            ),
            Tab(
              text: 'Complete',
              icon: Icon(Icons.assignment_turned_in),
            ),
          ],
        ),
        backgroundColor: Colors.grey.shade900,
      ),
      body: TabBarView(
        children: [
          Column(
            children: [
              Text('ALL',style:TextStyle(color: Colors.white,fontSize: 50) ,)
            ],
          ),
          Column(
            children: [
              Text('Incomplete',style:TextStyle(color: Colors.white,fontSize: 50) ,)
            ],
          ),
          Column(
              children: [
                Text('Complete',style:TextStyle(color: Colors.white,fontSize: 50) ,)
              ]
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        backgroundColor: Colors.grey.shade900,
        child: Icon(Icons.add),
        onPressed: (){
          showDialog(context: context,
            barrierDismissible: false,
            builder: (context)
            {
              return AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                title: Text('Add ToDo',style: TextStyle(fontSize: 20,
                    fontWeight: FontWeight.bold),
                ),
                content: Column(
                    children: [
                      Text('Title',style: TextStyle(fontSize: 15,
                          color: Colors.grey ),),
                      TextField(),
                      Padding(padding: EdgeInsets.only(top: 15)),
                      Text('Description',style: TextStyle(fontSize: 15,
                          color: Colors.grey  ),),
                      TextField(),
                    ]
                ),
                actions: [
                  Padding(padding: EdgeInsets.only(left: 50)),
                  InkWell(
                    child:RaisedButton(
                      color: Colors.grey.shade900,
                      child:Text('           Save           ',
                        style: TextStyle(color: Colors.white,
                            fontWeight: FontWeight.bold,fontSize: 15),),
                      onPressed: () {
                        Navigator.pushReplacement(context,
                          MaterialPageRoute(
                              builder: (context) => todos()),
                        );
                      },
                    ),
                  ),
                  InkWell(
                    child:RaisedButton(
                        color: Colors.grey.shade900,
                        child:Text('Cancel',
                          style: TextStyle(color: Colors.white,
                              fontWeight: FontWeight.bold,fontSize: 15),),
                        onPressed: () { Navigator.of(context).pop();}
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
      backgroundColor: Colors.grey.shade800,
    );
  }
}