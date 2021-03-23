import 'dart:io';

import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  // Dialog Close App
  _showDialog(_) {
    showDialog<bool>(
      context: _,
      builder: (c) => AlertDialog(
        title: Text(
          'Atenção',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        content: Text(
          'Deseja sair do TMDB MOVIES?',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          TextButton(
            child: Text(
              'Sim',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            onPressed: () => exit(0),
          ),
          TextButton(
            child: Text(
              'Não',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            onPressed: () => Navigator.pop(c, false),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(15.0),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: <Widget>[
                // First Container
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 40),
                      Container(
                        height: 180,
                        width: 180,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(200),
                          border: Border.all(
                            color: Theme.of(context).accentColor,
                            width: 2,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'JV',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 48,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Text(
                        'João Victor Garcia',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 15.0),
                      Text(
                        'garcialeite10@gmail.com',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40.0),
                Container(
                  padding: EdgeInsets.only(left: 10.0, right: 10.0),
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
                      _showDialog(context);
                    },
                    child: ListTile(
                      title: Text(
                        'Sair',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      trailing: Icon(
                        Icons.exit_to_app,
                        size: 25,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
