import 'package:flutter/material.dart';
import 'package:vk_m/settings/colors.dart';
import 'package:vk_m/settings/fonts.dart';
import 'post_list.dart';

class MainPage extends StatefulWidget {
  MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  final ScrollController scrollController = ScrollController();
  // late TabController tabController;
  // int _tabBarIndex = 0;

  @override
  void initState() {
    super.initState();
    // tabController = TabController(initialIndex: 0, length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return DefaultTabController(
      length: 3,
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              sliver: SliverAppBar(
                title: TabBar(
                  // controller: tabController,
                  dividerColor: VkColors.greyLight2BGColor,
                  dividerHeight: 1,
                  indicatorColor: VkColors.blueLight,
                  labelColor: VkColors.whiteFont,
                  indicatorPadding: EdgeInsets.only(top: 44),
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: VkColors.blueLight,
                    shape: BoxShape.rectangle,
                  ),
                  indicatorSize: TabBarIndicatorSize.tab,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  // onTap: (value) {
                  //   _tabBarIndex = value;
                  //   setState(() { });
                  // },
                  tabs: [
                    Tab(text: 'Лента'),
                    Tab(text: 'Для вас'),
                    Tab(text: 'Новости'),
                  ],
                ),
              ),
            ),
          ];
        },
        body: TabBarView(
          // controller: tabController,
          children: [
            //history
            SingleChildScrollView(
              key: PageStorageKey('history'),
              controller: scrollController,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    height: 160,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20)),
                      color: VkColors.mainLight2BGColor,
                    ),
                    child: Row(
                      children: [
                        Column(
                          mainAxisAlignment:
                              MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Stack(
                                children: [
                                  Container(
                                    width: 90,
                                    height: 90,
                                    alignment: Alignment.bottomLeft,
                                    child: Image(
                                      image: AssetImage(
                                          'assets/images/avatar.png'),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: Container(
                                      width: 28,
                                      height: 28,
                                      padding: EdgeInsets.zero,
                                      decoration: BoxDecoration(
                                          color: Colors.blue,
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              color: VkColors
                                                  .mainLight2BGColor,
                                              width: 2)),
                                      child: Icon(
                                        Icons.add,
                                        size: 18,
                                        color: Colors.white,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Text('История',
                                style: VkFonts.fontGreyW400_16),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    child: PostListWidget(key: PageStorageKey('history'), controller: scrollController),
                  ),
                ],
              ),
            ),
            //for you
            Center(
                child: Text(
              'Для вас',
            )),
            //new
            Center(
                child: Text(
              'Новости',
            )),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
