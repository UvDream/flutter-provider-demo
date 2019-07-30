import 'dart:async';

class CounterBloc {
  StreamController<int> _streamController;

  Stream<int> _stream;
  int _count;
  String _inputVal;

  CounterBloc() {
    _count = 0;
    _inputVal = '呵呵';
    _streamController = StreamController.broadcast();
    _stream = _streamController.stream;
  }

  Stream<int> get stream => _stream;
  int get count => _count;
  String get inputVal => _inputVal;
  addCounter() {
    _streamController.sink.add(++_count);
  }

  subCounter() {
    _streamController.sink.add(--_count);
  }

  inputChange(String val) {
    print('状态管理');
    print(val);
    _inputVal = val;
//    _stringController.sink.add(_inputVal);
  }

  dispose() {
    _streamController.close();
  }
}
