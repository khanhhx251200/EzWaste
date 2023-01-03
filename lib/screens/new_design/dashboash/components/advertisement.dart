import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/core/constants/color_constants.dart';
import 'package:shop_app/core/constants/size_constants.dart';

class Advertisement extends StatefulWidget {
  const Advertisement({Key? key}) : super(key: key);

  @override
  State<Advertisement> createState() => _AdvertisementState();
}

class _AdvertisementState extends State<Advertisement> {
  int currentPage = 0;
  List<Map<String, String>> imageData = [
    {
      "text": "Chào mừng bạn đến với Veca!",
      "image": "assets/images/banner.png"
    },
    {
      "text":
          "Chúng tôi giúp mọi người kết nối \nvới cửa hàng trên khắp Việt Nam",
      "image": "assets/images/banner.png"
    },
    {
      "text":
          "Chúng tôi chỉ cho bạn cách mua bán dễ dàng. \nChỉ cần ở nhà với chúng tôi",
      "image": "assets/images/banner.png"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            child: CarouselSlider(
                items: List.generate(
                  imageData.length,
                  (index) {
                    return Container(
                      color: kErrorColor,
                      child: Image.asset(
                        imageData[index]['image']!,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                ),
                options: CarouselOptions(
                  autoPlay: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentPage = index;
                    });
                  },
                  enlargeCenterPage: false,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  // enableInfiniteScroll: true,
                  autoPlayAnimationDuration: Duration(milliseconds: 500),
                  height: 170,
                  viewportFraction: 1,
                  clipBehavior: Clip.none,
                )),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: size16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                imageData.length,
                (index) {
                  return buildDot(index: index);
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: size8),
      height: size8,
      width: currentPage == index ? size24 : size8,
      decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryColor : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(size8),
      ),
    );
  }
}
