import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'resualt.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeState();
  }
}

class HomeState extends State<Home> {
  bool isMale = false;
  int age = 21;
  int weigth = 55;
  double height = 167;
  double resault = 21.5;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI'),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Expanded(
            child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Row(
            children: [
              m1Expanded(context, 'Male'),
              SizedBox(width: 15),
              m1Expanded(context, 'Female')
            ],
          ),
        )),
        Expanded(
            child: Container(
                width: double.infinity,
                decoration: BoxDecoration(color: Colors.blueGrey,borderRadius: BorderRadius.circular(5)),
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:[
                      Text("Height", style:  Theme.of(context).textTheme.headlineLarge,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toStringAsFixed(1),
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                        Text('cm', style: Theme.of(context).textTheme.headlineLarge,)
                      ],
                    ),
                    Slider(
                        min: 90,
                        max: 220,
                        value: height,
                        onChanged: (newValue) => setState(() {
                              height = newValue;
                            })),
                  ]),
                ))),
        Expanded(
            child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Row(
            children: [
              m2Expanded(context, 'Weigth'),
              SizedBox(width: 15),
              m2Expanded(context, 'age')
            ],
          ),
        )),
        Container(
            color: Colors.teal,
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 16,
            child: TextButton(
              child: Text(
                'Calculate',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              onPressed: () {
                resault = weigth / pow((height / 100), 2);
                print(resault);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Resualt(age, isMale, resault)));
              },
            )),
      ])),
    );
  }

  Expanded m1Expanded(BuildContext context, String type) {
    return Expanded(
        child: GestureDetector(
            onTap: () {
              setState(() {
                isMale = (type == "Male") ? true : false;
              });
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: (isMale && (type == "Male")) ||
                          (!isMale && (type == "Female"))
                      ? Colors.teal
                      : Colors.blueGrey),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      type == "Male" ? Icons.male : Icons.female,
                      size: 90,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      type,
                      style: Theme.of(context).textTheme.headlineLarge,
                    )
                  ]),
            )));
  }

  Expanded m2Expanded(BuildContext context, String type) {
    return Expanded(
        child: GestureDetector(
            onTap: () {
              setState(() {
                isMale = (type == "Male") ? true : false;
              });
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.blueGrey),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      type,
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      type == "Weigth" ? '$weigth' : '$age',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FloatingActionButton(
                          heroTag: type == "Weight" ? 'Weight--' : 'age--',
                          onPressed: () {
                            setState(() {
                              type == "Weigth"
                                  ? weigth = weigth - 1
                                  : age = age - 1;
                            });
                          },
                          child: Icon(
                            Icons.remove,
                            size: 25,
                          ),
                          mini: true,
                        ),
                        FloatingActionButton(
                          heroTag: type == "Weight" ? 'Weight++' : 'age++',
                          onPressed: () {
                            setState(() {
                              type == "Weigth"
                                  ? weigth = weigth + 1
                                  : age = age + 1;
                            });
                          },
                          child: Icon(
                            Icons.add,
                            size: 25,
                          ),
                          mini: true,
                        )
                      ],
                    )
                  ]),
            )));
  }
}
