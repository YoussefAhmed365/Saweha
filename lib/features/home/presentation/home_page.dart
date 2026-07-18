import 'package:flutter/material.dart';
import 'package:saweha/l10n/app_localizations.dart';
import 'package:saweha/core/widgets/bottom_navigation.dart';
import 'package:saweha/features/home/widgets/activity.dart';
import 'package:saweha/features/home/widgets/dashboard.dart';
import 'package:saweha/features/home/widgets/groups.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  final List<Widget> _pages = [const DashboardScreen(), const ActivityScreen(), const GroupsScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.appTitle, style: Theme.of(context).textTheme.titleMedium),
        actions: [
          Builder(
            builder: (context) {
              return IconButton(onPressed: () => Scaffold.of(context).openEndDrawer(), icon: const Icon(Icons.menu_rounded));
            },
          ),
        ],
      ),
      body: PageView.builder(
        controller: _pageController,
        itemCount: _pages.length,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        itemBuilder: (context, index) {
          return _pages[index];
        },
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.only(top: 50),
          children: [
            ListTile(
              leading: const Icon(Icons.home_rounded),
              title: Text("Home", style: Theme.of(context).textTheme.titleMedium),
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
      // يمكنك استبدال هذا بـ Widget مخصص للدرور
      bottomNavigationBar: BottomNavigation(
        selectedIndex: _selectedIndex,
        onItemTapped: (index) {
          setState(() {
            _selectedIndex = index; // تحديث الحالة وتغيير الشاشة
          });
          _pageController.jumpToPage(index);
        },
      ),
    );
  }
}
