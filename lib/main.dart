import 'package:flutter/material.dart';

void main()=> runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  title: "TODO APP",
  home: TODOAPP(),
),
);

class TODOAPP extends StatefulWidget {
  const TODOAPP({Key? key}) : super(key: key);

  @override
  _TODOAPPState createState() => _TODOAPPState();
}

class _TODOAPPState extends State<TODOAPP> {
  late String value;
  var listTODO = [''];

  addToDO(String item){
    setState(() {
      listTODO.add(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("TODO APP"),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: (){
            addToDO(value);
          },
        ),
        body: ListView.builder(
            itemCount: listTODO.length,
            itemBuilder: (context, index){
          return index == 0? Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Add Item"
              ),
              onChanged: (val){
                value = val;
              },
            ),
          ): Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: Icon(Icons.work),
                // trailing: Icon(Icons.work),
                title: Text('${listTODO[index]}', style: TextStyle(fontWeight: FontWeight.bold),),
              ),
            ),
          );
        }
        )
      ),
    );
  }
}



