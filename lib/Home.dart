import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List _lista = ['Anderson', 'Fulano', 'Ciclano', 'Beltrano'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Widgets'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              child: ListView.builder(
            itemCount: _lista.length,
            itemBuilder: (context, index) {
              final item = _lista[index];
              return Dismissible(
                  background: Container(
                    color: Colors.green,
                    padding: EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Icon(
                          Icons.edit,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  secondaryBackground: Container(
                    color: Colors.red,
                    padding: EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  direction: DismissDirection.horizontal,
                  onDismissed: (dismissDirection) {
                    if (dismissDirection == DismissDirection.endToStart) {
                      print("direcao: end to start");
                    } else if (dismissDirection ==
                        DismissDirection.startToEnd) {
                      print("direcao: start to end");
                    }

                    setState(() {
                      _lista.removeAt(index);
                    });
                  },
                  key: Key(item),
                  child: ListTile(
                    title: Text(item),
                  ));
            },
          )),
        ],
      ),
    );
  }
}
