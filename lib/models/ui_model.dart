import 'package:flutter/material.dart';

// ignore: must_be_immutable
class UiModel extends StatelessWidget {
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  UiModel(
      {super.key,
      this.title,
      this.content,
      this.publishedAt,
      this.urlToImage,
      this.author,
      this.url,
      this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.black.withOpacity(.3),
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            ListTile(title: Text(title!), trailing: Text(publishedAt!)),
            /*Row(
              children:  [Text(content!)],
            ),*/
            urlToImage != null
                ? ClipRRect(borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                      urlToImage!,
                      fit: BoxFit.cover,
                    ),
                )
                : const Text('image not found'),
          ],
        ),
      ),
    );
  }
}
