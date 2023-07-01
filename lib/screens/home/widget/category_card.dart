import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CategoryCard extends StatelessWidget {

  final String icon;
  final String title;
  final String description;

  const CategoryCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(onPressed:  () {} ,
        style: OutlinedButton.styleFrom(
            shape: const RoundedRectangleBorder(borderRadius:
            BorderRadius.all(Radius.circular(30)
            ))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SvgPicture.asset(icon,  fit: BoxFit.contain,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 9,),
              const Text('title', style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              ),
              const SizedBox( height: 15,),
              const Text('description', style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w500,
              ),
              ),

            ],
          ),
        ));
  }
}
