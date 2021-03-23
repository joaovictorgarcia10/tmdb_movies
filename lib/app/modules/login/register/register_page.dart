import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPage extends StatelessWidget {
  Widget _registerButton(context) {
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
          Get.toNamed('/');
        },
        child: Text(
          'Cadastrar',
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
        //

        Container(
          width: 400,
          decoration: BoxDecoration(
            color: Theme.of(context).accentColor.withOpacity(0.15),
            borderRadius: BorderRadius.circular(8),
          ),
          child: new ListTile(
            leading: new Icon(
              Icons.person,
              size: 20,
            ),
            title: TextField(
              decoration: new InputDecoration(
                hintText: 'Nome',
                border: InputBorder.none,
              ),
            ),
          ),
        ),
        SizedBox(height: 15.0),
        //

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
        //

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
        SizedBox(height: 15.0),
        //

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
                hintText: 'Confirmar Senha',
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
                      top: 35.0,
                      left: 20.0,
                      right: 20,
                    ),
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: IconButton(
                            icon: Icon(
                              Icons.arrow_back_ios,
                              size: 20,
                            ),
                            onPressed: () {
                              Get.back();
                            },
                          ),
                        ),
                        SizedBox(height: 5.0),
                        Text(
                          'CADASTRO',
                          style: TextStyle(
                            fontSize: 38,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        SizedBox(height: 35.0),
                        Text(
                          'Cadastre-se e descubra os melhores filmes.',
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 75.0),
                        _textFieldsContent(context),
                        SizedBox(height: 40.0),
                        _registerButton(context),
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
