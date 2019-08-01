import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/select.dart';

class SelectPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('select'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Text(Provider.of<SelectProvider>(context).isLeft.toString()),
              RaisedButton(
                onPressed: () {
                  Provider.of<SelectProvider>(context).changeSelect(false);
                },
                child: Text('取反'),
              )
            ],
          ),
        ));
  }
}
