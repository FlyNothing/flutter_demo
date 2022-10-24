import 'package:flutter/material.dart';
import 'package:flutter_demo/common/util/global_widget.dart';
import 'package:flutter_demo/plugin/imagepicker/base_image_picker_menu_config.dart';

class BaseImagePickerMenuPage extends StatelessWidget {
  const BaseImagePickerMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarStandard(title: 'ImagePicker测试'),
      body: _getBody(),
    );
  }

  Widget _getBody() {
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        leading: Text(baseImagePickerMenuList[index].name),
        trailing: IconButton(
          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => baseImagePickerMenuList[index].page)),
          icon: Icon(
            Icons.navigate_next,
            color: Colors.black.withOpacity(0.2),
          ),
        ),
      ),
      itemCount: baseImagePickerMenuList.length,
    );
  }
}
