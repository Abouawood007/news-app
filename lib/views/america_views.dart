import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/data_model.dart';
import '../models/ui_model.dart';
class AmericaView extends StatefulWidget {
  const AmericaView({Key? key}) : super(key: key);

  @override
  State<AmericaView> createState() => _AmericaViewState();
}

class _AmericaViewState extends State<AmericaView> {
  var databody;

  @override
  void initState() {
    getdata();
    super.initState();
  }

  Autogenerated model = Autogenerated();
  bool loaded = false;

  Future getdata() async {
    loaded = true;
    setState(() {});
    String url =
        'https://newsapi.org/v2/top-headlines?country=us&apiKey=ec29b0dd18f04052a600f2761ec7542f';
    var data = await http.get(Uri.parse(url));
    databody = jsonDecode(data.body);

    model = Autogenerated.fromJson(databody);
    setState(() {
      loaded = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(elevation: 0,
            title: const Text(
                'Tout le monde',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)
            )),
        body: loaded == true
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
            itemCount: model.articles!.length,
            itemBuilder: (BuildContext context, int index) {
              return UiModel(
                title: model.articles![index].title,
                urlToImage: model.articles![index].urlToImage,
                publishedAt: model.articles![index].publishedAt,
              );
            }));
  }
}
