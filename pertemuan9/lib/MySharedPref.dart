import 'package:pertemuan9/MyModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MySharedPref{
  static const String keyValue = "value";
  static const String keyMyModel = "MyModel";

  Future<SharedPreferences> getPreferences() async=>
    await SharedPreferences.getInstance();

  setValue(String value) async{
    (await getPreferences()).setString(keyValue, value);
  }

  Future<String?> getValue() async=>
    (await getPreferences()).getString(keyValue);

  setModel(MyModel model) async{
    (await getPreferences()).setString(keyMyModel, MyModelToJson(model));
  }

  Future<MyModel?> getModel() async{
    var data = (await getPreferences()).getString(keyMyModel);
    if (data != null) return MyModelFromJson(data);
    return null;
  }

  Future<bool> clearAllData() async{
    var sharedPref = await SharedPreferences.getInstance();
    sharedPref.remove(keyValue);
    sharedPref.remove(keyMyModel);
    return true;
  }
}