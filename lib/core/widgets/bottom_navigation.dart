import 'package:flutter/material.dart';
import 'package:saweha/features/profile/presentation/profile_page.dart';

class BottomNavigation extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const BottomNavigation({super.key, required this.selectedIndex, required this.onItemTapped});

  @override
  Widget build(BuildContext context) {
    // إزالة Scaffold والبدء بـ SafeArea مباشرة
    return SafeArea(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
          padding: const EdgeInsets.symmetric(horizontal: 15),
          height: 65,
          decoration: BoxDecoration(color: const Color(0xFFEBE5D3), borderRadius: BorderRadius.circular(35)),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildNavItem(Icons.dashboard_rounded, 0),
              const SizedBox(width: 15),
              _buildNavItem(Icons.receipt_long_rounded, 1),
              const SizedBox(width: 15),
              _buildNavItem(Icons.people_alt_rounded, 2),
              const SizedBox(width: 15),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfileScreen()));
                },
                child: Container(
                  width: 38,
                  height: 38,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: 2, color: Theme.of(context).colorScheme.tertiary),
                    image: const DecorationImage(image: AssetImage("assets/images/profile.jpg"), fit: BoxFit.cover),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, int index) {
    bool isActive = selectedIndex == index;
    return GestureDetector(
      onTap: () => onItemTapped(index), // تمرير النقر إلى HomeScreen
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: isActive ? const BoxDecoration(color: Color(0xFFCDD174), shape: BoxShape.circle) : null,
        child: Icon(icon, color: isActive ? Colors.black87 : Colors.black54, size: 28),
      ),
    );
  }
}
