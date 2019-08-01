import 'dart:async';

class CounterBloc {
  StreamController<String> _streamController;

  Stream<String> _stream;
  String _inputVal;

  CounterBloc() {
    _inputVal = '呵呵';
    _streamController = StreamController.broadcast();
    _stream = _streamController.stream;
  }

  Stream<String> get stream => _stream;
  String get inputVal => _inputVal;

  inputChange(String val) {
    print('状态管理');
    print(val);
    _inputVal = val;
  }

  dispose() {
    _streamController.close();
  }
}
