import 'package:flutter/material.dart';
import 'package:flutter_demo/common/util/text_style.dart';

/// 标准文本按钮
///
/// text: 文本内容[必须]
///
/// onPressed: 按钮执行函数[必须]
class StandardTextButton extends StatelessWidget {
  const StandardTextButton(this.text, this.onPressed, {Key? key}) : super(key: key);
  final String text;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(EdgeInsets.zero),
        overlayColor: MaterialStateProperty.all(Colors.blue),
      ),
      onPressed: onPressed,
      child: Text(text, style: size14W400(color: Colors.white)),
    );
  }
}

/// 标准图标按钮
///
/// icon: 图标[必须]
///
/// onPressed: 按钮执行函数[必须]
class StandardIconButton extends StatelessWidget {
  const StandardIconButton(this.icon, this.onPressed, {this.color, Key? key}) : super(key: key);
  final IconData? icon;
  final Function()? onPressed;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        icon,
        color: color ?? Colors.black.withOpacity(0.2),
      ),
    );
  }
}

/// 标准文本框
///
/// controller: 控制器[必须]
///
/// hintText: 默认文本[可选]
///
/// keyboardType: 键盘方式[可选]
class StandardTextField extends StatelessWidget {
  const StandardTextField(this.controller, {this.hintText, this.keyboardType, Key? key}) : super(key: key);
  final TextEditingController? controller;
  final String? hintText;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        // 内容边距设置为0
        contentPadding: const EdgeInsets.symmetric(vertical: 0),
        hintText: hintText,
        // 设置填充颜色
        fillColor: Colors.grey[100],
        filled: true,
        // 边框
        border: const OutlineInputBorder(borderSide: BorderSide(width: 1)),
      ),
      keyboardType: keyboardType,
      // 文本垂直居中
      textAlignVertical: TextAlignVertical.center,
      // 文本水平居中
      textAlign: TextAlign.center,
      controller: controller,
    );
  }
}

/// 标准下拉框
///
/// valueMap: 下拉框数据及显示值链表[必须]
///
/// onChanged: 数据变化时执行的函数[必须]
class StandardDropdownButtonFormField extends StatelessWidget {
  const StandardDropdownButtonFormField(this.valueMap, this.onChanged, {Key? key}) : super(key: key);
  final Map<int, String> valueMap;
  final void Function(dynamic)? onChanged;

  @override
  Widget build(BuildContext context) {
    List<MapEntry<int, String>> entryList = List.from(valueMap.entries);
    return DropdownButtonFormField(
      isExpanded: true,
      decoration: InputDecoration(
        // 内容边距设置为0
        contentPadding: const EdgeInsets.all(0),
        // 设置填充颜色
        fillColor: Colors.grey[100],
        filled: true,
        // 边框
        border: const OutlineInputBorder(borderSide: BorderSide(width: 1)),
      ),
      alignment: Alignment.center,
      value: entryList[0].key,
      items: List.generate(
        entryList.length,
        (index) => DropdownMenuItem(
          alignment: AlignmentDirectional.center,
          value: entryList[index].key,
          child: Text(entryList[index].value),
        ),
      ),
      onChanged: onChanged,
    );
  }
}
