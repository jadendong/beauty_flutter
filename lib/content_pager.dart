import 'package:beatuy_flutter/card_recommend.dart';
import 'package:beatuy_flutter/card_share.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'custom_appbar.dart';

class ContentPager extends StatefulWidget {
  final ValueChanged<int> onPageChanged;
  final ContentPagerController contentPagerController;

  // 构造方法，可选参数，初始化列表
  const ContentPager({Key key, this.onPageChanged, this.contentPagerController})
      : super(key: key);

  @override
  _ContentPagerState createState() => _ContentPagerState();
}

class _ContentPagerState extends State<ContentPager> {
  static List<Color> _colors = [
    Colors.blue,
    Colors.red,
    Colors.deepOrange,
    Colors.teal,
  ];

  PageController _pageController = PageController(
    viewportFraction: 0.8,
  );

  @override
  void initState() {
    if (widget.contentPagerController != null) {
      widget.contentPagerController._pageController = _pageController;
    }
    _statusBar();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CustomAppbar(),
        Expanded(
          child: PageView(
            onPageChanged: widget.onPageChanged,
            controller: _pageController,
            children: <Widget>[
              _wrapItem(CardRecommend()),
              _wrapItem(CardShare()),
              _wrapItem(CardRecommend()),
              _wrapItem(CardRecommend()),
            ],
          ),
        )
      ],
    );
  }

  Widget _wrapItem(Widget widget) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: widget
    );
  }

  // 沉浸式状态栏
  _statusBar() {
    SystemUiOverlayStyle uiOverlayStyle = SystemUiOverlayStyle(
      systemNavigationBarColor: Color(0xFF000000),
      systemNavigationBarDividerColor: null,
      statusBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    );
    SystemChrome.setSystemUIOverlayStyle(uiOverlayStyle);
  }
}

class ContentPagerController {
  PageController _pageController;

  void jumpToPage(int page) {
    // dart 编程技巧，安全调用: 问好加.
    _pageController?.jumpToPage(page);
  }
}
