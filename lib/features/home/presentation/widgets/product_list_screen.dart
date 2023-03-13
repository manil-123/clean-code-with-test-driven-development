import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecom_clean_code/app/theme/app_colors.dart';
import 'package:ecom_clean_code/features/categories/domain/entity/category.dart';
import 'package:ecom_clean_code/features/categories/presentation/cubit/category_cubit.dart';
import 'package:ecom_clean_code/features/home/domain/entities/product_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductListScreen extends StatefulWidget {
  final List<Product> productsList;
  const ProductListScreen({super.key, required this.productsList});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  void initState() {
    super.initState();
    context.read<CategoryCubit>().getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () => _showBottomModelSheet(context),
                icon: Icon(
                  Icons.filter_list,
                  size: 30,
                ),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 3 / 6.3,
              ),
              itemCount: widget.productsList.length,
              itemBuilder: (context, index) {
                final item = widget.productsList[index];
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
                      Container(
                        height: 200,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        child: CachedNetworkImage(
                          imageUrl: item.image!,
                          fit: BoxFit.contain,
                        ),
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
                                    style:
                                        Theme.of(context).textTheme.headline4,
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    '\$${item.price!}',
                                    style:
                                        Theme.of(context).textTheme.headline4,
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
          ],
        ),
      ),
    );
  }

  void _showBottomModelSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isDismissible: true,
      backgroundColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      builder: (context) {
        return BlocBuilder<CategoryCubit, CategoryState>(
          builder: (context, state) {
            if (state is! CategoryLoaded) return Container();
            log(state.selectedCategory.toString());
            return Container(
              padding: EdgeInsets.all(8.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 8.0,
                  ),
                  Center(
                    child: Text(
                      'Filter Categories',
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.builder(
                        itemCount: state.categoriesList.length,
                        itemBuilder: (context, index) {
                          final category = state.categoriesList[index];
                          return Row(
                            children: [
                              Checkbox(
                                  value: category == state.selectedCategory,
                                  onChanged: (newValue) {
                                    BlocProvider.of<CategoryCubit>(context)
                                        .updateSelectedCategory(category);
                                  }),
                              Text(category.categoryName),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                            const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 40.0),
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                          ),
                        ),
                        onPressed: () {},
                        child: Text('Filter'),
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        );
      },
    );
  }
}
