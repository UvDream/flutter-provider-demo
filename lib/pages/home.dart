import 'package:flutter/material.dart';
import './stream.dart';
import 'package:provider/provider.dart';
import '../provider/counter.dart';

// Provider.of<CounterProvider>(context)
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _counter = Provider.of<CounterProvider>(context);
    final textSize = Provider.of<int>(context).toDouble();
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Provider'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(
              '${_counter.value}',
              style: TextStyle(fontSize: textSize),
            ),
            RaisedButton(
              onPressed: () {
                Provider.of<CounterProvider>(context).increment();
              },
              child: Text("+"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (BuildContext context) {
            return StreamPage();
          }));
        },
        tooltip: 'Increment',
        child: Text(
          'stream获取',
          style: TextStyle(fontSize: 10),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
