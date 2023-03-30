import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecom_clean_code/app/theme/app_colors.dart';
import 'package:ecom_clean_code/core/constants/constants.dart';
import 'package:ecom_clean_code/features/cart/presentation/cubit/add_to_cart_cubit.dart';
import 'package:ecom_clean_code/features/home/domain/entities/product_entity.dart';
import 'package:ecom_clean_code/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<AddToCartCubit>(),
      child: ProductDetailContentScreen(product: product),
    );
  }
}

class ProductDetailContentScreen extends StatefulWidget {
  final Product product;
  const ProductDetailContentScreen({super.key, required this.product});

  @override
  State<ProductDetailContentScreen> createState() =>
      _ProductDetailContentScreenState();
}

class _ProductDetailContentScreenState
    extends State<ProductDetailContentScreen> {
  final double appBarExtendedHeight = 350;
  ScrollController? _scrollController;
  Color _appBarColor = Colors.white;

  @override
  void initState() {
    super.initState();
    _initScrollController();
  }

  void _initScrollController() {
    _scrollController = ScrollController()
      ..addListener(
        () => _isAppBarExpanded
            ? _appBarColor != AppColors.primaryDark
                ? setState(
                    () {
                      _appBarColor = AppColors.primaryDark;
                    },
                  )
                : {}
            : _appBarColor != Colors.white
                ? setState(() {
                    _appBarColor = Colors.white;
                  })
                : {},
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return <Widget>[
            _extendedAppBar(),
          ];
        },
        body: _productBody(),
      ),
    );
  }

  Widget _extendedAppBar() {
    return SliverAppBar(
      centerTitle: true,
      toolbarHeight: 50,
      elevation: 1,
      expandedHeight: appBarExtendedHeight,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        background: _getExtendedAppbarContent(),
      ),
    );
  }

  bool get _isAppBarExpanded {
    return _scrollController!.hasClients &&
        _scrollController!.offset > (appBarExtendedHeight - kToolbarHeight);
  }

  Widget _getExtendedAppbarContent() {
    return Stack(
      fit: StackFit.expand,
      children: [
        _getImageWidget(),
        Container(
          color: Colors.black.withOpacity(0.4),
        ),
        Positioned(
          bottom: 30,
          right: 16,
          left: 16,
          child: Text(
            widget.product.title!,
            maxLines: 2,
            style: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(color: Colors.white),
          ),
        ),
      ],
    );
  }

  Widget _getImageWidget() {
    return SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: CachedNetworkImage(
          imageUrl: widget.product.image!,
          fit: BoxFit.fill,
          errorWidget: (context, url, error) {
            return const Icon(Icons.error);
          },
          colorBlendMode: BlendMode.darken,
        ));
  }

  Widget _productBody() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            StringConstant.descriptionText,
            style: Theme.of(context).textTheme.headline3,
          ),
          Text(
            StringConstant.productDetailText,
          ),
          SizedBox(
            height: 16.0,
          ),
          Row(
            children: [
              Text(
                StringConstant.ratingText,
                style: Theme.of(context).textTheme.headline3,
              ),
              SizedBox(
                width: 8.0,
              ),
              RatingBarIndicator(
                rating: double.parse(
                  widget.product.rating!.rate!.toString(),
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
              Text('(${widget.product.rating!.count!})'),
            ],
          ),
          SizedBox(
            height: 24.0,
          ),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('Buy'),
                ),
              ),
              SizedBox(
                width: 16.0,
              ),
              Expanded(
                child: ElevatedButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(vertical: 14.0),
                    ),
                  ),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text('Add to cart'),
                      SizedBox(
                        width: 2.0,
                      ),
                      Icon(Icons.shopping_cart)
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
