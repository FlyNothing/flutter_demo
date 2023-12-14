import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_demo/common/util/global_widget.dart';
import 'package:flutter_demo/common/util/standard_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photo_view/photo_view_gallery.dart';

class PhotoViewGalleryPage extends StatefulWidget {
  const PhotoViewGalleryPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PhotoViewGalleryPageState();
}

class _PhotoViewGalleryPageState extends State<PhotoViewGalleryPage> {
  final ImagePicker _imagePicker = ImagePicker();
  final List<Image> _images = List.empty(growable: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarStandard(title: 'PhotoViewGallery'),
      body: _getBody(context),
    );
  }

  Widget _getBody(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: Container(
            decoration: BoxDecoration(border: Border.all(width: 1)),
            width: double.infinity,
            height: double.infinity,
            child: _images.isEmpty
                ? const SizedBox.shrink()
                : PhotoViewGallery(
                    pageOptions: List.generate(_images.length, (index) => PhotoViewGalleryPageOptions(imageProvider: _images[index].image)),
                    reverse: false,
                    pageController: PageController(
                      initialPage: 0,
                      keepPage: false,
                      viewportFraction: 1,
                    ),
                    onPageChanged: (index) => debugPrint("----------index=$index"),
                    scrollDirection: Axis.horizontal,
                    scrollPhysics: const ClampingScrollPhysics(),
                    allowImplicitScrolling: false,
                  ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: StandardTextButton("相册列表", () => _pickMultiImage()),
          ),
        )
      ],
    );
  }

  Future<void> _pickMultiImage() async {
    List<XFile>? imageFiles = await _imagePicker.pickMultiImage();
    if (imageFiles.isNotEmpty) {
      setState(() {
        _images.clear();
        _images.addAll(List.generate(
          imageFiles.length,
          (index) => Image.file(File(imageFiles[index].path), fit: BoxFit.cover),
        ));
      });
    }
  }
}
