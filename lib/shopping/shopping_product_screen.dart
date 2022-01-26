// import 'package:UIKit/utils/Generator.dart';
// import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutx/themes/app_theme.dart';
import 'package:flutx/utils/generators/progress_bar.dart';
import 'package:flutx/utils/spacing.dart';
import 'package:flutx/widgets/button/button.dart';
import 'package:flutx/widgets/container/container.dart';
import 'package:flutx/widgets/text/text.dart';
import 'package:local_notifaiction/services/apptheme.dart';
import 'package:local_notifaiction/services/my_size.dart';
import 'package:local_notifaiction/ui/widgets/custom_transitions.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nb_utils/src/extensions/widget_extensions.dart';

// import '../../AppTheme.dart';
import 'generator.dart';
import 'shopping_checkout_screen.dart';
import 'shopping_product_review_screen.dart';

class ShoppingProductScreen extends StatefulWidget {
  final String heroTag, image;

  const ShoppingProductScreen(
      {Key? key,
      this.heroTag = "heroTag",
      this.image = 'images/product/product-5.jpg'})
      : super(key: key);

  @override
  _ShoppingProductScreenState createState() => _ShoppingProductScreenState();
}

class _ShoppingProductScreenState extends State<ShoppingProductScreen>
    with SingleTickerProviderStateMixin {
  String descText = Generator.getDummyText(6);

  int selectedSize = 7;

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: FxAppTheme.customTheme.bgLayer2,
          elevation: 0,
          leading: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(
              MdiIcons.chevronLeft,
              color: FxAppTheme.theme.colorScheme.onBackground,
            ),
          ),
          title: Text("Febreze AIR",
              style: AppTheme.getTextStyle(FxAppTheme.theme.textTheme.headline6,
                  fontWeight: 600)),
        ),
        backgroundColor: FxAppTheme.customTheme.bgLayer2,
        body: Column(
          children: <Widget>[
           Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        child: Image.asset(
                          widget.image,
                          width: 150,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    FxSpacing.height(16),
                    FxText.b1("Febreze AIR",
                        fontWeight: 600, letterSpacing: 0.2),
                    FxSpacing.height(8),
                    FxText.caption(descText, fontWeight: 400, letterSpacing: 0),
                    FxSpacing.height(16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                            child: FxProgressBar.buildProgress(
                                width: 100,
                                height: 5,
                                activeColor:
                                    FxAppTheme.theme.colorScheme.primary,
                                inactiveColor: FxAppTheme
                                    .theme.colorScheme.onBackground
                                    .withAlpha(100),
                                progress: 0.6)),
                        FxSpacing.width(16),
                        FxText.caption("123 Items", fontWeight: 500, height: 1),
                      ],
                    ),
                    Container(
                      margin: FxSpacing.top(32),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          FxContainer.bordered(
                            onTap: () {
                              _selectSizeSheet(context);
                            },
                            width: 150,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  MdiIcons.imageSizeSelectSmall,
                                  color:
                                      FxAppTheme.theme.colorScheme.onBackground,
                                  size: 24,
                                ),
                                FxSpacing.width(8),
                                FxText.b1(
                                  "Change",
                                  fontWeight: 600,
                                  letterSpacing: -0.2,
                                )
                              ],
                            ),
                          ),
                          FxSpacing.width(16),
                          FxContainer.bordered(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  CostumNvigator(
                                      ShoppingProductReviewScreen()));
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) =>
                              //             ShoppingProductReviewScreen()));
                            },
                            width: 150,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  MdiIcons.commentTextOutline,
                                  color:
                                      FxAppTheme.theme.colorScheme.onBackground,
                                  size: 24,
                                ),
                                FxSpacing.width(8),
                                FxText.sh2(
                                  "Review",
                                  fontWeight: 600,
                                  letterSpacing: -0.2,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ).expand(),
            FxContainer.bordered(
              paddingAll: 24,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                       Column(
                          children: <Widget>[
                            FxText.b2(
                              "Color".toUpperCase(),
                              fontWeight: 600,
                              xMuted: true,
                            ),
                            FxSpacing.height(8),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Container(
                                  width: 20,
                                  height: 20,
                                  decoration: const BoxDecoration(
                                      color: Colors.orange,
                                      shape: BoxShape.circle),
                                ),
                                FxSpacing.width(4),
                                Icon(
                                  MdiIcons.chevronDown,
                                  size: 20,
                                  color: FxAppTheme
                                      .theme.colorScheme.onBackground
                                      .withAlpha(200),
                                )
                              ],
                            )
                          ],
                        ).expand(),
                    Column(
                          children: <Widget>[
                            FxText.b2(
                              "QTY",
                              xMuted: true,
                              fontWeight: 600,
                            ),
                            FxSpacing.height(8),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                FxText.sh1("2", fontWeight: 600),
                                FxSpacing.width(4),
                                Icon(
                                  MdiIcons.chevronDown,
                                  size: 20,
                                  color: FxAppTheme
                                      .theme.colorScheme.onBackground
                                      .withAlpha(200),
                                )
                              ],
                            )
                          ],
                        ).expand(),
                    ],
                  ),
                  FxSpacing.height(24),
                  Row(
                    children: <Widget>[
                    FxButton(
                          backgroundColor: FxAppTheme.theme.colorScheme.primary,
                          padding: FxSpacing.y(12),
                          borderRadiusAll: 4,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                MdiIcons.cartPlus,
                                color: FxAppTheme.theme.colorScheme.onPrimary,
                                size: 16,
                              ),
                              FxSpacing.width(4),
                              FxText.b1(
                                "\$39.99",
                                letterSpacing: 0.4,
                                color: FxAppTheme.theme.colorScheme.onPrimary,
                                fontWeight: 600,
                              )
                            ],
                          ),
                          onPressed: () {
                            Navigator.push(context,
                                CostumNvigator(ShoppingCheckoutScreen()));
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) =>
                            //             ShoppingCheckoutScreen()));
                          },
                        ).expand(),
                      FxSpacing.width(16),
                      FxContainer(
                        padding: Spacing.xy(12, 12),
                        color:
                            FxAppTheme.theme.colorScheme.primary.withAlpha(40),
                        child: Icon(
                          MdiIcons.shoppingOutline,
                          size: 24,
                          color: FxAppTheme.theme.colorScheme.primary,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ));
  }

  void _selectSizeSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext buildContext) {
          return StatefulBuilder(
            builder: (BuildContext context,
                void Function(void Function()) setState) {
              return FxContainer(
                padding: FxSpacing.xy(32, 24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                         Center(
                                child: FxText.b1("Select a Sizes",
                                    fontWeight: 700)).expand(),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: FxContainer.rounded(
                              paddingAll: 8,
                              color: FxAppTheme.customTheme.bgLayer1,
                              child: Icon(
                                MdiIcons.close,
                                size: 16,
                                color:
                                    FxAppTheme.theme.colorScheme.onBackground,
                              )),
                        )
                      ],
                    ),
                    FxSpacing.height(32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedSize = 4;
                            });
                          },
                          child: SingleSizeWidget(
                            size: 4,
                            isSelected: selectedSize == 4,
                          ),
                        ),
                        SingleSizeWidget(
                          size: 5,
                          isAvailable: false,
                          isSelected: selectedSize == 5,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedSize = 6;
                            });
                          },
                          child: SingleSizeWidget(
                            size: 6,
                            isSelected: selectedSize == 6,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedSize = 7;
                            });
                          },
                          child: SingleSizeWidget(
                            size: 7,
                            isSelected: selectedSize == 7,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedSize = 8;
                            });
                          },
                          child: SingleSizeWidget(
                            size: 8,
                            isSelected: selectedSize == 8,
                          ),
                        ),
                      ],
                    ),
                    FxSpacing.height(16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        SingleSizeWidget(
                          size: 9,
                          isAvailable: false,
                          isSelected: selectedSize == 9,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedSize = 11;
                            });
                          },
                          child: SingleSizeWidget(
                            size: 11,
                            isSelected: selectedSize == 11,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedSize = 12;
                            });
                          },
                          child: SingleSizeWidget(
                            size: 12,
                            isSelected: selectedSize == 12,
                          ),
                        ),
                        SingleSizeWidget(
                          size: 13,
                          isAvailable: false,
                          isSelected: selectedSize == 13,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedSize = 14;
                            });
                          },
                          child: SingleSizeWidget(
                            size: 14,
                            isSelected: selectedSize == 14,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 64),
                      child: IntrinsicHeight(
                        child: Row(
                          children: <Widget>[
                            Container(
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      width: 52,
                                      height: 52,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: FxAppTheme
                                            .theme.colorScheme.primary,
                                      ),
                                      child: Center(
                                        child: Icon(
                                          MdiIcons.imageSizeSelectSmall,
                                          color: FxAppTheme
                                              .theme.colorScheme.onPrimary,
                                        ),
                                      ),
                                    ),
                                    FxSpacing.height(8),
                                    FxText.b2("Size Guide",
                                        fontWeight: 600, letterSpacing: 0)
                                  ],
                                ),
                              ).expand(),
                            const VerticalDivider(
                              thickness: 0.8,
                            ),
                           Container(
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      width: 52,
                                      height: 52,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: FxAppTheme
                                            .theme.colorScheme.primary,
                                      ),
                                      child: Center(
                                        child: Icon(
                                          MdiIcons.emoticonSadOutline,
                                          color: FxAppTheme
                                              .theme.colorScheme.onPrimary,
                                          size: 28,
                                        ),
                                      ),
                                    ),
                                    Container(
                                        margin: EdgeInsets.only(top: 8),
                                        child: FxText.b2("Can't Find?",
                                            fontWeight: 600, letterSpacing: 0))
                                  ],
                                ),
                              ).expand(  )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        });
  }
}

class SingleSizeWidget extends StatefulWidget {
  final int size;
  final bool isAvailable, isSelected;

  const SingleSizeWidget(
      {Key? key,
      required this.size,
      this.isAvailable = true,
      this.isSelected = false})
      : super(key: key);

  @override
  _SingleSizeWidgetState createState() => _SingleSizeWidgetState();
}

class _SingleSizeWidgetState extends State<SingleSizeWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 52,
      height: 52,
      decoration: BoxDecoration(
        border: Border.all(
            color: (widget.isAvailable && widget.isSelected)
                ? FxAppTheme.theme.colorScheme.primary
                : FxAppTheme.theme.colorScheme.background,
            width: 1.6),
        shape: BoxShape.circle,
        color: widget.isAvailable
            ? (widget.isSelected
                ? FxAppTheme.theme.colorScheme.primary
                : Colors.transparent)
            : FxAppTheme.customTheme.bgLayer1,
      ),
      child: Center(
        child: FxText.b1(widget.size.toString(),
            letterSpacing: -0.2,
            fontWeight: 600,
            color: (widget.isAvailable && widget.isSelected)
                ? FxAppTheme.theme.colorScheme.onPrimary
                : FxAppTheme.theme.colorScheme.onBackground),
      ),
    );
  }
}
