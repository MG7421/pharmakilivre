import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../utils/coustom_bottom_nav_bar.dart';
import '../dashboard.dart';

class PharmacyPage extends StatelessWidget {

  static String routeName = "/pharmacie";

@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text('Pharmacies de garde', style: TextStyle(
        color:AppColors.kTextColor
    ),
    ),
        leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.black,),
        onPressed: () {
           Navigator.push(context, MaterialPageRoute(builder: (context) => DashboardScreen()));
         },
      ),
      ),
      body: Center(
             child: Text(
            'Bienvenue',
          style: TextStyle(fontSize: 20),
                ),
             ),
    );
  }
}
