import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/core/constants/color_constants.dart';
import 'package:shop_app/core/constants/size_constants.dart';
import 'package:shop_app/core/constants/strings_constant.dart';
import 'package:shop_app/screens/new_design/dashboash/account/components/wallet/my_wallet/components/action_wallet.dart';
import 'package:shop_app/screens/new_design/dashboash/account/components/wallet/my_wallet/components/wallet_balance.dart';
import 'package:shop_app/screens/new_design/dashboash/account/components/wallet/transaction_history/list_transaction_history.dart';

class MyWalletScreen extends StatelessWidget {
  static final String routeName = "/my-wallet";

  const MyWalletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      extendBody: true,
      body: SafeArea(
          child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              headerWallet(size, context),
              transactionHistory(context)
            ],
          ),
        ),
      )),
    );
  }

  Container transactionHistory(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: size16, horizontal: size24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            kTransactionHistory,
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(fontSize: size16, fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: size8,
          ),
          ListTransactionHistory(),
          Center(
            child: ElevatedButton(
              onPressed: () {},
              child: Text(kSeeAll),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: size40),

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(size10),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Container headerWallet(Size size, BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: size8 * 2.5),
      // It will cover 20% of our total height
      height: size.height * 0.3,
      child: Stack(
        children: <Widget>[
          buildWalletBalance(size),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: buildAppBar(context),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: actions(),
          ),
        ],
      ),
    );
  }

  Container buildWalletBalance(Size size) {
    return Container(
      padding: EdgeInsets.only(
        left: size8,
        right: size8,
        bottom: size36 + size8,
      ),
      height: size.height * 0.3 - size32,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            kPrimaryColor.withOpacity(0.9),
            kPrimaryColor,
          ],
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(48),
          bottomRight: Radius.circular(48),
        ),
        // image: DecorationImage(
        //     image: AssetImage('assets/images/bg_silver.jpg'),
        //     fit: BoxFit.cover),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          WalletBalance(),
        ],
      ),
    );
  }

  Container actions() {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: size24),
      padding: EdgeInsets.symmetric(horizontal: size32, vertical: size8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(size12),
        boxShadow: [
          BoxShadow(offset: Offset(0, 2), blurRadius: size8, spreadRadius: 0),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          ActionMyWallet(
            title: kRecharge,
            iconPath: 'assets/icons/recharge.png',
            press: () => print(kRecharge),
          ),
          ActionMyWallet(
            title: kWithdraw,
            iconPath: 'assets/icons/withdraw.png',
            press: () => print(kWithdraw),
          ),
          ActionMyWallet(
            title: kTransferMoney,
            iconPath: 'assets/icons/transfer_money.png',
            press: () => print(kTransferMoney),
          ),
          ActionMyWallet(
            title: kWithdraw,
            iconPath: 'assets/icons/locations.png',
            press: () => print(kWithdraw),
          ),
        ],
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      centerTitle: true,
      leading: IconButton(
        icon: BackButtonIcon(),
        color: kWhiteColor,
        onPressed: () => Navigator.pop(context),
      ),
      title: Text(
        kMyWallet,
        style: TextStyle(fontWeight: FontWeight.w700, fontSize: size18),
      ),
      actions: [
        IconButton(
          onPressed: () => print('hj'),
          icon: SvgPicture.asset('assets/icons/cash.svg', color: kWhiteColor),
        )
      ],
    );
  }
}
