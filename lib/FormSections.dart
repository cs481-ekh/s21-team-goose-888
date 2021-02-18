import 'package:flutter/material.dart';

class FormSections extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ITD-888 Section Selection"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        //padding: EdgeInsets.only(left: 50, right: 50),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: <Widget>[
        Row (
        mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
           Text('Project Number: ',
             textAlign: TextAlign.left,


          style: TextStyle(

            fontSize: 15.0,
                  ),
              ),
            Text('Project Name: ',
              textAlign: TextAlign.right,


              style: TextStyle(

                fontSize: 15.0,
              ),
            ),
              ],
            ),





        TextButton(
        child: Align(
          alignment: Alignment.center,

          child: Text('Loose Mix R97',
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
        ),
        onPressed: () {
          //Navigator.pushNamed(context, '/third');
        }
        ),

            TextButton(
                child: Align(
                  alignment: Alignment.center,

                  child: Text('Custody',
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
                onPressed: () {
                  //Navigator.pushNamed(context, '/third');
                }
            ),
            TextButton(
                child: Align(
                  alignment: Alignment.center,

                  child: Text('R47',
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
                onPressed: () {
                  //Navigator.pushNamed(context, '/third');
                }
            ),
            TextButton(
                child: Align(
                  alignment: Alignment.center,

                  child: Text('T329',
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
                onPressed: () {
                  //Navigator.pushNamed(context, '/third');
                }
            ),
            TextButton(
                child: Align(
                  alignment: Alignment.center,

                  child: Text('T308',
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
                onPressed: () {
                  //Navigator.pushNamed(context, '/third');
                }
            ),
            TextButton(
                child: Align(
                  alignment: Alignment.center,

                  child: Text('T209',
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
                onPressed: () {
                  //Navigator.pushNamed(context, '/third');
                }
            ),
            TextButton(
                child: Align(
                  alignment: Alignment.center,

                  child: Text('T166',
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
                onPressed: () {

                  //Navigator.pushNamed(context, '/third');
                }
            ),
            TextButton(
                child: Align(
                  alignment: Alignment.center,

                  child: Text('T312',
                    style: TextStyle(
                      fontSize: 20.0,
                    ),),
                ),
                onPressed: () {
                  //Navigator.pushNamed(context, '/third');
                }
            ),
            TextButton(
                child: Align(
                  alignment: Alignment.center,

                  child: Text('T30',
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),

                onPressed: () {
                  //Navigator.pushNamed(context, '/third');
                }
            ),
        ButtonTheme(
            minWidth: double.infinity,
          child: Align(
              alignment: Alignment.bottomCenter,
          child: RaisedButton(

              child: Text('Account Information',
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
            onPressed: () {

            Navigator.pushNamed(context, '/account');
             },
            )
        )
        ),
          ],
        ),
      ),

    );
  }
}