// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_web_1/Components/customMenuBar.dart';
import 'package:flutter_web_1/Screens/Home/Components/body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: Theme.of(context).textTheme.bodyText2!,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Column(
                  children: <Widget>[
                    
                    Expanded(
                     
                      child: Column(
                        children: [
                          CustomMenuBar(),
                          CustomBody(),
                        
                         
                        ],
                      )
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}