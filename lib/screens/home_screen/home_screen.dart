import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_app/components/my_tab.dart';
import 'package:flutter_movie_app/config/theme_config.dart';
import 'package:flutter_movie_app/screens/home_screen/sections/featured_slider.dart';
import 'package:flutter_movie_app/screens/home_screen/sections/popular_movies_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const routeName = "/home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Map<String, dynamic>> tabList = [
    {"title": "All", "categoryId": 1},
    {"title": "Action", "categoryId": 2},
    {"title": "Horror", "categoryId": 3},
    {"title": "Adventure", "categoryId": 4},
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this, initialIndex: 0);
    _tabController.addListener(_handleTabSection);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        title: const Text("Movies"),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: Icon(Icons.search_rounded),
          ),
        ],
      ),
      body: ListView(
        children: [
          const FeaturedSlider(),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: ThemeConfig.sectionPaddingSize),
            child: TabBar(
              controller: _tabController,
              unselectedLabelColor: Colors.white.withOpacity(0.8),
              labelColor: Colors.white,
              indicatorSize: TabBarIndicatorSize.tab,
              isScrollable: true,
              indicatorColor: Colors.transparent,
              dividerColor: Colors.transparent,
              indicator: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(8.0),
                border: const Border(bottom: BorderSide.none),
              ),
              tabs: tabList.map((e) => MyTab(label: e['title'])).toList(),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: [
              for (var i = 0; i < tabList.length; i++)
                PopularMoviesSlider(
                  categoryId: tabList[i]['categoryId'],
                )
            ][_tabController.index],
          )
        ],
      ),
    );
  }

  _handleTabSection() {
    if (_tabController.indexIsChanging) {
      setState(() {});
    }
  }
}
