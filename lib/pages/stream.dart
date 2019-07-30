import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/stream.dart';
import './consumer.dart';

class StreamPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('流'),
      ),
      body: Center(
        child: StreamBuilder(
          initialData: Provider.of<CounterBloc>(context).count,
          stream: Provider.of<CounterBloc>(context).stream,
          builder: (context, snapshot) {
            return Column(
              children: <Widget>[
                Text(Provider.of<CounterBloc>(context).count.toString()),
                RaisedButton(
                  child: Text("+"),
                  onPressed: () {
                    Provider.of<CounterBloc>(context).addCounter();
                  },
                ),
                RaisedButton(
                  child: Text("-"),
                  onPressed: () {
                    Provider.of<CounterBloc>(context).subCounter();
                  },
                ),
              ],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (BuildContext context) {
            return TestPage();
          }));
        },
        tooltip: 'Increment',
        child: Text(
          'Consumer获取',
          style: TextStyle(fontSize: 10),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
