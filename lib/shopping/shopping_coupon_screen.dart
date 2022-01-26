// import 'package:UIKit/screens/other/TermsScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutx/themes/app_theme.dart';
import 'package:flutx/utils/spacing.dart';
import 'package:flutx/widgets/button/button.dart';
import 'package:flutx/widgets/card/card.dart';
import 'package:flutx/widgets/text/text.dart';
import 'package:local_notifaiction/services/apptheme.dart';
import 'package:local_notifaiction/shopping/terms_screen.dart';
import 'package:local_notifaiction/ui/widgets/custom_transitions.dart';
import 'package:nb_utils/src/extensions/widget_extensions.dart';

// import '../../AppTheme.dart';

class ShoppingCouponScreen extends StatefulWidget {
  @override
  _ShoppingCouponScreenState createState() => _ShoppingCouponScreenState();
}

class _ShoppingCouponScreenState extends State<ShoppingCouponScreen> {
  Widget build(BuildContext context) {
    return Theme(
      data: FxAppTheme.theme.copyWith(
          colorScheme: FxAppTheme.theme.colorScheme.copyWith(
              secondary: FxAppTheme.theme.primaryColor.withAlpha(10))),
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: FxAppTheme.theme.scaffoldBackgroundColor,
            elevation: 0,
            // leading: IconButton(
            //   onPressed: () => Navigator.of(context).pop(),
            //   icon: Icon(MdiIcons.chevronLeft),
            // ),
            title: Text("Coupons",
                style: AppTheme.getTextStyle(
                    FxAppTheme.theme.textTheme.headline6,
                    fontWeight: 600)),
          ),
          body: Container(
            child: ListView(
              padding: FxSpacing.x(16),
              children: <Widget>[
                FxText.caption("Active".toUpperCase(),
                    muted: true, fontWeight: 700),
                FxSpacing.height(16),
                singleCoupon(
                    image: "images/shopping/offer/offer-1.png",
                    offer:
                        "Gift Card Valued at \$100 or 20% off at Puma stores",
                    expireDate: "04 Jun 2020"),
                FxSpacing.height(16),
                singleCoupon(
                    image: "images/shopping/offer/offer-1.png",
                    offer: "Gift Card Valued at \$50 or 10% off at all stores",
                    expireDate: "16 July 2020"),
                FxSpacing.height(16),
                FxText.caption("Upcoming".toUpperCase(),
                    muted: true, fontWeight: 700),
                FxSpacing.height(16),
                singleCoupon(
                    image: "images/shopping/offer/offer-2.png",
                    offer:
                        "Gift Card Valued at \$100 or 20% off at Puma stores",
                    comingDate: "04 Aug 2020",
                    isActive: false),
                FxSpacing.height(16),
                singleCoupon(
                    image: "images/shopping/offer/offer-2.png",
                    offer: "Gift Card Valued at \$50 or 10% off at all stores",
                    comingDate: "16 Aug 2020",
                    isActive: false),
              ],
            ),
          )),
    );
  }

  Widget singleCoupon(
      {required String image,
      required String offer,
      String? expireDate,
      bool isActive = true,
      String? comingDate}) {
    return FxCard(
      paddingAll: 24,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(image), fit: BoxFit.fill),
                ),
              ),
              FxSpacing.width(16),
               FxText.b2(offer, fontWeight: 600, letterSpacing: 0.2).expand( )
            ],
          ),
          FxSpacing.height(16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      FxText.caption(
                        isActive ? "Expires" : "Coming at",
                        muted: true,
                      ),
                      FxText.b2(isActive ? expireDate! : comingDate!,
                          fontWeight: 600),
                      FxSpacing.height(8),
                      FxButton.text(
                        padding: FxSpacing.zero,
                        onPressed: () {
                          Navigator.push(
                              context, CostumNvigator(const TermsScreen()));
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => TermsScreen()));
                        },
                        child: FxText.caption("Terms \& Condition Apply",
                            muted: true,
                            letterSpacing: 0,
                            color: FxAppTheme.theme.colorScheme.primary,
                            fontWeight: 600),
                      )
                    ],
                  ),
                ).expand(),
              FxButton(
                  backgroundColor: FxAppTheme.theme.colorScheme.primary,
                  borderRadiusAll: 4,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: FxText.button(
                    isActive ? "Apply" : "Activate",
                    fontWeight: 600,
                    color: isActive
                        ? FxAppTheme.theme.colorScheme.onPrimary
                        : FxAppTheme.customTheme.onDisabled,
                    letterSpacing: 0.5,
                  ))
            ],
          )
        ],
      ),
    );
  }
}
