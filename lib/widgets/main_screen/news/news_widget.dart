import 'package:flutter/material.dart';
import 'package:smart_office/models/news/news_model.dart';
import 'package:smart_office/theme/theme.dart';

class NewsWidget extends StatefulWidget {
  const NewsWidget({
    super.key,
    required this.news,
  });

  final News news;

  @override
  State<NewsWidget> createState() {
    return _NewsWidgetState();
  }
}

class _NewsWidgetState extends State<NewsWidget> {
  bool _openedNews = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(14, 0, 14, 14),
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      decoration: whiteBoxDecoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.network(
                  widget.news.creatorProfileImage,
                  height: 50,
                  width: 50,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.news.creatorName,
                    style: const TextStyle(
                      height: 0.8,
                      color: AppColors.purple,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    widget.news.creatorPosition,
                    style: const TextStyle(
                      height: 1,
                      color: AppColors.purple,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    widget.news.dateToString,
                    style: const TextStyle(
                      height: 1.1,
                      color: AppColors.purple,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Divider(),
          if (!_openedNews)
            widget.news.images.isEmpty
                ? Text(
                    widget.news.content,
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                : SizedBox(
                    height: 130,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: SizedBox(
                              width: 140,
                              child: Image.network(widget.news.images[0], fit: BoxFit.cover,)),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                            child: Text(
                              widget.news.content,
                              maxLines: 7,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
          if (_openedNews) ...[
            Wrap(
              runSpacing: 10,
              children: widget.news.images
                  .map((i) => ClipRRect(borderRadius: BorderRadius.circular(10), child: Image.network(i)))
                  .toList(),
            ),
            if (widget.news.images.isNotEmpty) Divider(),
            Text(
              widget.news.content,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 13,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
          TextButton(
            onPressed: () {
              if (!_openedNews) {
                _openedNews = true;
              } else {
                _openedNews = false;
              }
              setState(() {});
            },
            style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 0)),
            child: Text(_openedNews ? 'Свернуть новость' : 'Показать еще'),
          )
        ],
      ),
    );
  }
}
