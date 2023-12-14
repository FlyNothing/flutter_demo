import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:flutter_demo/common/util/global_widget.dart';
import 'package:flutter_demo/common/util/text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FlutterBluePlusPage extends StatefulWidget {
  const FlutterBluePlusPage({Key? key}) : super(key: key);

  @override
  State<FlutterBluePlusPage> createState() => _FlutterBluePlusPageState();
}

class _FlutterBluePlusPageState extends State<FlutterBluePlusPage> {
  final List<BluetoothDevice> _devs = List.empty(growable: true);
  StreamSubscription<List<ScanResult>>? scanStream;
  StreamSubscription<BluetoothConnectionState>? stateStream;
  StreamSubscription<List<int>>? readStream;
  BluetoothCharacteristic? writeCs;

  @override
  void initState() {
    super.initState();
    _bleScanDev();
  }

  @override
  void dispose() {
    super.dispose();
    readStream?.cancel();
    stateStream?.cancel();
    scanStream?.cancel();
    FlutterBluePlus.stopScan();
  }

  /// 扫描设备
  Future _bleScanDev() async {
    if (await FlutterBluePlus.isScanning.last) return;
    FlutterBluePlus.startScan(timeout: const Duration(seconds: 30), withKeywords: ["C01", "E01"]);
    scanStream?.cancel();
    scanStream = FlutterBluePlus.onScanResults.listen((srs) {
      // ScanResult{
      //    device: BluetoothDevice{remoteId: AC:E3:42:87:25:CA, platformName: HONOR MagicWatch 2-5CA, services: null},
      //    advertisementData: AdvertisementData{
      //                                  advName: HONOR MagicWatch 2-5CA,
      //                                  txPowerLevel: 0,
      //                                  connectable: true,
      //                                  manufacturerData: {637: [1, 3, 3, 255, 255]},
      //                                  serviceData: {fdee: [1, 1, 0, 15, 1]},
      //                                  serviceUuids: []
      //                                  },
      //    rssi: -98,
      //    timeStamp: 2023-12-13 14:51:24.447898
      //    }
      int newDevCnt = 0;
      for (ScanResult sr in srs) {
        String advName = sr.device.advName;
        if (_devs.indexWhere((dev) => dev.advName == sr.device.advName) < 0) {
          debugPrint("ScanResult filter: advName = $advName");
          newDevCnt++;
          _devs.add(sr.device);
        }
      }
      if (newDevCnt > 0) {
        setState(() {});
      }
    });
  }

  /// 连接设备
  void _bleConnectDev(BluetoothDevice sd) {
    stateStream?.cancel();
    stateStream = sd.connectionState.listen((state) {
      debugPrint("BluetoothConnectionState: name = ${state.name}");
      if (state == BluetoothConnectionState.connected) {
        // 连接
        _bleDiscoverServices(sd);
      } else if (state == BluetoothConnectionState.disconnected) {
        // 断连 - 重连
        Future.delayed(const Duration(milliseconds: 500), () => _bleConnectDev(sd));
      }
    });
    sd.connect();
  }

  /// 发现服务
  Future<void> _bleDiscoverServices(BluetoothDevice sd) async {
    List<BluetoothService> services = await sd.discoverServices(timeout: 5);
    for (BluetoothService service in services) {
      for (BluetoothCharacteristic cs in service.characteristics) {
        if (cs.properties.read) {
          readStream?.cancel();
          readStream = cs.onValueReceived.listen((data) {
            debugPrint("ValueReceived: data = $data");
          });
        } else if (cs.properties.write) {
          writeCs = cs;
        }
      }
    }
  }

  /// 写入数据
  void _bleWrite(String content) {
    writeCs?.write(content.codeUnits);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarStandard(title: 'FlutterBluePlus测试'),
      body: _getBody(),
    );
  }

  Widget _getBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _getTitle(_devs.isEmpty ? "搜索设备中···" : "设备列表："),
        _getScanResult(),
      ],
    );
  }

  Widget _getTitle(String text) {
    return Padding(
      padding: EdgeInsets.only(left: 10.w, top: 20.h),
      child: Text(text, style: size18W500()),
    );
  }

  Widget _getScanResult() {
    return SizedBox(
      height: 0.8.sh,
      child: GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 每行个数
          mainAxisSpacing: 20.h, // 主轴方向间距
          crossAxisSpacing: 20.w, // 辅轴方向间距
          childAspectRatio: 1.8, // 纵轴缩放比例
        ),
        itemCount: _devs.length,
        itemBuilder: (context, index) => GestureDetector(
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.w),
              color: Colors.grey.shade200,
            ),
            child: Text(_devs[index].advName, overflow: TextOverflow.ellipsis, maxLines: 1, style: size16W500()),
          ),
          onTap: () {
            BluetoothDevice sd = _devs.firstWhere((dev) => dev.advName == _devs[index].advName);
            _bleConnectDev(sd);
          },
        ),
      ),
    );
  }
}
