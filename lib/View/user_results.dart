import 'package:calculator/Model/results_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:calculator/Controller/results_db.dart';
class user_results extends StatefulWidget {
  const user_results({Key? key}) : super(key: key);

  @override
  State<user_results> createState() => _user_resultsState();
}

class _user_resultsState extends State<user_results> {
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
        appBar:  AppBar( backgroundColor: Colors.black,title: Text("Records"), centerTitle: true, ),
      body :
      fetching
          ? Center(child: CircularProgressIndicator(color: Colors.green,))
          :ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount:datas.length,
          itemBuilder: (BuildContext context, int index) {


            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Container(
                  height: 100,

                  decoration: BoxDecoration(
                    color: Colors.black,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 20,
                        color: Colors.green

                      )
                    ],
                    border:
                      Border(
                        right: BorderSide(width: 9.0, color: Colors.green),

                      ),
                    ),

                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(13),
                      child: Column
                        (
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        children: [

                          Row(
                          //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(Icons.title,color: Colors.green,),
                              SizedBox(width: 20,),
                              Text(datas[index].title.toString(),style: TextStyle
                                (color: Colors.white,fontSize: 20),),
                              IconButton(onPressed: (){delete(index);}, icon: Icon(Icons.highlight_remove_outlined,color: Colors.green,)),
                            ],

                          ),

                      Row(
                      //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.calculate_outlined,color: Colors.green,),
                          SizedBox(width: 20,),
                          Text(datas[index].result.toString(),style: TextStyle
                            (color: Colors.white,fontSize: 20),),
                        ],
                      ),

                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }
        )
    );
  }
  delete(int index) {
    debugPrint("Deleted!");
    db.delete(datas[index].id!);
    setState(() {
      datas.removeAt(index);
    });
  }
}
