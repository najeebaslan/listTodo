// import 'package:UIKit/utils/Generator.dart';
// import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:flutx/themes/app_theme.dart';
import 'package:flutx/themes/text_style.dart';
import 'package:flutx/utils/spacing.dart';
import 'package:flutx/utils/generators/star_rating.dart';
import 'package:flutx/widgets/button/button.dart';
import 'package:flutx/widgets/card/card.dart';
import 'package:flutx/widgets/container/container.dart';
import 'package:flutx/widgets/text/text.dart';
import 'package:local_notifaiction/services/my_size.dart';
import 'package:local_notifaiction/ui/widgets/custom_transitions.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:local_notifaiction/services/apptheme.dart';
import 'package:nb_utils/src/extensions/widget_extensions.dart';
// import '../../AppTheme.dart';
import 'generator.dart';
import 'shopping_product_screen.dart';

class ShoppingHomeScreen extends StatefulWidget {
  @override
  _ShoppingHomeScreenState createState() => _ShoppingHomeScreenState();
}

class _ShoppingHomeScreenState extends State<ShoppingHomeScreen>
    with SingleTickerProviderStateMixin {
  Widget build(BuildContext context) {
    return Theme(
      data: FxAppTheme.theme.copyWith(
          colorScheme: FxAppTheme.theme.colorScheme.copyWith(
              secondary: FxAppTheme.theme.primaryColor.withAlpha(10))),
      child: SafeArea(
        child: Scaffold(
            body: ListView(
          padding: FxSpacing.zero,
          children: <Widget>[
            Container(
              padding: FxSpacing.nBottom(24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FxText.sh1("Welcome", letterSpacing: 0, fontWeight: 600),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(new MaterialPageRoute<Null>(
                          builder: (BuildContext context) {
                            return NotificationDialog();
                          },
                          fullscreenDialog: true));
                    },
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: <Widget>[
                        Icon(
                          MdiIcons.bellOutline,
                          color: FxAppTheme.theme.colorScheme.onBackground
                              .withAlpha(200),
                        ),
                        Positioned(
                          right: -2,
                          top: -2,
                          child: FxContainer.rounded(
                            padding: FxSpacing.zero,
                            height: 14,
                            width: 14,
                            color: FxAppTheme.theme.colorScheme.primary,
                            child: Center(
                              child: FxText.overline(
                                "2",
                                color: FxAppTheme.theme.colorScheme.onPrimary,
                                fontSize: 9,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            FxContainer.bordered(
              paddingAll: 16,
              margin: FxSpacing.nBottom(24),
              child: Row(
                children: <Widget>[
                  Container(
                      height: 120,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          FxContainer(
                            paddingAll: 8,
                            color: FxAppTheme.customTheme.bgLayer1,
                            borderRadiusAll: 4,
                            child: FxText.caption("Trending",
                                muted: true,
                                letterSpacing: 0.3,
                                fontWeight: 600),
                          ),
                          FxText.caption("Colorful Sandal",
                              fontWeight: 600, letterSpacing: 0),
                          FxText.caption("\$ 49.99",
                              fontWeight: 600, letterSpacing: 0)
                        ],
                      ),
                    ).expand(),
                  const FxContainer(
                    paddingAll: 0,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    borderRadiusAll: 4,
                    child: Image(
                      image:
                          AssetImage('images/shopping/product/product-8.jpg'),
                      width: 125,
                      height: 125,
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: FxSpacing.nBottom(24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FxText.b1("Popular Deals", fontWeight: 600, letterSpacing: 0),
                  FxText.caption("View all",
                      color: AppTheme.theme.colorScheme.primary,
                      letterSpacing: 0)
                ],
              ),
            ),
            FxSpacing.height(24),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  Container(
                    margin: FxSpacing.left(24),
                    child: singleItemWidget(
                        image: 'images/shopping/product/product-10.jpg',
                        name: "Pop corn",
                        rate: 45.99),
                  ),
                  Container(
                    margin: FxSpacing.left(24),
                    child: singleItemWidget(
                        image: 'images/shopping/product/product-7.jpg',
                        name: "Cosmic bang",
                        rate: 78.99),
                  ),
                  Container(
                    margin: FxSpacing.left(24),
                    child: singleItemWidget(
                        image: 'images/shopping/product/product-5.jpg',
                        name: "Sweet Gems",
                        rate: 35.99),
                  ),
                  Container(
                    margin: FxSpacing.left(24),
                    child: singleItemWidget(
                        image: 'images/shopping/product/product-2.jpg',
                        name: "Toffees",
                        rate: 28.49),
                  ),
                  Container(
                    margin: FxSpacing.x(24),
                    child: singleItemWidget(
                        image: 'images/shopping/product/product-3.jpg',
                        name: "Candies",
                        rate: 15.99),
                  ),
                ],
              ),
            ),
            Container(
              margin: FxSpacing.nBottom(24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FxText.b1("For you", fontWeight: 600, letterSpacing: 0),
                  FxText.caption(
                    "View all",
                    letterSpacing: 0,
                    color: FxAppTheme.theme.colorScheme.primary,
                  ),
                ],
              ),
            ),
            Container(
              margin: FxSpacing.nBottom(24),
              child: Column(
                children: <Widget>[
                  Container(
                    child: singleForYouWidget(
                      name: "Sweet Gems",
                      image: 'images/shopping/product/product-5.jpg',
                      shopName: 'El Primo',
                      star: 4.5,
                      price: 1470,
                    ),
                  ),
                  Container(
                    child: singleForYouWidget(
                      name: "Lipsticks",
                      image: 'images/shopping/product/product-4.jpg',
                      shopName: 'Bee Lipstore',
                      star: 3.8,
                      price: 1486,
                    ),
                  ),
                  Container(
                    child: singleForYouWidget(
                      name: "Candies",
                      image: 'images/shopping/product/product-3.jpg',
                      shopName: 'Bee Lipstore',
                      star: 4,
                      price: 1456,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: FxSpacing.nBottom(24),
              child:
                  FxText.sh1("Best sellers", fontWeight: 600, letterSpacing: 0),
            ),
            Container(
              margin: FxSpacing.all(24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  singleSellerWidget(
                      image: 'images/avatar-1.jpg', name: 'Liss\'s Shop'),
                  singleSellerWidget(
                      image: 'images/avatar-2.jpg', name: 'Ekk Shop'),
                  singleSellerWidget(
                      image: 'images/avatar-3.jpg', name: 'Shop Center'),
                  singleSellerWidget(
                      image: 'images/avatar-4.jpg', name: 'Sweety')
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }

  Widget singleItemWidget(
      {required String image, required String name, double? rate}) {
    String key = Generator.randomString(10);
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            CostumNvigator(ShoppingProductScreen(
              heroTag: key,
              image: image,
            )));
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //         builder: (context) => ShoppingProductScreen(
        //               heroTag: key,
        //               image: image,
        //             )));
      },
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              child: Image.asset(
                image,
                height: 120,
                fit: BoxFit.fill,
              ),
            ),
            Container(
              margin: FxSpacing.top(8),
              child: FxText.b2(name,
                  letterSpacing: 0, muted: true, fontWeight: 600),
            ),
            FxText.b2("\$ " + rate.toString()),
          ],
        ),
      ),
    );
  }

  Widget singleSellerWidget({required String image, required String name}) {
    return Container(
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            child: Image(
              image: AssetImage(image),
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
          ),
          FxSpacing.height(8),
          FxText.caption(name)
        ],
      ),
    );
  }

  Widget singleForYouWidget(
      {required String name,
      required String image,
      required String shopName,
      required double star,
      int? price}) {
    String key = Generator.randomString(10);
    return FxCard(
      margin: FxSpacing.bottom(16),
      onTap: () {
        Navigator.push(
            context,
            CostumNvigator(ShoppingProductScreen(
              heroTag: key,
              image: image,
            )));
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //         builder: (context) => ShoppingProductScreen(
        //               heroTag: key,
        //               image: image,
        //             )));
      },
      child: Row(
        children: <Widget>[
          Hero(
            tag: key,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              child: Image.asset(
                image,
                height: 90,
                fit: BoxFit.fill,
              ),
            ),
          ),
          FxContainer.none(
              height: 90,
              margin: FxSpacing.left(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      FxText.sh1(
                        name,
                        fontWeight: 600,
                      ),
                      Icon(
                        MdiIcons.heart,
                        color: FxAppTheme.theme.colorScheme.onBackground
                            .withAlpha(75),
                        size: 22,
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      FxStarRating.buildRatingStar(
                          rating: star,
                          size: 16,
                          inactiveColor:
                              FxAppTheme.theme.colorScheme.onBackground),
                      Container(
                        margin: FxSpacing.left(8),
                        child: FxText.b2(star.toString(), fontWeight: 600),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Icon(
                            MdiIcons.storeOutline,
                            color: FxAppTheme.theme.colorScheme.onBackground
                                .withAlpha(200),
                            size: 20,
                          ),
                          FxSpacing.width(4),
                          FxText.b2(shopName)
                        ],
                      ),
                      FxText.b2("\$ " + price.toString(), fontWeight: 700)
                    ],
                  )
                ],
              ),
            ).expand(),
        ],
      ),
    );
  }
}

class NotificationDialog extends StatefulWidget {
  @override
  _NotificationDialogState createState() => _NotificationDialogState();
}

class _NotificationDialogState extends State<NotificationDialog> {
  late ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Theme(
      data: FxAppTheme.theme.copyWith(
        colorScheme: FxAppTheme.theme.colorScheme.copyWith(
          secondary: FxAppTheme.theme.primaryColor.withAlpha(10),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: FxAppTheme.theme.scaffoldBackgroundColor,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: FxText.sh1("Notification", fontWeight: 600),
          actions: <Widget>[
            Container(
              margin: Spacing.right(16),
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  MdiIcons.notificationClearAll,
                  size: 24,
                  color: AppTheme.theme.colorScheme.onBackground,
                ),
              ),
            )
          ],
        ),
        body: ListView(
          padding: Spacing.all(16),
          children: <Widget>[
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  FxText.b1(
                    "Offers",
                    fontWeight: 600,
                  ),
                  FxContainer.rounded(
                    margin: Spacing.left(8),
                    width: 18,
                    paddingAll: 0,
                    height: 18,
                    color: FxAppTheme.theme.colorScheme.primary.withAlpha(40),
                    child: Center(
                        child: FxText.overline(
                      "2",
                      fontWeight: 600,
                      color: FxAppTheme.theme.colorScheme.primary,
                    )),
                  )
                ],
              ),
            ),
            Spacing.height(24),
            singleNotification(
                image: 'images/grocery/product-5.png',
                text: RichText(
                  text: TextSpan(children: <TextSpan>[
                    TextSpan(
                        text: "50% OFF ",
                        style: FxTextStyle.button(
                            color: FxAppTheme.theme.colorScheme.primary,
                            fontWeight: 600,
                            letterSpacing: 0.2)),
                    TextSpan(
                      text: "in ultraboost all puma ltd shoes",
                      style: FxTextStyle.button(
                          color: AppTheme.theme.colorScheme.onBackground,
                          fontWeight: 500,
                          letterSpacing: 0.2),
                    )
                  ]),
                ),
                time: "9:35 AM"),
            FxSpacing.height(24),
            singleNotification(
                image: 'images/grocery/product-2.png',
                text: RichText(
                  text: TextSpan(children: <TextSpan>[
                    TextSpan(
                        text: "30% OFF ",
                        style: FxTextStyle.button(
                            color: FxAppTheme.theme.colorScheme.primary,
                            fontWeight: 600,
                            letterSpacing: 0.2)),
                    TextSpan(
                        text: "in all cake till 31 july",
                        style: FxTextStyle.button(
                            color: AppTheme.theme.colorScheme.onBackground,
                            fontWeight: 500,
                            letterSpacing: 0.2))
                  ]),
                ),
                time: "9:35 AM"),
            FxSpacing.height(24),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                FxText.b1(
                  "Orders",
                  fontWeight: 600,
                ),
                FxContainer.rounded(
                  margin: Spacing.left(8),
                  width: 18,
                  paddingAll: 0,
                  height: 18,
                  color: FxAppTheme.theme.colorScheme.primary.withAlpha(40),
                  child: Center(
                      child: FxText.overline(
                    "8",
                    fontWeight: 600,
                    color: FxAppTheme.theme.colorScheme.primary,
                  )),
                )
              ],
            ),
            FxSpacing.height(24),
            singleNotification(
                image: 'images/grocery/product-3.png',
                text: FxText.button(
                    "Your cake order has been delivered at Himalaya",
                    color: AppTheme.theme.colorScheme.onBackground,
                    fontWeight: 500,
                    letterSpacing: 0),
                time: "Just Now"),
            FxSpacing.height(24),
            singleNotification(
                image: 'images/grocery/product-2.png',
                text: FxText.button("last order has been cancelled by seller",
                    color: AppTheme.theme.colorScheme.onBackground,
                    fontWeight: 500,
                    letterSpacing: 0),
                time: "14 July"),
            FxSpacing.height(24),
            Center(
              child: FxButton.text(
                splashColor: FxAppTheme.theme.colorScheme.primary.withAlpha(40),
                child: FxText.button("View all",
                    color: FxAppTheme.theme.colorScheme.primary,
                    fontWeight: 600,
                    letterSpacing: 0.2),
                onPressed: () {},
              ),
            ),
            FxSpacing.height(24),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                FxText.b1(
                  "Security",
                  fontWeight: 600,
                ),
                FxContainer.rounded(
                  margin: Spacing.left(8),
                  width: 18,
                  paddingAll: 0,
                  height: 18,
                  color: FxAppTheme.theme.colorScheme.primary.withAlpha(40),
                  child: Center(
                      child: FxText.overline(
                    "1",
                    fontWeight: 600,
                    color: FxAppTheme.theme.colorScheme.primary,
                  )),
                )
              ],
            ),
            FxSpacing.height(24),
            singleNotification(
                image: 'images/grocery/profile.png',
                text: FxText.button("Your account password has been changed",
                    color: AppTheme.theme.colorScheme.onBackground,
                    fontWeight: 500,
                    letterSpacing: 0),
                time: "2 days ago"),
          ],
        ),
      ),
    );
  }

  Widget singleNotification(
      {required String image, Widget? text, required String time}) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          FxContainer.rounded(
            width: 52,
            height: 52,
            padding: Spacing.all(10),
            color: FxAppTheme.theme.colorScheme.primary.withAlpha(40),
            child: Image.asset(image),
          ),
          Container(margin: Spacing.horizontal(16), child: text).expand(),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              FxText.caption(time,
                  muted: true, fontWeight: 500, letterSpacing: -0.2),
            ],
          )
        ],
      ),
    );
  }
}
