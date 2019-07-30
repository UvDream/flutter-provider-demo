import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/counter.dart';

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
        builder: (context, CounterProvider counter, int textSize, _) => Center(
              child: Column(
                children: <Widget>[
                  Text(
                    '值: ${counter.value}',
                    style: TextStyle(
                      fontSize: textSize.toDouble(),
                    ),
                  )
                ],
              ),
            ),
      ),
      floatingActionButton: Consumer<CounterProvider>(
        builder: (context, CounterProvider counter, child) =>
            FloatingActionButton(
              onPressed: counter.increment,
              child: child,
            ),
        child: Icon(Icons.add),
      ),
    );
  }
}
