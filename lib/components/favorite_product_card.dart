import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:clothes_map/utils/screen_util.dart';

class FavoriteProductCard extends StatelessWidget {
  final int id;
  final String description;
  final double price;
  final String imageUrl;
  final Function onUnFavorite;

  FavoriteProductCard({
    this.id,
    this.description,
    this.price,
    this.imageUrl,
    this.onUnFavorite,
  });

  final screenUtil = ScreenUtil.instance;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                height: 100,
                width: 100,
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      Center(
                    child: Container(
                      height: 40,
                      width: 40,
                      child: CircularProgressIndicator(
                        value: downloadProgress.progress,
                      ),
                    ),
                  ),
                  errorWidget: (context, url, error) =>
                      Icon(Icons.error, color: Colors.red),
                ),
              ),
              SizedBox(width: 5),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: AutoSizeText(
                      description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: screenUtil.setSp(18)),
                    ),
                  ),
                  AutoSizeText(
                    '$price جنيه',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: screenUtil.setSp(18)),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: <Widget>[
              IconButton(
                icon: Image.asset(
                  'assets/icons/add_to_cart.png',
                  height: 25,
                  width: 25,
                ),
                tooltip: 'إضافة لسلة المشتريات',
                onPressed: () {},
              ),
              IconButton(
                icon: Image.asset(
                  'assets/icons/view_product.png',
                  height: 25,
                  width: 25,
                ),
                tooltip: 'عرض المنتج',
                onPressed: () {},
              ),
              IconButton(
                icon: Image.asset(
                  'assets/icons/unfavorite.png',
                  height: 25,
                  width: 25,
                ),
                tooltip: 'حذف',
                onPressed: onUnFavorite,
              )
            ],
          ),
        ],
      ),
    );
  }
}
