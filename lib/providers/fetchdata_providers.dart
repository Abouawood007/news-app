import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:stack/models/data_model.dart';

class FetchdataProvider extends ChangeNotifier
{
  bool loaded =false;
  var databody ;
Autogenerated model =Autogenerated();
  Future getdata() async {
    loaded = true;
    notifyListeners();
    String url =
        'https://newsapi.org/v2/top-headlines?country=de&apiKey=ec29b0dd18f04052a600f2761ec7542f';
    var data = await http.get(Uri.parse(url));
    databody = jsonDecode(data.body);

    model = Autogenerated.fromJson(databody);
    notifyListeners();
      loaded = false;

    }
}