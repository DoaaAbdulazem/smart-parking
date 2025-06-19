import 'package:flutter/material.dart';
import 'package:my_project/core/theme/app_colors.dart';
import 'package:my_project/features/auth/screen/save_booking.dart';

class MenuBotton extends StatelessWidget {
  const MenuBotton({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 20,
      left: 20,
      child: GestureDetector(
        onTap: () {
          showGeneralDialog(
            //واجهة فوق واجهة
            context: context,

            pageBuilder: (context, animation, secondaryAnimation) {
              return Align(
                alignment: Alignment.centerLeft,
                child: Material(
                  child: Container(
                    height: double.infinity,
                    width: MediaQuery.of(context).size.width * 0.6,
                    color: Colors.white,
                    child: const MenuPage(),
                  ),
                ),
              );
            },
            //تحريك مينو بيج من يسار الشاشة إلى مكانه الطبيعي
            transitionBuilder: (context, animation, secondaryAnimation, child) {
              final tween = Tween<Offset>(
                begin: const Offset(-1, 0),
                end: Offset.zero,
              );
              return SlideTransition(
                position: animation.drive(tween),
                child: child,
              );
            },
          );
        },
        //شكل الكبسة الدائرية
        child: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [BoxShadow(color: AppColors.black, blurRadius: 9)],
          ),
          child: const Center(
            child: Icon(Icons.menu, size: 35, color: AppColors.yallowColor),
          ),
        ),
      ),
    );
  }
}

//شكل الصفحة اليسارية
class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // زر إغلاق
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              icon: Icon(Icons.close, size: 30),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
            child: Row(
              children: [
                Icon(Icons.add_a_photo_outlined),
                SizedBox(width: 8),
                Text(
                  "Hello Mohmmed",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),

          const Divider(),

          // خيارات القائمة
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Profile"),
            onTap: () {},
          ),

          ListTile(
            leading: Icon(Icons.location_on),
            title: Text("My Bookings"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MyBookingsPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
