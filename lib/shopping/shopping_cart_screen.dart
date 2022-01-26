import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutx/themes/app_theme.dart';
import 'package:flutx/utils/spacing.dart';
import 'package:flutx/widgets/button/button.dart';
import 'package:flutx/widgets/card/card.dart';
import 'package:flutx/widgets/container/container.dart';
import 'package:flutx/widgets/text/text.dart';
import 'package:local_notifaiction/ui/widgets/custom_transitions.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nb_utils/src/extensions/widget_extensions.dart';

import 'shopping_checkout_screen.dart';

class ShoppingCartScreen extends StatefulWidget {
  @override
  _ShoppingCartScreenState createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: FxAppTheme.theme.copyWith(
          colorScheme: FxAppTheme.theme.colorScheme.copyWith(
              secondary: FxAppTheme.theme.primaryColor.withAlpha(10))),
      child: SafeArea(
        child: Scaffold(
            key: _scaffoldKey,
            body: ListView(
              padding: FxSpacing.top(24),
              children: <Widget>[
                SingleCartItem(
                  image: 'images/shopping/product/product-1.jpg',
                  price: 19.99,
                  name: "Pumpkin\nCream",
                  initialAmount: 2,
                ),
                FxSpacing.height(24),
                SingleCartItem(
                  image: 'images/shopping/product/product-2.jpg',
                  price: 27.89,
                  name: "Carrom\nRoll",
                  initialAmount: 1,
                ),
                FxSpacing.height(24),
                SingleCartItem(
                  image: 'images/shopping/product/product-5.jpg',
                  price: 39.79,
                  name: "Other\nSeed",
                  initialAmount: 3,
                ),
                Container(
                  padding: FxSpacing.nBottom(24),
                  child: Divider(),
                ),
                Container(
                  padding: FxSpacing.fromLTRB(24, 16, 24, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      FxText.b1("Discount", fontWeight: 600, muted: true),
                      FxText.b1("-\$9.99",
                          fontWeight: 600, letterSpacing: 0, muted: true)
                    ],
                  ),
                ),
                Container(
                  padding: FxSpacing.fromLTRB(24, 16, 24, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      FxText.sh1(
                        "Total",
                        fontWeight: 700,
                      ),
                      FxText.sh1(
                        "\$79.99",
                        fontWeight: 700,
                        letterSpacing: 0,
                      )
                    ],
                  ),
                ),
                Container(
                  margin: FxSpacing.all(24),
                  child: FxButton.block(
                    backgroundColor: FxAppTheme.theme.colorScheme.primary,
                    borderRadiusAll: 4,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          MdiIcons.cartArrowRight,
                          color: FxAppTheme.theme.colorScheme.onPrimary,
                          size: 18,
                        ),
                        FxSpacing.width(16),
                        FxText.caption("Checkout".toUpperCase(),
                            letterSpacing: 0.5,
                            fontWeight: 600,
                            color: FxAppTheme.theme.colorScheme.onPrimary)
                      ],
                    ),
                    onPressed: () {
                      Navigator.push(
                          context, CostumNvigator(ShoppingCheckoutScreen()));

                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => ShoppingCheckoutScreen()));
                    },
                  ),
                )
              ],
            )),
      ),
    );
  }
}

class SingleCartItem extends StatefulWidget {
  final String? image, name;
  final double? price;
  final int initialAmount;

  const SingleCartItem(
      {Key? key, this.image, this.name, this.price, this.initialAmount = 1})
      : super(key: key);

  @override
  _SingleCartItemState createState() => _SingleCartItemState();
}

class _SingleCartItemState extends State<SingleCartItem> {
  bool visible = true;

  late int amount;

  @override
  void initState() {
    super.initState();
    amount = widget.initialAmount;
  }

  @override
  Widget build(BuildContext context) {
    return visible
        ? FxCard(
            paddingAll: 0,
            margin: FxSpacing.x(24),
            child: Dismissible(
              direction: DismissDirection.endToStart,
              background: Container(
                color: FxAppTheme.customTheme.bgLayer2,
              ),
              secondaryBackground: Container(
                color: FxAppTheme.customTheme.bgLayer2,
                alignment: AlignmentDirectional.centerEnd,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      margin: FxSpacing.right(16),
                      padding: FxSpacing.all(10),
                      decoration: BoxDecoration(
                          color:
                              FxAppTheme.customTheme.colorError.withAlpha(36),
                          shape: BoxShape.circle),
                      child: Icon(
                        MdiIcons.deleteOutline,
                        size: 26,
                        color: FxAppTheme.customTheme.colorError,
                      ),
                    ),
                  ],
                ),
              ),
              onDismissed: (direction) {
                if (direction == DismissDirection.endToStart) {
                  setState(() {
                    //perform delete operation
                    setState(() {
                      visible = false;
                    });
                  });
                }
              },
              key: UniqueKey(),
              child: FxCard(
                clipBehavior: Clip.antiAlias,
                padding: FxSpacing.right(16),
                marginAll: 0,
                child: Row(
                  children: <Widget>[
                    ClipRRect(
                      child: Image.asset(
                        widget.image!,
                        height: 120,
                        fit: BoxFit.fill,
                      ),
                    ),
                  Container(
                        height: 120,
                        margin: FxSpacing.left(24),
                        child: Row(
                          children: <Widget>[
                             Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                FxText.b1(widget.name!, fontWeight: 600),
                                FxText.b1("\$" + "${widget.price}",
                                    fontWeight: 600,
                                    letterSpacing: -0.2,
                                    muted: true),
                              ],
                            ).expand(),
                            FxText.sh1("$amount", fontWeight: 600),
                            Container(
                              margin: FxSpacing.left(24),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  FxContainer.rounded(
                                    onTap: () {
                                      setState(() {
                                        amount++;
                                      });
                                    },
                                    color: FxAppTheme.customTheme.border1,
                                    paddingAll: 8,
                                    child: Icon(
                                      MdiIcons.plus,
                                      size: 20,
                                      color: FxAppTheme
                                          .theme.colorScheme.onBackground,
                                    ),
                                  ),
                                  InkWell(
                                    child: FxContainer.rounded(
                                      onTap: () {
                                        setState(() {
                                          if (amount > 1) amount--;
                                        });
                                      },
                                      paddingAll: 8,
                                      color: FxAppTheme.customTheme.border1,
                                      child: Icon(
                                        MdiIcons.minus,
                                        size: 20,
                                        color: FxAppTheme
                                            .theme.colorScheme.onBackground,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ).expand(),
                    
                  ],
                ),
              ),
            ),
          )
        : Container();
  }
}
