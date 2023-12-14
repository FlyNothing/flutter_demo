import 'package:flutter_demo/base/widget/bottom_sheet_page.dart';
import 'package:flutter_demo/base/widget/listview_gridview1_page.dart';
import 'package:flutter_demo/base/widget/listview_gridview2_page.dart';
import 'package:flutter_demo/base/widget/stack_gridview_page.dart';
import 'package:flutter_demo/base/widget/state_page.dart';
import 'package:flutter_demo/base/widget/widget_page.dart';
import 'package:flutter_demo/base/widget/bottomnavigationbar/navigation_bar_home_page.dart';
import 'package:flutter_demo/base/widget/flexible/flexible_page.dart';
import 'package:flutter_demo/base/widget/image/image_page.dart';
import 'package:flutter_demo/base/widget/progressindicator/progress_indicator_menu_config.dart';
import 'package:flutter_demo/base/widget/repaintboundary/repaint_boundary_page.dart';
import 'package:flutter_demo/base/widget/textfield/text_field_border_page.dart';
import 'package:flutter_demo/base/widget/transform/transform_page.dart';
import 'package:flutter_demo/base/widget/valuenotifier/value_notifier_page.dart';
import 'package:flutter_demo/common/page/base_menu_page.dart';
import 'package:flutter_demo/common/vo/base_menu_vo.dart';

List<BaseMenuVO> widgetMenuList = [
  BaseMenuVO("Widget测试", const WidgetPage()),
  BaseMenuVO("State测试", const StatePage()),
  BaseMenuVO("底部弹窗", const BottomSheetPage()),
  BaseMenuVO("ListView和GridView1", const ListviewGridview1Page()),
  BaseMenuVO("ListView和GridView2", const ListviewGridview2Page()),
  BaseMenuVO("Stack和GridView2", const StackGridviewPage()),
  BaseMenuVO("指示器", BaseMenuPage("指示器", progressIndicatorMenuList)),
  BaseMenuVO("隐藏NavigationBar", const NavigationBarHomePage()),
  BaseMenuVO("文本框边框", TextFieldBorderPage()),
  BaseMenuVO("截图", RepaintBoundaryPage()),
  BaseMenuVO("Flexible和Expanded", FlexiblePage()),
  BaseMenuVO("图片显示", const ImagePage()),
  BaseMenuVO("转换", const TransformPage()),
  BaseMenuVO("ValueNotifier", const ValueNotifierPage()),
];
