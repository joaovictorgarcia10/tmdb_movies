import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecoverPage extends StatelessWidget {
  Widget _recoverButton(context) {
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
        onPressed: () {},
        child: Text(
          'Recuperar',
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
                          'RECUPERAR SENHA',
                          style: TextStyle(
                            fontSize: 38,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        SizedBox(height: 35.0),
                        SizedBox(height: 75.0),
                        _textFieldsContent(context),
                        SizedBox(height: 40.0),
                        _recoverButton(context),
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
