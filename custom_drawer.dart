

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Form_Page.dart';
import '../grid.dart';
import '../labFoure.dart';
import '../lec_4.dart';
import '../lect_3.dart';

Widget CustomDrawer(BuildContext context){
  return Drawer(
    child: ListView(
      children:  [
        DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.deepOrange,
          ),
          child: CircleAvatar(
            backgroundColor: Colors.white,
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 5),
          color: Colors.yellow,
          child: ListTile(
            onTap: (){
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context){
                    return LecThree(title: '',);
                  })
              );
            },
            title: Text("Home page"),
            //leading: Icon(Icons.settings),
            //  subtitle: Text("This is lecThree "),
            trailing: Icon(Icons.home),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 5),
          color: Colors.yellow,
          child: ListTile(
            onTap: (){
              Navigator.of(context).pushNamed("/");
              /*Navigator.of(context).push(
                  MaterialPageRoute(builder: (context){
                    return labfoure();
                  })
              );*/
            },
            title: Text("First page"),
            //leading: Icon(Icons.settings),
            //  subtitle: Text("This is lecThree "),
            trailing: Icon(Icons.first_page),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 5),
          color: Colors.yellow,
          child: ListTile(
            onTap: (){
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context){
                    return GridPage();
                  })
              );
            },
            title: Text("GridPage"),
            //leading: Icon(Icons.settings),
            //  subtitle: Text("This is lecThree "),
            trailing: Icon(Icons.grid_4x4_outlined),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 5),
          color: Colors.yellow,
          child: ListTile(
            onTap: (){
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context){
                    return LecFour();
                  })
              );
            },
            title: Text("LecFour"),
            //leading: Icon(Icons.settings),
            //  subtitle: Text("This is lecThree "),
            trailing: Icon(Icons.lens_blur),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 5),
          color: Colors.yellow,
          child: ListTile(
            onTap: (){
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context){
                    return FormPage();
                  })
              );
            },
            title: Text("FormPage"),
            //leading: Icon(Icons.settings),
            //  subtitle: Text("This is lecThree "),
            trailing: Icon(Icons.fax_rounded),
          ),
        ),

      ],
    ),
  );
}