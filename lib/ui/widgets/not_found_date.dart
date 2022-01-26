  import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Center buildNoTasks(ThemeData theme, String text) {
      return Center(
      child: Column(
      children: <Widget>[
      Column(
      children: <Widget>[
        Image.asset('images/notfound.png',height: 100,),
      
      Card(
      color: Colors.blue,
      shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
      ),
      elevation: 10,
      child: Padding(
      padding: const EdgeInsets.all(5.0),
      child: Text(
      text,style:
      const TextStyle(
      color: Colors.white,
      ),
      )),
      ),
      ],
      ),
      ],
      ),
      );
      }