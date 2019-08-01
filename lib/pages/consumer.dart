import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/counter.dart';
import './select.dart';

// Consumer获取
class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Consumer获取'),
        ),
        body: Consumer2<CounterProvider, int>(
          builder: (context, CounterProvider counter, int textSize, _) =>
              Center(
                child: Column(
                  children: <Widget>[
                    Text(
                      '值: ${counter.value}',
                      style: TextStyle(
                        fontSize: textSize.toDouble(),
                      ),
                    ),
                    RaisedButton(
                      child: Text("+"),
                      onPressed: counter.increment,
                    ),
                    RaisedButton(
                      child: Text("-"),
                      onPressed: counter.reduce,
                    )
                  ],
                ),
              ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Text('Select页面'),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (BuildContext context) {
              return SelectPage();
            }));
          },
        ));
  }
}
