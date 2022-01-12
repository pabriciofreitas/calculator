class Memory {
  static const operations = ["%", "/", "x", "-", "+", "="];
  final List _buffer = [0.0, 0.0];
  int _bufferIndex = 0;
  String _operation = "";
  String _value = "0";
  bool _wipeValue = false;
  String _lastCommand = "";
  void applyCommand(String command) {
    if (_isReplacingOperation(command)) {
      _operation = command;
    } else if (command == "C") {
      _clear();
    } else if (command == "backButton") {
      _removeLastDigit();
    } else if (operations.contains(command)) {
      _setOperation(command);
    } else {
      _addDigit(command);
    }
    _lastCommand = command;
    print(_operation);
  }

  bool _isReplacingOperation(String command) {
    return operations.contains(_lastCommand) &&
        operations.contains(command) &&
        _lastCommand != "=" &&
        command != "=";
  }

  void _setOperation(String newOperation) {
    bool isEqualSign = newOperation == "=";
    if (_bufferIndex == 0) {
      if (!isEqualSign) {
        _operation = newOperation;
        _bufferIndex = 1;
      }
    } else {
      _buffer[0] = _calculate();
      _buffer[1] = 0.0;
      String _temp = _buffer[0].toString();
      _value = _temp.endsWith(".0") ? _temp.split(".")[0] : _temp;

      //é simbolo de =?

      _operation = isEqualSign ? "" : newOperation;
      _bufferIndex = isEqualSign ? 0 : 1;
      // _bufferIndex = 0;

    }
    _wipeValue = isEqualSign ? false : true;
  }

  void _removeLastDigit() {
    _value = _value.substring(0, _value.length - 1);

    _buffer[_bufferIndex] = double.tryParse(_value) ?? 0;
  }

  void _addDigit(String digit) {
    //ponto
    final isDot = digit == ".";
    //limpar
    final wipeValue = (_value == "0" && !isDot) || _wipeValue;
    if (isDot && _value.contains(".") && !wipeValue) {
      return;
    }
    final emptyValue = isDot ? "0" : "";
    //atual
    final currentValue = wipeValue ? emptyValue : _value;
    _value = currentValue + digit;
    _wipeValue = false;

    _buffer[_bufferIndex] = double.tryParse(_value) ?? 0;
    print(_buffer);
  }

  _clear() {
    _wipeValue = false;
    _value = "0";
    _buffer.setAll(0, [0.0, 0.0]);
    // _buffer[0] = 0.0;
    // _buffer[1] = 0.0;
    _bufferIndex = 0;
    _operation = "";
  }

  _calculate() {
    switch (_operation) {
      case "%":
        double _temp = _buffer[1] / 100;
        return _buffer[0] * _temp;
      case "/":
        return _buffer[0] / _buffer[1];
      case "x":
        return _buffer[0] * _buffer[1];
      case "-":
        return _buffer[0] - _buffer[1];
      case "+":
        return _buffer[0] + _buffer[1];

      default:
        return _buffer[0];
    }
  }

  String get value => _value;
}
