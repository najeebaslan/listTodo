import 'package:flutter/material.dart';
import 'package:flutx/themes/app_theme.dart';
import 'package:flutx/utils/spacing.dart';
import 'package:flutx/widgets/button/button.dart';
import 'package:flutx/widgets/card/card.dart';
import 'package:flutx/widgets/text/text.dart';

class ShoppingOrderPlaceScreen extends StatefulWidget {
  @override
  _ShoppingOrderPlaceScreenState createState() =>
      _ShoppingOrderPlaceScreenState();
}

class _ShoppingOrderPlaceScreenState extends State<ShoppingOrderPlaceScreen> {
  void _showDialog() {
    showDialog(
        context: context, builder: (BuildContext context) => _ScratchDialog());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Image(
                image: AssetImage(
                    'images/illustration/shopping/order-confirm.png'),
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.width * 0.5,
              ),
            ),
            FxSpacing.height(32),
            FxText.b2(
              "Your order placed successfully",
            ),
            FxSpacing.height(16),
            FxText.b2(
              "You won a scratch coupon",
            ),
            FxSpacing.height(16),
            FxButton(
                backgroundColor: FxAppTheme.theme.colorScheme.primary,
                borderRadiusAll: 4,
                elevation: 0,
                onPressed: () {
                  _showDialog();
                },
                child: FxText.b2("Scratch",
                    fontWeight: 600,
                    color: FxAppTheme.theme.colorScheme.onPrimary)),
          ],
        ),
      ),
    ));
  }
}

class _ScratchDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: FxSpacing.x(52),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8))),
      child: FxCard(
        padding: FxSpacing.xy(40, 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            FxText.sh1(
              "Congratulations !",
              color: FxAppTheme.theme.colorScheme.primary,
              fontWeight: 700,
            ),
            FxSpacing.height(16),
            FxText.b2(
              "Here's the code for your \$50 Puma's Gift Card",
              fontWeight: 600,
              height: 1.2,
              letterSpacing: -0.2,
              textAlign: TextAlign.center,
            ),
            FxSpacing.height(32),
            FxText.h6(
              "SH10USE",
              fontWeight: 800,
              letterSpacing: 0.5,
              textAlign: TextAlign.center,
            ),
            FxSpacing.height(32),
            FxButton(
                backgroundColor: FxAppTheme.theme.colorScheme.primary,
                onPressed: () {
                  Navigator.pop(context);
                },
                child: FxText.button(
                  "Redeem it".toUpperCase(),
                  fontSize: 13,
                  letterSpacing: 0.5,
                  color: FxAppTheme.theme.colorScheme.onPrimary,
                  fontWeight: 600,
                ))
          ],
        ),
      ),
    );
  }
}
