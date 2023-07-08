import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../routes/global_route.dart';
import '../../utils/coustom_bottom_nav_bar.dart';
import 'widget/category_card.dart';
import 'widget/info_category_card.dart';

class DashboardScreen extends StatelessWidget {
  static String routeName = "/home";
  const DashboardScreen({super.key});



  @override
  Widget build(BuildContext context) {
    RouteUtil.saveLastRoute(DashboardScreen.routeName);

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top,
              left: 25,
              right: 25,
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 30.0,
                  backgroundImage: NetworkImage('https://via.placeholder.com/150'),
                  backgroundColor: Colors.transparent,
                ),
                Icon(
                  Icons.notifications,
                  size: 35,
                  color: Colors.black,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Bienvenue",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Quicksand',
                  ),
                ),
                const Text(
                  "Marcelin KOUAKOU",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontFamily: 'Quicksand',
                  ),
                ),
                const SizedBox(height: 20),
                Stack(
                  children: [
                    TextField(
                      cursorColor: AppColors.primaryColor,
                      decoration: InputDecoration(
                        fillColor: const Color(0xFFF6F8FF),
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 20,
                        ),
                        prefixIcon: const Icon(
                          Icons.search_outlined,
                          size: 30,
                        ),
                        hintText: "Que recherchez-vous ?",
                        hintStyle: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.withOpacity(0.7),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      right: 12,
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.primaryColor,
                        ),
                        child: const Icon(
                          Icons.mic_outlined,
                          color: Colors.white,
                          size: 25,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 25),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Nos Pharmacies',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Quicksand',
                      ),
                    ),
                    Text(
                      'Voir plus',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Quicksand',
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      3,
                          (index) => const Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Column(
                          children: [
                            CategoryCard(
                              icon: 'assets/icons/Heart Icon.svg',
                              title: 'Lorem Ipsum',
                              description: '45 pharmacies',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 25,),
                const Row(
                  children: [
                    Text(
                      'Mes ordonnances',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        fontFamily: 'Quicksand',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                      children:  List.generate(
                        2, (index) =>
                          const Padding(
                            padding: EdgeInsets.only(bottom: 15),
                            child: InfoCategoryCard(
                              icon: 'assets/icons/Mail.svg',
                              title: 'Title',
                              description: 'Description', image: '',
                            ),
                          ),)
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}





