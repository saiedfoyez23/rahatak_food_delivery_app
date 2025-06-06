import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rahatak_food_delivery_app/controller/controller.dart';
import 'package:rahatak_food_delivery_app/screen/home_screen.dart';
import 'package:rahatak_food_delivery_app/screen/payment_screen.dart';
import 'package:rahatak_food_delivery_app/screen/screen.dart';
import 'package:rahatak_food_delivery_app/utils/utils.dart';
import 'package:webview_flutter/webview_flutter.dart';

class OrderPaymentScreen extends StatefulWidget {
  const OrderPaymentScreen({super.key,required this.url});
  final String url;
  @override
  State<OrderPaymentScreen> createState() => _OrderPaymentScreenState();
}

class _OrderPaymentScreenState extends State<OrderPaymentScreen> {

  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    // Initialize WebViewController
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted) // Enable JavaScript
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) {
            // Show loading indicator if needed
            print('Page started loading: $url');
          },
          onPageFinished: (String url) {
            // Page loaded
            print('Page finished loading: $url');
          },
          onWebResourceError: (WebResourceError error) {
            // Handle errors
            print('Error: ${error.description}');
          },
          onNavigationRequest: (NavigationRequest request) async {
            print("${request.url}");
            //Handle redirects or specific URLs (e.g., success/failure callbacks)
            if (request.url.contains('success') || request.url.contains('failure')) {
              // Handle payment result
              //_handlePaymentResult(request.url);
              await OrderController.getPaymentRequest(
                url: request.url,
                onSuccess: (e) async {
                  CustomSnackBar().successCustomSnackBar(context: context, message: e);
                  _successPage();
                },
                onFail: (e) async {
                  CustomSnackBar().errorCustomSnackBar(context: context, message: e);
                  _failedPage();
                },
                onExceptionFail: (e) async {
                  CustomSnackBar().errorCustomSnackBar(context: context, message: e);
                  _failedPage();
                },
              );
              return NavigationDecision.prevent; // Prevent navigation in WebView
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url)); // Load the Paymob URL
  }

  // Handle payment result based on redirect URL
  void _successPage() {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>PaymentSuccessScreen()));
  }


  void _failedPage() {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>PaymentFailedScreen()));
  }


  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (canPop,onPopInvoked) {
        Get.off(()=>HomeScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
      },
      child: Scaffold(
        body: WebViewWidget(controller: _controller),
      ),
    );
  }
}
