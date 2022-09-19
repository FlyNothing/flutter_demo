import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/common/util/global_widget.dart';

class CachedNetworkImagePage extends StatelessWidget {
  const CachedNetworkImagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarStandard(title: 'CachedNetworkImage测试'),
      body: _getBody(context),
    );
  }

  Widget _getBody(BuildContext context) {
    return Center(
      child: CachedNetworkImage(
        imageUrl: "https://upload.jianshu.io/users/upload_avatars/24076073/c9db8271-5b04-4634-bff5-4eb690ca641c.jpg",
        // imageBuilder: (context, imageProvider) => Container(
        //   decoration: BoxDecoration(
        //     image: DecorationImage(image: imageProvider, fit: BoxFit.cover, colorFilter: const ColorFilter.mode(Colors.red, BlendMode.colorBurn)),
        //   ),
        // ),
        // placeholder: (context, url) => const CircularProgressIndicator(),
        progressIndicatorBuilder: (context, url, downloadProgress) => CircularProgressIndicator(value: downloadProgress.progress),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }
}
