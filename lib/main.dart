import 'package:calculator/View/user_results.dart';
import 'package:calculator/widgets/button.dart';
import 'package:calculator/Controller/results_db.dart';
import 'package:calculator/Model/results_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(Sizer(builder: (context, orientation, deviceType) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sizer',
      theme: ThemeData.dark(),
      home: Home(),
    );
  }));
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
  TextEditingController controller = TextEditingController();
  late database db;
  List<Results> datas = [];
  bool fetching = true;
  @override
  void initState() {
    super.initState();
    db = database();
    getData();
  }

  void getData() async {
    datas = await db.getdata();
    setState(() {
      fetching = false;
    });}
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        backgroundColor: Colors.black,
        body:  Padding(
          padding: const EdgeInsets.fromLTRB(10, 35, 10, 10),
          child: SingleChildScrollView(

            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0,0, 0, 17),
                    child: Container(
                        height:310,
                        width: 330,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.black,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.green,
                                blurRadius: 30,
                              )
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.all(40.0),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [

                                TextFormField(controller: controller,decoration:InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.green),
                                      borderRadius:BorderRadius.circular(20),
                                    ),
                                  labelText: "Enter title to Save",
                                  labelStyle: TextStyle(color: Colors.white),
                                 suffix: TextButton(onPressed: (){db.addDB(Results(result:answer.toString(),title: controller.text));}, child: Text("Save",style: TextStyle(color: Colors.green),),),
                                  fillColor: Colors.white,

                                ),),
                                Text(
                                  "Calculation",
                                  style: TextStyle(fontSize: 25, color: Colors.green,fontWeight: FontWeight.bold,),
                                ),
                                Text(
                                  userInput,
                                  style: TextStyle(fontSize: 25, color: Colors.white),
                                ),
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
                  ),
              //    Spacer(),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Button(
                          text: "7",
                          buttontapped: () {
                            setState(() {
                              userInput += buttons[0];
                              answer = userInput;
                              print(userInput);
                            });
                          }),
                   //   Spacer(),
                      Button(
                          text: "8",
                          buttontapped: () {
                            setState(() {
                              userInput += buttons[1];
                              //  answer = userInput;
                              print(userInput);
                            });
                          }),

                      Button(
                          text: "9",
                          buttontapped: () {
                            setState(() {
                              userInput += buttons[2];
                              //   answer = '0';
                              print(userInput);
                            });
                          }),

                      Button(
                          text: "X",
                          color: Colors.green,
                          buttontapped: () {
                            setState(() {
                              userInput += buttons[3];
                              // answer = '0';
                              print(userInput);
                            });
                          }),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Button(
                          text: "4",
                          buttontapped: () {
                            setState(() {
                              userInput += buttons[4];
                              // answer = '0';
                              print(userInput);
                            });
                          }),

                      Button(
                          text: "5",
                          buttontapped: () {
                            setState(() {
                              userInput += buttons[5];
                              // answer = '0';
                              print(userInput);
                            });
                          }),

                      Button(
                          text: "6",
                          buttontapped: () {
                            setState(() {
                              userInput += buttons[6];
                              // answer = '0';
                              print(userInput);
                            });
                          }),

                      Button(
                          text: "-",
                          color: Colors.green,
                          buttontapped: () {
                            setState(() {
                              userInput += buttons[7];
                              // answer = '0';
                              print(userInput);
                            });
                          }),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Button(
                          text: "1",
                          buttontapped: () {
                            setState(() {
                              userInput += buttons[8];
                              // answer = '0';
                              print(userInput);
                            });
                          }),

                      Button(
                          text: "2",
                          buttontapped: () {
                            setState(() {
                              userInput += buttons[9];
                              // answer = '0';
                              print(userInput);
                            });
                          }),

                      Button(
                          text: "3",
                          buttontapped: () {
                            setState(() {
                              userInput += buttons[10];
                              // answer = '0';
                              print(userInput);
                            });
                          }),

                      Button(
                          text: "+",
                          color: Colors.green,
                          buttontapped: () {
                            setState(() {
                              userInput += buttons[11];
                              // answer = '0';
                              print(userInput);
                            });
                          }),

                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Button(
                          text: "0",
                          buttontapped: () {
                            setState(() {
                              userInput += buttons[12];
                              // answer = '0';
                              print(userInput);
                            });
                          }),
                      Button(
                          text: "/",
                          color: Colors.green,
                          buttontapped: () {
                            setState(() {
                              userInput += buttons[15];
                              // answer = '0';
                              print(userInput);
                            });
                          }),
                      // Spacer(),
                      Button(
                          text: "%",
                          color: Colors.green,
                          buttontapped: () {
                            setState(() {
                              userInput += buttons[16];
                              // answer = '0';
                              print(userInput);
                            });
                          }),
                      Button(
                          text: "=",
                          color: Colors.green,
                          buttontapped: () {
                            setState(() {
                              Text("=");
                              equalPressed();
                            });
                          }),
                    ],
                  ),
                  //Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [

                         Button(
                            text: "C",
                            color: Colors.green,
                            buttontapped: () {
                              setState(() {
                                userInput = '';
                                answer = '0';
                              });
                            }),
    Button(
    text: ".",
    buttontapped: () {
    setState(() {
    userInput += buttons[13];
    // answer = '0';
    print(userInput);
    });
    }),
    //   Spacer(),
    Button(
    text: "Del",
    buttontapped: () {
    setState(() {
    userInput =
    userInput.substring(0, userInput.length - 1);
    // answer = '0';
    print(userInput);
    });
    }),

            ClipRect(
              child: Container(
                height:72,
                width: 72,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(60),
                    color: CupertinoColors.black,
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 20,
                          color: Colors.green

                      )
                    ]
                ),
                  child:    Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0,8),

                    child: Column(
                      children: [

                        IconButton(onPressed:(){ Navigator.push(context,MaterialPageRoute(builder:(context) => user_results(),));},icon: Icon(Icons.list_alt_rounded,),iconSize: 30,),
                     Text("Records",style:TextStyle(fontSize: 12,color: Colors.green),),

                      ],
                    ),
                  ),
              ),
            ),
                    ],
                  ),
                ],
              ),
          ),
        ),
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
