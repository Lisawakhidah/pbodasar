// to parse this json data do
//
//final mymodel = mymodelfromtojson(jsonstring);
import 'dart:convert';

MyModel MyModelFromJson(String str) => MyModel.fromJson(json.decode(str));

String MyModelToJson(MyModel data) => json.encode(data.toJson());

class MyModel {
  MyModel({
    required this.greeting,
    required this.instructions,
  });

  String greeting;
  List<String> instructions;

  factory MyModel.fromJson(Map<String, dynamic> json) => MyModel(
        greeting: json["greeting"],
        instructions: List<String>.from(json["instructions"].map((x) => x)),
      );
  
  Map<String, dynamic> toJson() => {
    "greeting": greeting,
    "instructions": List<dynamic>.from(instructions.map((x) => x)),
  };
}
