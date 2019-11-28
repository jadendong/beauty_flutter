import 'package:beatuy_flutter/base_card.dart';
import 'package:flutter/material.dart';

// 分享的卡片
class CardShare extends BaseCard {
  @override
  _CardShareState createState() => _CardShareState();
}

class _CardShareState extends BaseCardState {
  @override
  topTitle(String title) {
    return super.topTitle('分享得联名卡');
  }

  @override
  topTitle2(String title) {
    return Padding(
      padding: EdgeInsets.only(bottom: 5),
      child: Text(
        ' / 第19期',
        style: TextStyle(fontSize: 10),
      ),
    );
  }

  @override
  Widget subTitle(String title) {
    return super.subTitle('分享给朋友最多得12天无限卡');
  }

  @override
  bottomContent() {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(top: 20),
        decoration: BoxDecoration(color: Color(0xfff6f7f9)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end, // 水平向右
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: 20, left: 15, bottom: 20),
                child: Image.network(
                    'http://www.devio.org/io/flutter_beauty/card_list.png'),
              ),
            ),
            Container(
              alignment: AlignmentDirectional.center, // 重写父布局的位置约束，位于父布局的
              child: Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: bottomTitle('29876678人 . 参与活动'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
