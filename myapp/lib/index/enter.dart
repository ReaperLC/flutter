import 'package:flutter/material.dart';
import 'package:myapp/pages/about_page.dart';
import 'package:myapp/pages/home_page.dart';
import 'package:myapp/pages/mine_page.dart';
// import 'package:myapp/index/navigation_view.dart';
import 'navigation_view.dart';// 如果是在同一个包的路径下，可以直接使用对应的文件名

// 创建一个 带有状态的 Widget 
class Enter extends StatefulWidget {
  //  固定的写法
  @override
  State<StatefulWidget> createState()  => new _EnterState();
}

class _EnterState extends State<Enter> with TickerProviderStateMixin{
  int _currentIndex = 0; //当前页面索引值
  List<NavigationView> _navigationViews; //底部图标按钮区域
  List<StatefulWidget> _pageList; //存放对应页面
  StatefulWidget _currentPage;//当前页面

  // 定义一个空的设置状态值的方法
  void _rebuild() {
    setState((){});
  }

  @override
  void initState() { 
    super.initState();

    _navigationViews = <NavigationView>[
      new NavigationView(icon: new Icon(Icons.home),title: new Text('首页'),vsync: this),
      new NavigationView(icon: new Icon(Icons.memory),title: new Text('我的'),vsync: this),
      new NavigationView(icon: new Icon(Icons.history),title: new Text('关于'),vsync: this),
    ];
    //给按钮区域加上监听
    for (NavigationView  view in _navigationViews) {
       view.controller.addListener(_rebuild);
    }

    //存放页面
    _pageList = <StatefulWidget>[
       new HomePage(),
       new MinePage(),
       new AboutPage()
    ];

    _currentPage= _pageList[_currentIndex];
  }

  Widget build(BuildContext context) {

    // 声明定义一个 底部导航的工具栏
    final BottomNavigationBar bottomNavigationBar = new BottomNavigationBar(
      items: _navigationViews
          .map((NavigationView navigationView) => navigationView.item)
          .toList(),  // 添加 icon 按钮
      currentIndex: _currentIndex,  // 当前点击的索引值
      type: BottomNavigationBarType.fixed,    // 设置底部导航工具栏的类型：fixed 固定
      onTap: (int index){   // 添加点击事件
        setState((){    // 点击之后，需要触发的逻辑事件
          _navigationViews[_currentIndex].controller.reverse();
          _currentIndex = index;
          _navigationViews[_currentIndex].controller.forward();
          _currentPage = _pageList[_currentIndex];
        });
      },
    );

    return new MaterialApp(
        home: new Scaffold(
          body: new Center(
              child: _currentPage   // 动态的展示我们当前的页面
          ),
          bottomNavigationBar: bottomNavigationBar, // 底部工具栏
          drawer: new Drawer(
          child: new ListView(padding: const EdgeInsets.only(),
            children: <Widget>[
              new UserAccountsDrawerHeader(
                accountName: new Text('夏末微凉',
                    style: new TextStyle(
                       fontSize: 20.0,
                       letterSpacing: 4.0,
                    ),
                ), //用户名

                accountEmail: new Text('从来没有真正的绝境,只有心灵的迷途!'), 
                currentAccountPicture: new GestureDetector( //用户头像
                onTap: () => print('current user'),
              
                child: new CircleAvatar(    //圆形图标控件
                  backgroundImage: new NetworkImage('http://img5q.duitang.com/uploads/item/201507/03/20150703224804_vHGrm.thumb.700_0.jpeg'),//图片调取自网络
                ),
               ),
              ),
              new ListTile(
                 title: new Text('标签',
                   style: new TextStyle(
                     fontSize: 20.0,
                   ),
                 ),
                 leading: new Icon(Icons.search),
                //  subtitle: new Text('生活中不缺少美'),
                 onTap: () => {},
              ),
              new Divider(),//分割线
              new ListTile(
                title: new Text('分类',
                   style: new TextStyle(
                     fontSize: 20.0,
                   ),
                ),
                leading: new Icon(Icons.bubble_chart),
                onTap: () => {},
              ),
              new Divider(),//分割线
              new ListTile(
                title: new Text('归档',
                   style: new TextStyle(
                     fontSize: 20.0,
                   ),
                ),
                leading: new Icon(Icons.hourglass_full),
                onTap: () => {},
              ),
              new Divider(),//分割线
              new ListTile(   //设置按钮
                title: new Text('关于',
                    style: new TextStyle(
                      fontSize: 20.0,
                    ),
                ),
                leading: new Icon(Icons.settings),
                onTap: () => {
                    
                },
              ),
            ],
          ),
        ), 
      ),

      theme: new ThemeData(
        primaryColor: Colors.green,
        primarySwatch: Colors.green,   // 设置主题颜色
      ),
    );
  }
}