import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/data/model/news_model.dart';

import '../../../../data/loacal/hive_local_storg.dart';

class CardNews extends StatefulWidget {
  const CardNews({
    super.key,
    required this.news,
    required this.onTapNews,
    required this.isSaved,
    this.onChangeSavedNews,
  });
  final NewsModel news;
  final Function() onTapNews;
  final bool isSaved;
  final ValueChanged<String>? onChangeSavedNews;

  @override
  State<CardNews> createState() => _CardNewsState();
}

class _CardNewsState extends State<CardNews> {
  late bool isSavedNews;
  @override
  void initState() {
    isSavedNews = widget.isSaved;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: widget.onTapNews,
        child: Card(
          child: SizedBox(
            height: 150,
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () {
                          context.read<HiveStorg>().addOrRemoveNewsFromBox(
                              widget.news.toJson(), widget.news.title);
                          if (widget.onChangeSavedNews != null) {
                            widget.onChangeSavedNews!(widget.news.title);
                          }
                          setState(() {
                            isSavedNews = !isSavedNews;
                          });
                        },
                        icon: Icon(
                          isSavedNews
                              ? Icons.bookmark_remove
                              : Icons.bookmark_add,
                          color: isSavedNews ? Colors.red : Colors.white,
                        ),
                      ),
                      Expanded(
                        child: widget.news.urlToImage == null
                            ? const Center(
                                child: Text(
                                  'No Image',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            : Image.network(
                                widget.news.urlToImage!,
                                loadingBuilder:
                                    (context, child, loadingProgress) {
                                  return loadingProgress == null
                                      ? child
                                      : const Center(
                                          child: CircularProgressIndicator(
                                              color: Colors.red),
                                        );
                                },
                                errorBuilder: (context, error, stackTrace) {
                                  return const Center(
                                    child: Text(
                                      'Image error',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  );
                                },
                              ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          widget.news.title,
                          maxLines: 2,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          widget.news.description ?? '',
                          maxLines: 3,
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                        Row(
                          children: [
                            const Text('Crated At : '),
                            Text(widget.news.publishedAt.split('T').first)
                          ],
                        )
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
