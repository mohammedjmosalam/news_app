import 'package:flutter/material.dart';
import 'package:news_app/data/model/news_model.dart';
import 'package:news_app/show_single_news/widget/row_text.dart';

class ShowSingleNews extends StatelessWidget {
  const ShowSingleNews({
    super.key,
    required this.newsModel,
  });
  final NewsModel newsModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News Review'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Expanded(
                child: newsModel.urlToImage == null
                    ? const Center(
                        child: Text(
                          'No Image',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      )
                    : Image.network(
                        newsModel.urlToImage!,
                        loadingBuilder: (context, child, loadingProgress) {
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
              Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      RowTitle(
                        title: 'Author : ',
                        value: newsModel.author ?? '',
                      ),
                      RowTitle(
                        title: 'published At : ',
                        value: newsModel.publishedAt,
                      ),
                      RowTitle(
                        title: 'Title : ',
                        value: newsModel.title,
                      ),
                      RowTitle(
                        title: 'Description : ',
                        value: newsModel.description ?? '',
                      ),
                      RowTitle(
                        title: 'Content : ',
                        value: newsModel.content ?? '',
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
