import 'package:flutter/material.dart';
import './pages/home.dart';
import './provider/counter.dart';
import 'package:provider/provider.dart';
import './provider/stream.dart';
import './provider/select.dart';

void main() {
  // Provide<T>会报错,添加这个不会报错,但是视图不会及时更新,原因见下面
  Provider.debugCheckInvalidValueType = null;
  final counter = CounterProvider();
  final textSize = 48;
  final stream = CounterBloc();

//  runApp(Provider<int>.value(
//    value: textSize,
//    child: ChangeNotifierProvider.value(
//      value: counter,
//      child: MyApp(),
//    ),
//  ));
//  Provider<T>.value 能够管理一个恒定的数据，并提供给子孙节点使用。我们只需要将数据在其 value 属性中声明即可。
//  ChangeNotifierProvider<T>.value 不仅能够提供数据供子孙节点使用，还可以在数据改变的时候通知所有听众刷新。(通过之前我们说过的 notifyListeners)
  runApp(MultiProvider(
    providers: [
      Provider.value(value: textSize),
      ChangeNotifierProvider.value(value: counter),
      Provider<CounterBloc>.value(value: stream)
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var select = SelectProvider();
    return MultiProvider(
      providers: [
        // Provider 只能提供恒定的数据，不能通知依赖它的子部件刷新。提示也说的很清楚了，假如你想使用一个会发生 change 的 Provider，请使用下面的 Provider。
        // ListenableProvider
        // ChangeNotifierProvider
        // ValueListenableProvider
        // StreamProvider
        // Provider<SelectProvider>.value(value: select)
        ChangeNotifierProvider(builder: (_) => SelectProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(),
      ),
    );
  }
}
