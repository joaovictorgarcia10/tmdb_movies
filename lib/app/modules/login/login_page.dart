import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  Widget _googleLoginRow(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          'OU ENTRE COM',
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        Container(
          width: 200,
          height: 45,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(6.0),
            border: Border.all(
              width: 1,
              color: Theme.of(context).accentColor,
            ),
          ),
          child: FlatButton(
            onPressed: () {
              Get.toNamed('/home');
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'GOOGLE',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                Image.asset(
                  'lib/assets/images/google-icon.png',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _loginButton(context) {
    return Container(
      width: 400,
      height: 50,
      decoration: BoxDecoration(
        color: Theme.of(context).accentColor,
        borderRadius: BorderRadius.circular(6.0),
        border: Border.all(
          width: 1,
          color: Theme.of(context).accentColor,
        ),
      ),
      child: FlatButton(
        onPressed: () {
          Get.toNamed('/home');
        },
        child: Text(
          'Entrar',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 19,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _textFieldsContent(context) {
    return Column(
      children: [
        Container(
          width: 400,
          decoration: BoxDecoration(
            color: Theme.of(context).accentColor.withOpacity(0.15),
            borderRadius: BorderRadius.circular(8),
          ),
          child: new ListTile(
            leading: new Icon(
              Icons.email,
              size: 20,
            ),
            title: TextField(
              decoration: new InputDecoration(
                hintText: 'E-mail',
                border: InputBorder.none,
              ),
            ),
          ),
        ),
        SizedBox(height: 15.0),
        Container(
          width: 400,
          decoration: BoxDecoration(
            color: Theme.of(context).accentColor.withOpacity(0.15),
            borderRadius: BorderRadius.circular(8),
          ),
          child: new ListTile(
            leading: new Icon(
              Icons.lock,
              size: 20,
            ),
            title: TextField(
              decoration: new InputDecoration(
                hintText: 'Senha',
                border: InputBorder.none,
              ),
            ),
            trailing: TextButton(
              onPressed: () {},
              child: Icon(
                Icons.remove_red_eye_outlined,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: TextButton(
            onPressed: () {
              Get.toNamed('/recover');
            },
            child: Text(
              'Esqueci minha senha',
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      //

      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Center(
                  child: Container(
                    padding: EdgeInsets.only(
                      top: 50.0,
                      left: 20.0,
                      right: 20,
                    ),
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'TMDB MOVIES',
                          style: TextStyle(
                            fontSize: 38,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        SizedBox(height: 35.0),
                        Text(
                          'Faça seu login e descubra os melhores filmes.',
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        //
                        //

                        SizedBox(height: 75.0),
                        _textFieldsContent(context),
                        //

                        SizedBox(height: 10.0),
                        _loginButton(context),
                        //

                        SizedBox(height: 10.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Não tem conta?',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            TextButton(
                                onPressed: () {
                                  Get.toNamed('/register');
                                },
                                child: Text(
                                  'Cadastre-se',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ))
                          ],
                        ),
                        //

                        SizedBox(height: 50.0),
                        _googleLoginRow(context),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
