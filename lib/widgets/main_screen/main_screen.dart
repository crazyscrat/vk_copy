import 'package:flutter/material.dart';
import 'package:vk_m/settings/colors.dart';
import 'package:vk_m/settings/fonts.dart';
import 'package:vk_m/settings/sizes.dart';
import 'package:vk_m/widgets/main_page/main_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedTab = 0;
  int countNotification = 4;
  String _appBarTitle = '';

  static const List<String> _labels = <String>[
    'Главная',
    'Сервисы',
    'Мессенджер',
    'Клипы',
    'Видео'
  ];

  @override
  void initState() {
    super.initState();
    _appBarTitle = _labels[_selectedTab];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: VkColors.mainLight2BGColor,
        title: Row(
          children: [
            InkWell(
              child: SizedBox(width: 32, height: 32, child: Image(image: AssetImage('assets/images/avatar.png'),)),
              onTap: _userSettings,
            ),
            SizedBox(
              width: 16,
            ),
            Text(
              _appBarTitle,
              style: VkFonts.fontWhiteNormal_20,
            )
          ],
        ),
        actions: [
          IconButton(
              onPressed: null,
              icon: Icon(
                Icons.add_circle_outline,
                color: Colors.white,
                size: VkSizes.actionIconSize,
              )),
          IconButton(
              onPressed: null,
              icon: Icon(
                Icons.search,
                color: Colors.white,
                size: VkSizes.actionIconSize,
              )),
          IconButton(
              onPressed: null,
              icon: Stack(children: [
                Container(
                  width: 36,
                  height: 32,
                  alignment: Alignment.bottomLeft,
                  child: Icon(
                    Icons.notifications_none_outlined,
                    color: Colors.white,
                    size: VkSizes.actionIconSize,
                  ),
                ),
                if (countNotification > 0) ...[
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                        width: 20,
                        height: 20,
                        padding: EdgeInsets.zero,
                        decoration: BoxDecoration(
                            color: Colors.red, shape: BoxShape.circle),
                        child: Text(
                          '$countNotification',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                          textAlign: TextAlign.center,
                        )),
                  )
                ]
              ])),
        ],
      ),
      body: IndexedStack(
        index: _selectedTab,
        children: [
          MainPage(),
          Text('Сервисы'),
          Text('Мессенджер'),
          Text('Клипы'),
          Text('Видео'),
        ],
      )
      //Center(child: _widgetOptions[_selectedTab],)
      ,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Главная'),
          BottomNavigationBarItem(
              icon: Icon(Icons.dataset_sharp), label: 'Сервисы'),
          BottomNavigationBarItem(
              icon: Icon(Icons.messenger_outline), label: 'Мессенджер'),
          BottomNavigationBarItem(
              icon: Icon(Icons.view_carousel_outlined), label: 'Клипы'),
          BottomNavigationBarItem(
              icon: Icon(Icons.video_collection_outlined), label: 'Видео'),
        ],
        onTap: _onSelectTab,
      ),
    );
  }

  void _onSelectTab(int index) {
    if (_selectedTab == index) return;
    setState(() {
      _selectedTab = index;
      _appBarTitle = _labels[_selectedTab];
    });
  }

  void _userSettings() {
    Navigator.of(context).pushNamed('/account_settings_screen');
  }
}
