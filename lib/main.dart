import 'package:calculator/button.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:math_expressions/math_expressions.dart';
void main() {
  runApp( Sizer(
      builder: (context, orientation, deviceType) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sizer',
      theme: ThemeData.light(),
      home: Home() ,
    );}));

}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<String> buttons = [

    '7',
    '8',
    '9',
    'x',
    '4',
    '5',
    '6',
    '-',
    '1',
    '2',
    '3',
    '+',
    '0',
    '.',
'C',
    '/',
    '%'



  ];
  var userInput = '';
  var answer = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
body:
   Padding(
     padding: const EdgeInsets.fromLTRB(10, 35, 10,10 ),
     child: Column(
       children: [
         Container(
             height :330,
             width: 330,

             decoration: BoxDecoration(

               borderRadius: BorderRadius.circular(20),
                 color: Colors.black,
               boxShadow: [
                 BoxShadow(
                   color: Colors.green,
                   blurRadius: 30,
                 )
               ]
             ),
             child: Padding(
               padding: const EdgeInsets.all(20.0),
               child: Center(child: Column(
                 children: [

                   Text(
                     userInput,
                     style: TextStyle(fontSize: 25, color: Colors.white),),
                   Text(
                     answer,
                     style: TextStyle(
                         fontSize: 30,
                         color: Colors.white,
                         fontWeight: FontWeight.bold),
                   ),
                 ],
               ),
               ),
             )),
         Spacer(),

          Spacer(),
          Row(
            children: [Button(text: "7",buttontapped: () {
    setState(() {

      userInput += buttons[0];
    answer = userInput;
    print(userInput);
    });}),
              Spacer(),
              Button(text: "8",buttontapped: () {
    setState(() {

      userInput += buttons[1];
  //  answer = userInput;
    print(userInput);
    });}),
              Spacer(),
              Button(text: "9",buttontapped: () {
                setState(() {

                  userInput += buttons[2];
               //   answer = '0';
                  print(userInput);
                });}),
              Spacer(),
              Button(text: "X",color: Colors.green,buttontapped: () {
                setState(() {

                  userInput += buttons[3];
                 // answer = '0';
                  print(userInput);
                });}),
            ],),
         Spacer(),
         Row(
           children: [Button(text: "4",buttontapped: () {
             setState(() {

               userInput += buttons[4];
               // answer = '0';
               print(userInput);
             });}),
             Spacer(),
             Button(text: "5",buttontapped: () {
               setState(() {

                 userInput += buttons[5];
                 // answer = '0';
                 print(userInput);
               });}),
             Spacer(),
             Button(text: "6",buttontapped: () {
               setState(() {

                 userInput += buttons[6];
                 // answer = '0';
                 print(userInput);
               });}),
             Spacer(),
             Button(text: "-",color: Colors.green,buttontapped: () {
               setState(() {

                 userInput += buttons[7];
                 // answer = '0';
                 print(userInput);
               });}),],),
         Spacer(),
         Row(
           children: [Button(text: "1",buttontapped: () {
             setState(() {

               userInput += buttons[8];
               // answer = '0';
               print(userInput);
             });}),
             Spacer(),
             Button(text: "2",buttontapped: () {
               setState(() {

                 userInput += buttons[9];
                 // answer = '0';
                 print(userInput);
               });}),
             Spacer(),
             Button(text: "3",buttontapped: () {
               setState(() {

                 userInput += buttons[10];
                 // answer = '0';
                 print(userInput);
               });}),
             Spacer(),
             Button(text: "+",color: Colors.green,buttontapped: () {
               setState(() {

                 userInput += buttons[11];
                 // answer = '0';
                 print(userInput);
               });}),],),
         Spacer(),
         Row(
           children: [
             Button(text: "0",buttontapped: () {
               setState(() {

                 userInput += buttons[12];
                 // answer = '0';
                 print(userInput);
               });}),
             Spacer(),
             Button(text: ".",buttontapped: () {
               setState(() {

                 userInput += buttons[13];
                 // answer = '0';
                 print(userInput);
               });}),
             Spacer(),
             Button(text: "<",buttontapped: () {
               setState(() {

                 userInput =
                     userInput.substring(0, userInput.length - 1);
                 // answer = '0';
                 print(userInput);
               });}),
             Spacer(),
             Button(text: "=",color: Colors.green,buttontapped: () {
               setState(() {
                 Text("=");
                 equalPressed();

               });}),
           ],),
Spacer(),
         Row(
           children: [Container(
             width: 160,
             child: Button(text: "C",color: Colors.green,buttontapped: () {
               setState(() {

                 userInput = '';
                 answer = '0';
               });}),
           ),
             Spacer(),
             Button(text: "/",color: Colors.green,buttontapped: () {
               setState(() {

                 userInput += buttons[15];
                 // answer = '0';
                 print(userInput);
               });}),
             Spacer(),
             Button(text: "%",color: Colors.green,buttontapped: () {
               setState(() {

                 userInput += buttons[16];
                 // answer = '0';
                 print(userInput);
               });}),

           ],),

       ],
     ),
   )

    );
  }
  void equalPressed() {
    String finaluserinput = userInput;
    finaluserinput = userInput.replaceAll('x', '*');

    Parser p = Parser();
    Expression exp = p.parse(finaluserinput);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    answer = eval.toString();
  }
}
