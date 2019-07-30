import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/stream.dart';
import './consumer.dart';

class StreamPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('流设置'),
      ),
      body: Center(
        child: StreamBuilder(
          initialData: Provider.of<CounterBloc>(context).inputVal,
          stream: Provider.of<CounterBloc>(context).stream,
          builder: (context, snapshot) {
            return Column(
              children: <Widget>[
//                Text(inputVal),
                TextField(
                  maxLength: 20,
                  style: TextStyle(
                      fontSize: 20.0, color: Theme.of(context).primaryColor),
                  keyboardType: TextInputType.number,
                  cursorColor: Colors.green,
                  onChanged: (val) {
                    Provider.of<CounterBloc>(context).inputChange(val);
                  },
                  // cursorRadius: Radius.circular(20),
                  // cursorWidth: 40,
                  decoration: InputDecoration(
                      labelText: 'Title',
                      hintText: '请输入',
                      helperText: '输入后下方文字更改',
                      filled: true,
//                      fillColor: Colors.blue.shade100,
                      prefixIcon: Icon(Icons.local_airport),
                      suffixIcon: Icon(Icons.local_drink),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0))),
                ),
                Text('stream的应用'),
                Text(Provider.of<CounterBloc>(context).inputVal.toString())
//                Text(Provider.of<CounterBloc>(context).count.toString()),
//                RaisedButton(
//                  child: Text("+"),
//                  onPressed: () {
//                    Provider.of<CounterBloc>(context).addCounter();
//                  },
//                ),
//                RaisedButton(
//                  child: Text("-"),
//                  onPressed: () {
//                    Provider.of<CounterBloc>(context).subCounter();
//                  },
//                ),
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
