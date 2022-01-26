// import 'package:UIKit/customapps/shopping/shopping_address_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutx/styles/shadow.dart';
import 'package:flutx/themes/app_theme.dart';
import 'package:flutx/utils/spacing.dart';
import 'package:flutx/widgets/button/button.dart';
import 'package:flutx/widgets/card/card.dart';
import 'package:flutx/widgets/container/container.dart';
import 'package:flutx/widgets/text/text.dart';
import 'package:local_notifaiction/ui/widgets/custom_transitions.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nb_utils/src/extensions/widget_extensions.dart';

import 'shopping_coupon_screen.dart';
import 'shopping_order_place_screen.dart';

class ShoppingCheckoutScreen extends StatefulWidget {
  @override
  _ShoppingCheckoutScreenState createState() => _ShoppingCheckoutScreenState();
}

class _ShoppingCheckoutScreenState extends State<ShoppingCheckoutScreen> {
  int _selectedOption = 1;

  Widget build(BuildContext context) {
    return Theme(
      data: FxAppTheme.theme.copyWith(
          colorScheme: FxAppTheme.theme.colorScheme.copyWith(
              secondary: FxAppTheme.theme.primaryColor.withAlpha(10))),
      child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: FxAppTheme.customTheme.bgLayer1,
            leading: InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Icon(
                MdiIcons.chevronLeft,
                color: FxAppTheme.theme.colorScheme.onBackground,
              ),
            ),
            centerTitle: true,
            title: FxText.sh1("Checkout", fontWeight: 600),
          ),
          body: ListView(
            padding: FxSpacing.nTop(16),
            children: <Widget>[
              FxContainer(
                padding: FxSpacing.fromLTRB(16, 32, 16, 16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(
                            MdiIcons.clockOutline,
                            size: 22,
                            color: FxAppTheme.theme.colorScheme.primary,
                          ),
                          FxSpacing.width(8),
                          FxText.caption("2-3 Days",
                              fontWeight: 600, muted: true)
                        ],
                      ),
                    ),
                    FxSpacing.height(32),
                    FxText.sh1("Toffee Bakery",
                        fontWeight: 600, letterSpacing: 0.3),
                    FxSpacing.height(16),
                    FxCard(
                      onTap: () {
                        // Navigator.push(
                        // context, MaterialPageRoute(builder: (context) => ShoppingAddressScreen()));
                      },
                      paddingAll: 20,
                      shadow: FxShadow(darkShadow: true),
                      child: Row(
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                            child: Image.asset(
                              'images/other/map-snap.png',
                              height: 64,
                              width: 86,
                              fit: BoxFit.cover,
                            ),
                          ),
                          FxSpacing.width(16),
                          Container(
                              height: 64,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  FxText.sh1("West Drive", fontWeight: 600),
                                  FxText.caption(
                                    "14, 921 Section",
                                    xMuted: true,
                                  ),
                                  FxSpacing.height(4),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      Icon(
                                        MdiIcons.informationOutline,
                                        color: FxAppTheme
                                            .theme.colorScheme.onBackground
                                            .withAlpha(200),
                                        size: 10,
                                      ),
                                      FxSpacing.width(4),
                                      FxText.caption(
                                        "Tap to change",
                                        fontSize: 9,
                                        fontWeight: 400,
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ).expand()
                        ],
                      ),
                    )
                  ],
                ),
              ),
              FxSpacing.height(16),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  FxText.b1("Order", fontWeight: 600),
                  FxText.caption(
                    " - 2 Item",
                    xMuted: true,
                  ),
                ],
              ),
              FxSpacing.height(16),
              FxCard(
                paddingAll: 16,
                child: Column(
                  children: <Widget>[
                    FxContainer.bordered(
                      padding: EdgeInsets.all(16),
                      child: Row(
                        children: <Widget>[
                           FxText.b1("Yellow Cake",
                                letterSpacing: 0, fontWeight: 600).expand(),
                          FxText.sh2("\$12.99",
                              color: FxAppTheme.theme.colorScheme.primary,
                              fontWeight: 600)
                        ],
                      ),
                    ),
                    FxSpacing.height(8),
                    FxContainer.bordered(
                      child: Row(
                        children: <Widget>[
                          FxText.b1("Colorful Sandal",
                                letterSpacing: 0, fontWeight: 600).expand(),
                          FxText.sh2("\$29.99", fontWeight: 600)
                        ],
                      ),
                    ),
                    FxSpacing.height(16),
                    Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                FxText.b2(
                                  "FLAT40",
                                  color:
                                      FxAppTheme.theme.colorScheme.onBackground,
                                  fontWeight: 600,
                                ),
                                FxText.caption("- 40% at max 100\$",
                                    fontSize: 12,
                                    fontWeight: 400,
                                    letterSpacing: -0.2)
                              ],
                            ),
                            FxButton.text(
                              padding: FxSpacing.zero,
                              onPressed: () {
                                Navigator.push(context,
                                    CostumNvigator(ShoppingCouponScreen()));

                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) =>
                                //             ShoppingCouponScreen()));
                              },
                              child: FxText.b2(
                                "Change coupon",
                                letterSpacing: 0,
                                fontWeight: 600,
                                color: FxAppTheme.theme.colorScheme.primary,
                              ),
                            )
                          ],
                        ),
                        FxSpacing.height(8),
                        Container(
                          margin: FxSpacing.top(8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              FxText.b2("Charges",
                                  muted: true,
                                  letterSpacing: 0,
                                  fontWeight: 600),
                              FxText.sh2("\$ 4.00",
                                  letterSpacing: 0,
                                  muted: true,
                                  fontWeight: 600),
                            ],
                          ),
                        ),
                        FxSpacing.height(8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            FxText.b1("Total",
                                letterSpacing: 0, fontWeight: 700),
                            FxText.b1("\$ 43.99",
                                letterSpacing: 0, fontWeight: 700),
                          ],
                        ),
                        FxSpacing.height(16),
                        Row(
                          children: <Widget>[
                            FxCard(
                              paddingAll: 8,
                              borderRadiusAll: 4,
                              shadow: FxShadow(darkShadow: true),
                              child: FxText.b2("VISA",
                                  letterSpacing: 0.4, fontWeight: 900),
                            ),
                            FxSpacing.width(8),
                            FxText.caption(
                              "\u2022\u2022\u2022\u2022  7983",
                              muted: true,
                              letterSpacing: 0,
                              fontWeight: 600,
                            ),
                             Align(
                                alignment: Alignment.centerRight,
                                child: FxButton.text(
                                  padding: FxSpacing.zero,
                                  onPressed: () {
                                    paymentMethod(context);
                                  },
                                  child: FxText.b2("Change",
                                      letterSpacing: 0,
                                      color:
                                          FxAppTheme.theme.colorScheme.primary,
                                      fontWeight: 600),
                                ),
                              ).expand()
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
              FxSpacing.height(24),
              FxButton(
                elevation: 0,
                padding: FxSpacing.y(12),
                borderRadiusAll: 4,
                onPressed: () {
                  Navigator.push(
                      context, CostumNvigator(ShoppingOrderPlaceScreen()));
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => ShoppingOrderPlaceScreen()));
                },
                child: FxText.caption(
                  "Place Order".toUpperCase(),
                  letterSpacing: 0.6,
                  fontWeight: 600,
                  color: FxAppTheme.theme.colorScheme.onPrimary,
                ),
                backgroundColor: FxAppTheme.theme.colorScheme.primary,
              )
            ],
          )),
    );
  }

  void paymentMethod(context) {
    showModalBottomSheet(
        backgroundColor: FxAppTheme.customTheme.bgLayer1,
        context: context,
        builder: (BuildContext buildContext) {
          return StatefulBuilder(
            builder: (BuildContext context,
                void Function(void Function()) setState) {
              return Container(
                decoration: BoxDecoration(
                    color: FxAppTheme.customTheme.bgLayer1,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16))),
                padding: FxSpacing.xy(24, 24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FxText.caption(
                      "Select Option".toUpperCase(),
                      fontWeight: 600,
                      muted: true,
                    ),
                    FxSpacing.height(16),
                    Row(
                      children: <Widget>[
                       GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedOption = 0;
                              });
                            },
                            child: optionWidget(
                              iconData: MdiIcons.bankOutline,
                              text: "Bank",
                              isSelected: _selectedOption == 0,
                            ),
                          ).expand(),
                        FxSpacing.width(16),
                         GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedOption = 1;
                              });
                            },
                            child: optionWidget(
                              iconData: MdiIcons.creditCardOutline,
                              text: "Card",
                              isSelected: _selectedOption == 1,
                            ),
                          ).expand(),
                        FxSpacing.width(16),
                         GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedOption = 2;
                              });
                            },
                            child: optionWidget(
                              iconData: MdiIcons.qrcode,
                              text: "QR",
                              isSelected: _selectedOption == 2,
                            ),
                          ).expand(),
                        FxSpacing.width(16),
                       GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedOption = 3;
                              });
                            },
                            child: optionWidget(
                              iconData: MdiIcons.cashMarker,
                              text: "COD",
                              isSelected: _selectedOption == 3,
                            ),
                          ).expand(),
                      ],
                    )
                  ],
                ),
              );
            },
          );
        });
  }

  Widget optionWidget(
      {IconData? iconData, required String text, required bool isSelected}) {
    return FxCard(
      shadow: FxShadow(darkShadow: true),
      color: isSelected
          ? FxAppTheme.theme.colorScheme.primary
          : Colors.transparent,
      paddingAll: 8,
      child: Column(
        children: <Widget>[
          Icon(
            iconData,
            color: isSelected
                ? FxAppTheme.theme.colorScheme.onPrimary
                : FxAppTheme.theme.colorScheme.onBackground,
            size: 30,
          ),
          FxSpacing.height(8),
          FxText.caption(
            text,
            color: isSelected
                ? FxAppTheme.theme.colorScheme.onPrimary
                : FxAppTheme.theme.colorScheme.onBackground,
          )
        ],
      ),
    );
  }
}
