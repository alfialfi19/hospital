import 'dart:math';

mixin RandomMixin {
  String getRandomTime() {
    String _result = "";
    List<String> _arrTime = [
      "08.00",
      "10.00",
      "08.30",
      "13.00",
      "14.30",
      "09.45",
      "10.45",
    ];
    final random = Random();

    _result = _arrTime[random.nextInt(_arrTime.length)];

    return _result;
  }
}
