
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:pharmakilivre/Screens/auth/password_screen.dart';
import 'package:pharmakilivre/Screens/auth/register_screen.dart';
import 'package:pharmakilivre/Screens/pages/dashboard.dart';
import 'package:pharmakilivre/routes/global_route.dart';

import '../../bloc/LoginBloc.dart';
import '../../constants.dart';

class LoginScreen extends StatefulWidget {
  static String routeName = "/login";

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;

  String? _emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
        .hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? _passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    return null;
  }

 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    RouteUtil.saveLastRoute(LoginScreen.routeName);
  }
  @override
  Widget build(BuildContext context) {
    final LoginBloc loginBloc = BlocProvider.of<LoginBloc>(context);
    bool isNavigatedToDashboard = false;

    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  Container(
                    height: 80,
                      child: Image.asset('assets/images/favicon.png', )),
                  //SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  Text(
                    'Bienvenue!',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                         fontFamily: 'Quicksand',
                        ),
                  ),
                  const SizedBox(height: 16),
                  const Center(
                    child: Text(
                      "Veuillez vous connecter pour accéder à l'application",
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontFamily: 'Quicksand',
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 25),
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Email',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        const SizedBox(height: 12),
                        TextFormField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          decoration:
                              const InputDecoration(hintText: 'Tapez votre votre email'),
                          validator: _emailValidator,
                        ),
                        const SizedBox(height: 24),
                        Text(
                          'Mot de passe',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        const SizedBox(height: 12),
                        TextFormField(
                          controller: _passwordController,
                          obscureText: _obscureText,
                          decoration: InputDecoration(
                            hintText: 'Tapez votre mot de passe',
                            suffixIcon: IconButton(
                              icon: Icon(_obscureText
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                              onPressed: () {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
                            ),
                          ),
                          validator: _passwordValidator,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => PasswordScreen()),
                              );
                            },
                            child: const Text(
                              'Mot de passe oublié?',
                              style: TextStyle(color: Color(0xFF3D80DE)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  BlocBuilder<LoginBloc, LoginState>(
                    builder: (context, state) {
                      if (state is LoginLoading) {
                        return LoadingAnimationWidget.stretchedDots(
                          color: AppColors.primaryColor,
                          size: 50,);
                      }
                      else if (state is LoginFailure) {
                        return Column(
                          children: [
                            InkWell(
                                onTap: (){
                                  final email = _emailController.text;
                                  final password = _passwordController.text;
                                  context.read<LoginBloc>().add(LoginButtonPressed(email, password));
                                },
                                child: _submitButton() ),
                            const SizedBox(height: 10),
                            const Text("Email ou mot de passe incorrect, veuillez reéssayer", style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                                fontSize: 13
                            ),
                            )
                          ],
                        );
                      }
                      else if (state is LoginSuccess) {


                         final response = state.response;
                        if (response.code == 200) {
                          SchedulerBinding.instance?.addPostFrameCallback((_) {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (context) => DashboardScreen()),
                                  (route) => false,
                            );
                          });
                          return Container();
                        }

                        else {
                          return Column(
                            children: [
                              InkWell(
                                  onTap: (){
                                    final email = _emailController.text;
                                    final password = _passwordController.text;
                                    context.read<LoginBloc>().add(LoginButtonPressed(email, password));
                                  },
                                  child:  _submitButton() ),
                              const SizedBox(height: 10),
                              const Text("Email ou mot de passe incorrect, veuillez reéssayer", style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13
                              ),
                              )
                            ],
                          );
                        }


                      }

                      else{
                        return Column(
                          children: [
                            InkWell(
                                onTap: (){
                                  final email = _emailController.text;
                                  final password = _passwordController.text;
                                  context.read<LoginBloc>().add(LoginButtonPressed(email, password));
                                },
                                child:  _submitButton()),
                          ],
                        );
                      }

                    },
                  ),
                  const SizedBox(height: 25),
                  RichText(
                    text: TextSpan(
                      text: "Vous n'avez pas de compte? ",
                      style: const TextStyle(color: Colors.black),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Creer un Compte',
                          style: const TextStyle(color: Color(0xFF3D80DE)),
                          recognizer: TapGestureRecognizer()..onTap = () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => RegisterScreen()),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      );
  }













  Widget _submitButton() {
    return Container(
      width: 250,
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
      child: const Text(
        'Connexion',
        style: TextStyle(fontSize: 20,
            fontFamily: 'Quicksand',
            color: Colors.white),
      ),
    );
  }
}



