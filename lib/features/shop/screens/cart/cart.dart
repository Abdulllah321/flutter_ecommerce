import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/texts/product_price_text.dart';
import 'package:t_store/features/shop/screens/cart/widgets/cart_item.dart';
import 'package:t_store/features/shop/screens/checkout/checkout.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';
import '../../../../common/widgets/products/cart/product_quantity_with_add_remove_button.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(
          "Cart",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child:
            ElevatedButton(onPressed: () => Get.to(()=> const CheckoutScreen()), child: const Text("Checkout \$256.0")),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: ListView.separated(
              shrinkWrap: true,
              // ✅ Fix: Allows ListView to fit within its content
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (_, __) => const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
              itemCount: 4,
              itemBuilder: (_, index) => const Column(
                    children: [
                      ProductCartItem(),
                      SizedBox(
                        height: TSizes.spaceBtwItems,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 70,
                          ),
                          TProductQuantityWithAddAndRemoveButton(),
                          TProductPriceText(price: "256",)
                        ],
                      )
                    ],
                  )),
        ),
      ),
    );
  }
}
