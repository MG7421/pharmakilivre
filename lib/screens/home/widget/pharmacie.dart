import 'package:flutter/material.dart';
import 'package:pharmakilivre/config/constants/constants.dart';
import 'package:pharmakilivre/screens/home/dashboard_screen.dart';

class PharmacyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.backgroundColor,
        title: Text('Pharmacies de garde', style: TextStyle(
        color:AppColors.textColor
    ),
    ),
        leading: IconButton(
        icon: Icon(Icons.arrow_back, color: AppColors.textColor,),
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
