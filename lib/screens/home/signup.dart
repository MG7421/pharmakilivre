import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharmakilivre/config/constants/constants.dart';
import 'package:pharmakilivre/screens/home/loginPage.dart';
import 'package:pharmakilivre/utils/bezierContainer.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key ?key, this.title}) : super(key: key);

  final String? title;

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            // Container(
            //   padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
            //   child: Icon(Icons.keyboard_arrow_left, color: Colors.black),
            // ),
            // Text('Retour',
            //     style: TextStyle(fontSize: 12,
            //         fontWeight: FontWeight.w700,
            //       fontFamily: 'Quicksand',
            //     ))
          ],
        ),
      ),
    );
  }

  Widget _entryField(String title, {bool isPassword = false}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
              obscureText: isPassword,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color(0xfff3f3f4),
                  filled: true))
        ],
      ),
    );
  }

  Widget _submitButton() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 18),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.grey.shade200,
                offset: Offset(2, 4),
                blurRadius: 5,
                spreadRadius: 2)
          ],
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [AppColors.primaryColor , AppColors.primaryColor])),
      child: Text(
        "Créer un Compte",
        style: TextStyle(fontSize: 20,
            fontFamily: 'Quicksand',
            fontWeight: FontWeight.w600,
            color: Colors.white),
      ),
    );
  }

  Widget _loginAccountLabel() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        padding: EdgeInsets.all(15),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Vous avez déjà un compte ?',
              style: TextStyle(fontSize: 13,
                  fontFamily: 'Quicksand',
                  fontWeight: FontWeight.w900),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Connexion',
              style: TextStyle(
                  color:AppColors.primaryColor,
                  fontSize: 13,
                  fontFamily: 'Quicksand',
                  fontWeight: FontWeight.w900),
            ),
          ],
        ),
      ),
    );
  }

  Widget _title() {
    return Container(
      width: 150,
      child: Column(
        children: [
          Image(image: AssetImage('assets/images/favicon.png'))
        ],
      ),
    );
  }

  Widget _emailPasswordWidget() {
    return Column(
      children: [
        TextFormField(
          decoration: InputDecoration(
            labelText: "Nom d’utilisateur",
            hintText: "Enter votre Nom d’utilisateur",
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffixIcon: Padding(
              padding: EdgeInsets.fromLTRB(
                  0, 20,20,20
              ),
              child: SvgPicture.asset("assets/icons/User.svg", height: 18),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 45, vertical: 18),
            enabledBorder: outlineInputBorder(
              borderRadius: BorderRadius.circular(28),
              borderSide: BorderSide(color: kTextColor),
            ),
            focusedBorder: outlineInputBorder(
              borderRadius: BorderRadius.circular(28),
              borderSide: BorderSide(color: kTextColor),
            ),
          ),
        ),
        SizedBox(height: 30),
        TextFormField(
          decoration: InputDecoration(
            labelText: "Email",
            hintText: "Enter votre email",
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffixIcon: Padding(
              padding: EdgeInsets.fromLTRB(
                  0, 20,20,20
              ),
              child: SvgPicture.asset("assets/icons/Mail.svg", height: 18),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 45, vertical: 18),
            enabledBorder: outlineInputBorder(
              borderRadius: BorderRadius.circular(28),
              borderSide: BorderSide(color: kTextColor),
            ),
            focusedBorder: outlineInputBorder(
              borderRadius: BorderRadius.circular(28),
              borderSide: BorderSide(color: kTextColor),
            ),
          ),
        ),
        SizedBox(height: 30),
        TextFormField(
          decoration: InputDecoration(
            labelText: "Mot de passe",
            hintText: "Enter votre Mot de passe",
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffixIcon: Padding(
              padding: EdgeInsets.fromLTRB(
                  0, 20,20,20
              ),
              child: SvgPicture.asset("assets/icons/Lock.svg", height: 18),
            ),

            contentPadding: EdgeInsets.symmetric(horizontal: 45, vertical: 18),
            enabledBorder: outlineInputBorder(
              borderRadius: BorderRadius.circular(28),
              borderSide: BorderSide(color: kTextColor),
            ),
            focusedBorder: outlineInputBorder(
              borderRadius: BorderRadius.circular(28),
              borderSide: BorderSide(color: kTextColor),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: height,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: -MediaQuery.of(context).size.height * .15,
              right: -MediaQuery.of(context).size.width * .4,
              child: BezierContainer(),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: height * .2),
                    _title(),
                    SizedBox(
                      height: 50,
                    ),
                    _emailPasswordWidget(),
                    SizedBox(
                      height: 30,
                    ),
                    _submitButton(),
                    SizedBox(height: height * .10),
                    _loginAccountLabel(),
                  ],
                ),
              ),
            ),
            Positioned(top: 40, left: 0, child: _backButton()),
          ],
        ),
      ),
    );
  }
}
