import 'package:flutter/material.dart';
import 'package:t_store/features/shop/screens/orders/widgets/orders_list.dart';
import 'package:t_store/utils/constants/sizes.dart';

import '../../../../../common/widgets/appbar/appbar.dart';

class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// AppBar
      appBar: TAppBar(
        title: Text(
          "My Orders",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        showBackArrow: true,
      ),

      /// Body: Orders List
      body: const Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: TOrderListScreen(), // Ensure this widget exists in your project
      ),
    );
  }
}
