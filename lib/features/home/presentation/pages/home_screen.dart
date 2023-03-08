import 'package:ecom_clean_code/features/home/presentation/cubit/product_cubit_cubit.dart';
import 'package:ecom_clean_code/features/home/presentation/widgets/product_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ProductCubit>(context).fetchProductsList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: BlocBuilder<ProductCubit, ProductState>(
        builder: ((context, state) {
          if (state is ProductLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ProductFailed) {
            return Center(
              child: Text(state.errorMessage),
            );
          } else if (state is ProductLoaded) {
            return ProductListScreen(
              productsList: state.productsList,
            );
          }
          return Container();
        }),
      ),
    );
  }
}
