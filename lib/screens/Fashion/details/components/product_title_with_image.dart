import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:plenty/config/btn_txt.dart';
import 'package:plenty/config/colors.dart';
import 'package:plenty/config/constants.dart';
import 'package:plenty/data/fashion_product.dart';

class ProductTitleWithImage extends StatelessWidget {
  const ProductTitleWithImage({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "${product.id}",
      child: Container(
        //margin: EdgeInsets.all(5),
        height: 350,
        child: Swiper(
          itemBuilder: (BuildContext context, int index) {
            return FittedBox(
              child: Card(
                elevation: 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Image.asset(
                        product.image,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          itemCount: 3,
          viewportFraction: 0.8,
          scale: 0.8,
          pagination: new SwiperPagination(),
          //control: new SwiperControl(),
          layout: SwiperLayout.DEFAULT,
          //containerHeight: 500,
          //itemHeight: 280,
          //itemWidth: 280.0,
        ),
      ),
    );
  }
}
