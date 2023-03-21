import 'package:flutter/material.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import '../models/data_model.dart';
import '../models/ui_model.dart';
import '../providers/fetchdata_providers.dart';

class GermanyView extends StatefulWidget {
  const GermanyView({Key? key}) : super(key: key);

  @override
  State<GermanyView> createState() => _GermanyViewState();
}

class _GermanyViewState extends State<GermanyView> {

  @override
  void initState() {
    Provider.of<FetchdataProvider>(context, listen: false).getdata();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(elevation: 0,
            title: const Text(
                'Tout le monde',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)
            )),
        body: Consumer<FetchdataProvider>(builder: (_,value, __){
          if(value.loaded==true)
            {
              return const Center(child:CircularProgressIndicator());
            }

    return ListView.builder(
    itemCount: value.model.articles!.length,
    itemBuilder: (BuildContext context, int index) {
    return UiModel(
    title: value.model.articles![index].title,
    urlToImage: value.model.articles![index].urlToImage,
    publishedAt: value.model.articles![index].publishedAt,
    );
    });
        })

    );
  }
}

