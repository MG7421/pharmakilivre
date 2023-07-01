import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:pharmakilivre/config/constants/constants.dart';
import 'package:pharmakilivre/screens/home/forgot_password_screen.dart';
import 'package:pharmakilivre/utils/bezierContainer.dart';

import '../../bloc/LoginBloc.dart';


class LoginPage extends StatefulWidget {
  LoginPage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {


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
      padding: EdgeInsets.symmetric(vertical: 15),
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
        'Connexion',
        style: TextStyle(fontSize: 20,
            fontFamily: 'Quicksand',
            color: Colors.white),
      ),
    );
  }

  Widget _divider() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
              ),
            ),
          ),
          Text('or'),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }

  Widget _facebookButton() {
    return Container(
      height: 50,
      margin: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child:Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(vertical: 15),
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
                  gradient: const LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [AppColors.btnColor, AppColors.btnColor])
              ),
              child: Text(
                "inscription",
                style: TextStyle(fontSize: 20,
                    fontFamily: 'Quicksand',
                    color: Colors.white),
              ),
            ),
          ),
        ],
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



  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final LoginBloc loginBloc = BlocProvider.of<LoginBloc>(context);
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();

    return Scaffold(
      body: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          if (state is LoginLoading) {
            return Center(child:
              LoadingAnimationWidget.halfTriangleDot(
              color: AppColors.primaryColor,
              size: 80,
            ),
            );
          } else if (state is LoginFailure) {
            return Center(child: Text(state.error));
          } else if (state is LoginSuccess) {
            final response = state.response;

            return Center(child: Text(
                'Logged in successfully! Token: ${response.token}'));
          } else {
            return Container(
              height: height,
              child: Stack(
                children: <Widget>[
                  Positioned(
                      top: -height * .15,
                      right: -MediaQuery
                          .of(context)
                          .size
                          .width * .4,
                      child: BezierContainer()),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(height: height * .2),
                          _title(),
                          SizedBox(height: 20),
                       Column(
                    children: <Widget>[
                    // _entryField("Entrez votre adresse e-mail"),
                    //  _entryField("Entrez votre mot de passe", isPassword: true),

                    TextField(
                      controller: _emailController,
                       decoration: InputDecoration(
                      labelText: "Entrez votre adresse e-mail",
                      labelStyle: TextStyle(fontSize: 16, fontFamily: 'Quicksand',
                    ),
                    // Ajoutez ici d'autres styles personnalisés pour le champ
                  ),
            ),
          SizedBox(height: 16), // Espacement vertical entre les champs
          TextField(
            controller: _passwordController,
          obscureText: true, // Pour masquer le texte du mot de passe
          decoration: InputDecoration(
          labelText: "Entrez votre mot de passe",
          labelStyle: TextStyle(fontSize: 16, fontFamily: 'Quicksand',
          ),
          // Ajoutez ici d'autres styles personnalisés pour le champ
          ),
          ),

          ],
          ),
                          SizedBox(height: 35),
                          InkWell(
                            onTap: (){
                              final email = _emailController.text;
                              final password = _passwordController.text;
                              context.read<LoginBloc>().add(LoginButtonPressed(email, password));
                            },
                              child: _submitButton()),


                          // botton

                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context, MaterialPageRoute(
                                  builder: (context) =>
                                      ForgotPasswordScreen()));
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              alignment: Alignment.centerRight,
                              child: Text('Mot de passe oublié ?',
                                  style: TextStyle(
                                      fontFamily: 'Quicksand',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500)),
                            ),
                          ),
                          _divider(),
                          _facebookButton(),
                          SizedBox(height: height * .055),
                          // _createAccountLabel(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
