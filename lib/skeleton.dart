import 'package:flutter/material.dart';
import 'package:sspai/page/comment.dart';
import 'package:sspai/page/index.dart';
import 'package:sspai/page/matrix.dart';

class Skeleton extends StatefulWidget {
  Skeleton({Key key}) : super(key: key);

  @override
  _SkeletonState createState() => _SkeletonState();
}

class _Item {
  String name;
  IconData activeIcon, normalIcon;

  _Item(this.name, this.activeIcon, this.normalIcon);
}

class _SkeletonState extends State<Skeleton> {
  final itemNames = [
    _Item(
      'Index',
      Icons.line_style,
      Icons.list,
    ),
    _Item('Matrix', Icons.star, Icons.star_border),
    _Item('Me', Icons.perm_contact_calendar, Icons.perm_identity),
  ];

  List<Widget> pages;
  final pageNames = ["Index", "Matrix", "Me"];
  List<BottomNavigationBarItem> itemList;

  int _selectIndex = 0;

  //Stack（层叠布局）+Offstage组合,解决状态被重置的问题
  Widget _getPagesWidget(int index) {
    return Offstage(
      offstage: _selectIndex != index,
      child: TickerMode(
        enabled: _selectIndex == index,
        child: pages[index],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    print('initState _ContainerPageState');
    if (pages == null) {
      pages = [Index(), Matrix()];
    }
    if (itemList == null) {
      itemList = itemNames
          .map((item) => BottomNavigationBarItem(
                icon: Icon(item.normalIcon),
                title: Text(
                  item.name,
                  style: TextStyle(fontSize: 10.0),
                ),
                activeIcon: Icon(
                  item.activeIcon,
                ),
              ))
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pageNames[_selectIndex]),
      ),
      body: Stack(
        children: <Widget>[
          _getPagesWidget(0),
          _getPagesWidget(1),
          //          _getPagesWidget(2)
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: itemList,
        onTap: (int index) {
          ///这里根据点击的index来显示，非index的page均隐藏
          setState(() {
            _selectIndex = index;
          });
        },
        //图标大小
        iconSize: 24,
        //当前选中的索引
        currentIndex: _selectIndex,
        //选中后，底部BottomNavigationBar内容的颜色(选中时，默认为主题色)（仅当type: BottomNavigationBarType.fixed,时生效）
        fixedColor: Colors.red,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
