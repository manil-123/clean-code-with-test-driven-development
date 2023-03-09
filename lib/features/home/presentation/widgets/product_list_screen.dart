import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecom_clean_code/app/theme/app_colors.dart';
import 'package:ecom_clean_code/features/home/domain/entities/product_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductListScreen extends StatelessWidget {
  final List<Product> productsList;
  const ProductListScreen({super.key, required this.productsList});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 3 / 6.3,
        ),
        itemCount: productsList.length,
        itemBuilder: (context, index) {
          final item = productsList[index];
          return Container(
            width: MediaQuery.of(context).size.width * 0.44,
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.primaryDark,
              ),
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: CachedNetworkImage(
                        imageUrl: item.image!,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    Container(
                      height: 200,
                      color: Colors.black.withOpacity(0.3),
                    ),
                    Positioned(
                      top: 5,
                      right: 5,
                      child: Icon(
                        Icons.favorite_outline,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Text(
                              item.title!,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.headline4,
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              '\$${item.price!}',
                              style: Theme.of(context).textTheme.headline4,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 16.0,
                      ),
                      RatingBarIndicator(
                        rating: double.parse(
                          item.rating!.rate!.toString(),
                        ),
                        itemCount: 5,
                        itemSize: 20.0,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                      ),
                      SizedBox(
                        width: 8.0,
                      ),
                      Text('(${item.rating!.count!})'),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
