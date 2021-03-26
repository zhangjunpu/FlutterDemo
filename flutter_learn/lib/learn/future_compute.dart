import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class FutureCompute extends StatefulWidget {
  @override
  _FutureComputeState createState() => _FutureComputeState();
}

class _FutureComputeState extends State<FutureCompute> {
  @override
  void initState() {
    runCompute();
    print('_FutureComputeState.initState');
    super.initState();
  }

  void runCompute() async {
    // compute传入的方法必须是全局方法
    var result = await compute(calc, 100);
    print('result: $result');
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

int calc(int count) {
  var num = 0;
  for (int i = 0; i < count; i++) {
    num += i;
  }
  return num;
}
