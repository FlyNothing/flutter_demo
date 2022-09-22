// ignore_for_file: avoid_print

import 'dart:async';

once() async {
  Timer(const Duration(milliseconds: 1000), () => print("once"));
}

periodic() async {
  Timer.periodic(const Duration(milliseconds: 1000), (timer) => print("timer"));
}

run() async {
  Timer.run(() {
    print("run");
  });
}

int cnt = 0;
cancelPeriodic(int sum) async {
  cnt = 0;
  Timer.periodic(const Duration(milliseconds: 1000), (timer) {
    cnt++;
    print("timer: $cnt");
    if (sum <= cnt) {
      timer.cancel();
    }
  });
}

void main(List<String> args) {
  cancelPeriodic(10);
}
