import 'package:flutter/material.dart';
import 'package:shop_app/components/custom_bottom_nav_bar.dart';
import 'package:shop_app/core/constants/size_constants.dart';
import 'package:shop_app/enums.dart';
import 'package:shop_app/models/Product2.dart';
import 'package:shop_app/screens/deatils/details_screen.dart';
import 'package:shop_app/screens/home_2/provider/home_provider.dart';

import 'components/cart_details_view.dart';
import 'components/cart_short_view.dart';
import 'components/header.dart';
import 'components/product_card.dart';

// Today i will show you how to implement the animation
// So starting project comes with the UI
// Run the app

class HomeScreen1 extends StatelessWidget {
  static String routeName = "/home1";

  final controller = HomeProvider();

  void _onVerticalGesture(DragUpdateDetails details) {
    if (details.primaryDelta! < -0.7) {
      controller.changeHomeState(HomeState.cart);
    } else if (details.primaryDelta! >= 2) {
      controller.changeHomeState(HomeState.normal);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.favourite),
      body: SafeArea(
        bottom: false,
        child: Container(
          color: Color(0xFFEAEAEA),
          child: AnimatedBuilder(
              animation: controller,
              builder: (context, _) {
                return LayoutBuilder(
                  builder: (context, BoxConstraints constraints) {
                    return Stack(
                      children: [
                        AnimatedPositioned(
                          duration: panelTransition,
                          top: controller.homeState == HomeState.normal
                              ? headerHeight
                              : -(constraints.maxHeight -
                              cartBarHeight * 2 -
                              headerHeight),
                          left: 0,
                          right: 0,
                          height: constraints.maxHeight -
                              headerHeight -
                              cartBarHeight,
                          child: GestureDetector(
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: defaultPadding),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: const BorderRadius.only(
                                  bottomLeft:
                                  Radius.circular(defaultPadding * 1.5),
                                  bottomRight:
                                  Radius.circular(defaultPadding * 1.5),
                                ),
                              ),
                              child: GridView.builder(
                                itemCount: demo_products.length,
                                gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 0.75,
                                  mainAxisSpacing: defaultPadding,
                                  crossAxisSpacing: defaultPadding,
                                ),
                                itemBuilder: (context, index) => ProductCard(
                                  product: demo_products[index],
                                  press: () {
                                    Navigator.push(
                                      context,
                                      PageRouteBuilder(
                                        transitionDuration:
                                        const Duration(milliseconds: 500),
                                        reverseTransitionDuration:
                                        const Duration(milliseconds: 500),
                                        pageBuilder: (context, animation,
                                            secondaryAnimation) =>
                                            FadeTransition(
                                              opacity: animation,
                                              child: DetailsScreen(
                                                quantity: controller.getQuantity(demo_products[index]),
                                                provider: controller,
                                                product: demo_products[index],
                                                onProductAdd: () {
                                                  controller.addProductToCart(
                                                      demo_products[index]);
                                                },
                                                onProductRemove: () {
                                                  controller.removeProductToCart(
                                                      demo_products[index]);
                                                },
                                              ),
                                            ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                        // Card Panel
                        AnimatedPositioned(
                          duration: panelTransition,
                          bottom: 0,
                          left: 0,
                          right: 0,
                          height: controller.homeState == HomeState.normal
                              ? cartBarHeight
                              : (constraints.maxHeight - cartBarHeight),
                          child: GestureDetector(
                            onVerticalDragUpdate: _onVerticalGesture,
                            child: Container(
                              padding: const EdgeInsets.all(defaultPadding),
                              color: Color(0xFFEAEAEA),
                              alignment: Alignment.topLeft,
                              child: AnimatedSwitcher(
                                duration: panelTransition,
                                child: controller.homeState == HomeState.normal
                                    ? CardShortView(provider: controller)
                                    : CartDetailsView(provider: controller),
                              ),
                            ),
                          ),
                        ),
                        // Header
                        AnimatedPositioned(
                          duration: panelTransition,
                          top: controller.homeState == HomeState.normal
                              ? 0
                              : -headerHeight,
                          right: 0,
                          left: 0,
                          height: headerHeight,
                          child: HomeHeader(),
                        ),
                      ],
                    );
                  },
                );
              }),
        ),
      ),
    );
  }
}
