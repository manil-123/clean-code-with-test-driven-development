import 'package:ecom_clean_code/core/widgets/custom_circular_progress_indicator.dart';
import 'package:ecom_clean_code/features/cart/presentation/cubit/get_cart_cubit.dart';
import 'package:ecom_clean_code/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/constants.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<GetCartCubit>(),
      child: CartListContentScreen(),
    );
  }
}

class CartListContentScreen extends StatefulWidget {
  const CartListContentScreen({super.key});

  @override
  State<CartListContentScreen> createState() => _CartListContentScreenState();
}

class _CartListContentScreenState extends State<CartListContentScreen> {
  @override
  void initState() {
    super.initState();
    context.read<GetCartCubit>().getCartList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(StringConstant.appName),
      ),
      body: BlocBuilder<GetCartCubit, GetCartState>(
        builder: (context, state) {
          if (state is GetCartListLoading) {
            return CustomCircularProgressIndicator();
          }
          if (state is GetCartListFailed) {
            return Container();
          }
          return Container();
        },
      ),
    );
  }
}
