import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/other_page.dart';
//主函数（入口函数），下面我会简单说说Dart的函数
void main() =>runApp(MyApp());
// 声明MyApp类
class MyApp extends StatelessWidget{
  int _selectedIndex = 0;
  
  //重写build方法
  @override
  Widget build(BuildContext context){
    //返回一个Material风格的组件
   return MaterialApp(
      title:'Welcome to Flutter',
      theme: ThemeData(
        primaryColor: Colors.red,
      ),
      home:Scaffold(
        //创建一个Bar，并添加文本
        appBar:AppBar(
          title:Text('ReaperLC的博客',style: new TextStyle(
             fontSize: 24.0,
          ),),
          elevation: 1,
         
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home),title: Text('首页')),
            BottomNavigationBarItem(icon: Icon(Icons.hot_tub),title: Text('Git')),
            BottomNavigationBarItem(icon: Icon(Icons.history),title: Text('关于')),
          ],
          currentIndex: _selectedIndex,
          fixedColor:Colors.red,
        ),
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
        //在主体的中间区域，添加一个hello world 的文本
        body:Center(
          child:Text('欢迎来到Flutter的世界!'),
        ),
      ),
    );
  }
}