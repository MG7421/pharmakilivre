import 'package:flutter/material.dart';
import 'package:pharmakilivre/screens/components/page_view.dart';

final pages = [
  const PageData(
    images: 'assets/images/boar.png',
    title: "Pharmakilivre",
    description: "Votre partenaire de confiance pour livrer vos médicaments à domicile",
    bgColor: Color(0xFF58C9C0),
    textColor: Colors.white,
  ),
  const PageData(
    images: 'assets/images/boar1.png',
    title: "Envoyez votre ordonnance numérique",
    description: " à la pharmacie de votre choix et faites vous livrer vos médicaments à domicile.",
    textColor: Color(0xFF0C0C0C),
    bgColor: Color(0xFFFFFFFF),
  ),
  const PageData(
    images: 'assets/images/boar2.png',
    title: "faites vous livrer vos medicaments à domicile 7j/7",
    description: "Partout en france, Pharmakilivre dispose d'une couverture nationale. ",
    bgColor: Color(0xFF0A0A0A),

  ),
];

class OnboardingExample extends StatelessWidget {
  const OnboardingExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ConcentricPageView(
        colors: pages.map((p) =>  p.bgColor).toList(),
        radius: screenWidth * 0.1,
        // curve: Curves.ease,
        nextButtonBuilder: (context) => Padding(
          padding: const EdgeInsets.only(left: 3), // visual center
          child: Icon(
            Icons.navigate_next,
            size: screenWidth * 0.08,
          ),
        ),
        // itemCount: pages.length,
        // duration: const Duration(milliseconds: 1500),
        // opacityFactor: 2.0,
        // scaleFactor: 0.2,
        // verticalPosition: 0.7,
        // direction: Axis.vertical,
        // itemCount: pages.length,
        // physics: NeverScrollableScrollPhysics(),
        itemBuilder: (index) {
          final page = pages[index % pages.length];
          return SafeArea(
            child: _Page(page: page),
          );
        },
      ),
    );
  }
}

class PageData {
  final String? title;
  final String? description;
  final String images;
  final Color bgColor;
  final Color textColor;

  const PageData({
    this.title,
    this.description,
    required this.images,
    this.bgColor = Colors.white,
    this.textColor = Colors.white,
  });
}

class _Page extends StatelessWidget {
  final PageData page;

  const _Page({Key? key, required this.page}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    space(double p) => SizedBox(height: screenHeight * p / 100);
    return Column(
      children: [
        space(8),
        _Image(
          page: page,
          size: 190,
          iconSize: 170,
        ),
        space(0.5),
        _Text(
          page: page,
          style: const TextStyle(
            fontSize: 25,
              fontFamily: 'Quicksand',
            fontWeight: FontWeight.bold
          ),
        ),
        _Description(
            page: page, style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          fontFamily: 'Quicksand',
        ),)
      ],
    );
  }
}

class _Text extends StatelessWidget {
  const _Text({
    Key? key,
    required this.page,
    this.style,
  }) : super(key: key);


  final PageData page;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Text(
      page.title ?? '',
      style: TextStyle(
        color: page.textColor,
        fontWeight: FontWeight.w600,
        fontFamily: 'Quicksand',
        letterSpacing: 0.0,
        fontSize: 18,
        height: 1.2,
      ).merge(style),
      textAlign: TextAlign.center,
    );
  }
}

class _Description extends StatelessWidget {
  const _Description({
    Key? key,
    required this.page,
    this.style,
  }) : super(key: key);

  final PageData page;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Text(
        page.description ?? '',
        style: TextStyle(
          color: page.textColor,
<<<<<<< HEAD
          fontWeight: FontWeight.w500,
=======
          fontWeight: FontWeight.normal,
>>>>>>> origin/devMaster
          fontFamily: 'Quicksand',
          letterSpacing: 0.0,
          fontSize: 16,
          height: 1.4,
        ).merge(style),
        textAlign: TextAlign.center,
      ),
    );
  }
}




class _Image extends StatelessWidget {
  const _Image({
    Key? key,
    required this.page,
    required this.size,
    required this.iconSize,
  }) : super(key: key);

  final PageData page;
  final double size;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    final bgColor = page.bgColor
         .withBlue(page.bgColor.blue - 40)
        .withGreen(page.bgColor.green + 20)
        .withRed(page.bgColor.red - 100)
        .withAlpha(90);


    return Container(
     width: double.infinity,
      height: 300,
      decoration: const BoxDecoration(
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: RotatedBox(
              quarterTurns: 0,
              child:  Image.asset(page.images)
            ),
          ),
        ],
      ),
    );
  }
}
