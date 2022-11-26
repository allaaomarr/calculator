class  Results{
  int?  id;
  String?  title;
  String result;
 Results({this.id , this.title,required this.result});
  // to get data
  factory Results.fromMap(Map<String,dynamic> json) => Results(id : json["id"],title: json["title"], result: json["result"]);
  Map<String,dynamic> toMap()=>
      {
        "id" : id,
        "title" : title,
        "result" :result,

      };
}