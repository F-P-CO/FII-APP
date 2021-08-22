import 'dart:async';

class Debouncer {
  final Duration delay;
  Timer? _timer;
  late void Function()? _action;

  Debouncer({
    required this.delay,
  });

  void call(void Function() action) {
    _timer?.cancel();
    _action = action;
    _timer = Timer(delay, action);
  }

  void execute() {
    if (_action != null) {
      _action!();
    }
  }

  void dispose() {
    _timer?.cancel();
  }
}
