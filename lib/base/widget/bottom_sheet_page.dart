import 'package:flutter/material.dart';
import 'package:flutter_demo/common/util/global_widget.dart';

/// showModalBottomSheet和showBottomSheet
class BottomSheetPage extends StatelessWidget {
  const BottomSheetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarStandard(title: "BottomSheet测试"),
      // 加上Builder，否则showBottomSheet调用会出现异常
      // No Scaffold widget found.
      // BottomSheetDemoPage widgets require a Scaffold widget ancestor.
      body: Builder(builder: (context) => _getBody(context)),
    );
  }

  Widget _getBody(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textButtonStandard("showBottomSheet", () {
          showBottomSheet(
            context: context,
            builder: (context) => _getBottomSheet(),
          );
        }),
        textButtonStandard("showModalBottomSheet", () {
          showModalBottomSheet(
            barrierColor: Colors.black54,
            context: context,
            builder: (context) => _getBottomSheet(),
          );
        }),
      ],
    );
  }

  Container _getBottomSheet() {
    return Container(
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: Colors.green,
      ),
      height: 200,
      child: const Text(
        "BottomSheet",
      ),
    );
  }
}
