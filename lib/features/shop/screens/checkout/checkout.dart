import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/features/authentication/screens/signup/success_screen.dart';
import 'package:t_store/features/shop/screens/cart/widgets/cart_item.dart';
import 'package:t_store/features/shop/screens/checkout/widgets/billing_amount.dart';
import 'package:t_store/features/shop/screens/checkout/widgets/coupon_widget.dart';
import 'package:t_store/navigation_menu.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

import '../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../utils/constants/colors.dart';
import 'package:get/get.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(
          "Order Review",
          style: Theme
              .of(context)
              .textTheme
              .headlineSmall,
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () =>
              Get.to(
                    () =>
                    SuccessScreen(
                      title: "Payment Success!",
                      subTitle: "Your item will be shipped soon!",
                      imagePath: TImages.successfulPaymentIcon,
                      buttonText: 'Continue',
                      onButtonPressed: () => Get.offAll(() => const NavigationMenu()),
                    ),
              ),
          child: const Text("Confirm Order"),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [

                /// Items in Cart
                const ProductCartItem(showAddRemoveButtons: false),
                const SizedBox(height: TSizes.spaceBtwSections),

                const

                /// Coupon TextField
                CouponWidget(),

                ///Billing Section
                const SizedBox(
                  height: TSizes.spaceBtwItems,
                ),
                TRoundedContainer(
                  showBorder: true,
                  backgroundColor: isDarkMode ? TColors.black : TColors.
                  white,
                  child: const Column(
                    children: [
                      TBillingAmountSection(),
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}
