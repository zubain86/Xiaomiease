
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:xiaomiease/screens/homescreen/widgets/invoice_english_view.dart';
import '../../constants/colors.dart';
import '../../constants/strings.dart';
import '../../controllers/invoices_controller.dart';
import '../../env/dimensions.dart';
import '../../shared_widgets/appbar_eng_view.dart';
import '../../shared_widgets/custom_text.dart';
import 'package:pay/pay.dart';


class HomeScreen extends GetView<AllInvoiceController> {
  const HomeScreen({Key? key}) : super(key: key);
  static const _paymentItems = [
  PaymentItem(
    label: 'Total',
    amount: '99.99',
    status: PaymentItemStatus.final_price,
  )
];
void onGooglePayResult(paymentResult) {
    debugPrint(paymentResult.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack( 
    children: [
      Scaffold(
        backgroundColor: AppColors.kSecondaryColor,
        appBar: AppBar_eng(
          title: AppStrings.HOME_TITLE,
          actions: [
            InkWell(
              onTap: () {
                Get.toNamed("/new");
              },
              splashColor: AppColors.kSecondaryColor,
              customBorder: const CircleBorder(),
              child: SvgPicture.asset(
                "assets/icons/new_invoice.svg",
                height: Dimensions.calcH(25),
                color: AppColors.kPrimaryDark,
              ),
            ),
            SizedBox(
              width: Dimensions.calcW(15),
            ),
            
            // InkWell(
            //   onTap: () {},
            //   splashColor: AppColors.kSecondaryColor,
            //   customBorder: const CircleBorder(),
            //   child: SvgPicture.asset(
            //     "assets/icons/settings.svg",
            //     height: Dimensions.calcH(30),
            //     color: AppColors.kPrimaryDark,
            //   ),
            // ),
            // SizedBox(
            //   width: Dimensions.calcW(8),
            // ),
          ],
        ),
        
       

        body: Obx(() {
          if (controller.invoicesList.isEmpty) {
            return Center(
              child: CustomText(
                text: AppStrings.HOME_NO_INVOICES,
                color: Colors.black,
                fontSize: Dimensions.calcH(20),
                weight: FontWeight.w600,
              ),
            );
          } else {
            return Column(
              children: [
                ...controller.invoicesList
                    .map((invoice) => InvoiceView_eng(
                          invoice: invoice,
                        ))
                    .toList()
              ],
            );
          }
        }
        )
        
    ),
   Align(
   alignment: Alignment.bottomCenter,
   child: GooglePayButton(
            paymentConfigurationAsset:
                'gpay.json',
            paymentItems: _paymentItems,
            type: GooglePayButtonType.buy,
            margin: const EdgeInsets.only(top: 50.0),
            onPaymentResult: onGooglePayResult,
            loadingIndicator: const Center(
              child: CircularProgressIndicator(),
            ),
          ),
    
   ),]), );
  }
}

