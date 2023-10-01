import 'package:flutter/material.dart';


class Resualt extends StatelessWidget {
  final bool isMale;
  final int age;
  final double resault;

  String get getPhraseResault {
    String phrase = '';
    if (resault >= 30) {
      phrase = 'Obese';
    } else if (resault > 25 && resault < 30) {
      phrase = 'Overweight';
    } else if (resault >= 18.5 && resault <= 24.9) {
      phrase = 'Normal';
    } else {
      phrase = 'Thin';
    }
    return phrase;
  }

  Resualt(this.age, this.isMale, this.resault);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Resault'),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Center(
              child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            'Gender: ${isMale ? 'Male' : 'Female'}',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          Text('Age: ${age.toString()}',
              style: Theme.of(context).textTheme.headlineLarge),
          Text('Resault: ${resault.toStringAsFixed(1)}',
              style: Theme.of(context).textTheme.headlineLarge),
          Text(
            'Resault: ${getPhraseResault}',
            style: Theme.of(context).textTheme.headlineLarge,
            textAlign: TextAlign.center,
          ),
        ],
      ))),
    );
  }
}
