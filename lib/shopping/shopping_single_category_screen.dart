import 'package:flutter/material.dart';
import 'package:flutx/themes/app_theme.dart';
import 'package:flutx/utils/generators/star_rating.dart';
import 'package:flutx/utils/spacing.dart';
import 'package:flutx/widgets/card/card.dart';
import 'package:flutx/widgets/container/container.dart';
import 'package:flutx/widgets/text/text.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nb_utils/src/extensions/widget_extensions.dart';

class ShoppingSingleCategoryScreen extends StatefulWidget {
  @override
  _ShoppingSingleCategoryScreenState createState() =>
      _ShoppingSingleCategoryScreenState();
}

class _ShoppingSingleCategoryScreenState
    extends State<ShoppingSingleCategoryScreen> {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: FxAppTheme.customTheme.bgLayer1,
          elevation: 0,
          leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(MdiIcons.chevronLeft),
          ),
          title: FxText.sh1("Camera", fontWeight: 600),
        ),
        body: ListView(
          children: <Widget>[
            Container(
              margin: FxSpacing.left(24),
              child:
                  FxText.b1("Top category", fontWeight: 700, letterSpacing: 0),
            ),
            FxSpacing.height(16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  FxSpacing.width(24),
                  singleType(
                      title: 'Camera\nCompact',
                      image: 'images/shopping/camera/camera-1.jpg'),
                  FxSpacing.width(16),
                  singleType(
                      title: 'DSLR',
                      image: 'images/shopping/camera/camera-2.jpg'),
                  FxSpacing.width(16),
                  singleType(
                      title: 'Mirrorless',
                      image: 'images/shopping/camera/camera-3.jpg'),
                  FxSpacing.width(24),
                ],
              ),
            ),
            Container(
              margin: FxSpacing.fromLTRB(24, 16, 0, 0),
              child: FxText.b1(
                "Sub category",
                fontWeight: 700,
              ),
            ),
            FxSpacing.height(16),
            Container(
              margin: FxSpacing.x(24),
              child: Wrap(
                runSpacing: 12,
                spacing: 12,
                children: <Widget>[
                  singleSubCategory(subCategory: "Drone"),
                  singleSubCategory(subCategory: "Analog"),
                  singleSubCategory(subCategory: "Digital"),
                  singleSubCategory(subCategory: "Compact"),
                  singleSubCategory(subCategory: "Spy"),
                  singleSubCategory(subCategory: "CCTV"),
                  singleSubCategory(subCategory: "Accessories"),
                ],
              ),
            ),
            Container(
              margin: FxSpacing.fromLTRB(24, 16, 0, 0),
              child: FxText.b1("Related", fontWeight: 700, letterSpacing: 0),
            ),
            Container(
              margin: FxSpacing.xy(24, 16),
              child: Column(
                children: <Widget>[
                  singleProduct(
                      name: 'Film Camera',
                      image: 'images/shopping/camera/camera-3.jpg',
                      shopName: 'G Camera',
                      star: 4.5,
                      price: 299),
                  FxSpacing.height(16),
                  singleProduct(
                      name: 'Bridge Camera',
                      image: 'images/shopping/camera/camera-2.jpg',
                      shopName: 'Reliance',
                      star: 4.5,
                      price: 799),
                  FxSpacing.height(16),
                  singleProduct(
                      name: 'Instant Camera',
                      image: 'images/shopping/camera/camera-1.jpg',
                      shopName: 'Sony',
                      star: 4.5,
                      price: 999),
                ],
              ),
            )
          ],
        ));
  }

  Widget singleType({required String image, required String title}) {
    return Container(
      child: Stack(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            child: Image(
              image: AssetImage(image),
              width: MediaQuery.of(context).size.width * 0.4,
              height: MediaQuery.of(context).size.width * 0.4,
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            bottom: 16,
            left: 16,
            child: Center(
              child: FxText.b2(title, color: Colors.white, fontWeight: 700),
            ),
          )
        ],
      ),
    );
  }

  Widget singleSubCategory({required String subCategory}) {
    return FxCard(
      padding: FxSpacing.xy(12, 8),
      borderRadiusAll: 16,
      child: FxText.b2(subCategory, letterSpacing: 0.2),
    );
  }

  Widget singleProduct(
      {required String name,
      required String image,
      required String shopName,
      required double star,
      int? price}) {
    return FxContainer.bordered(
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            child: Image.asset(
              image,
              height: 90,
              fit: BoxFit.fill,
            ),
          ),
          FxSpacing.width(16),
           Container(
              height: 90,
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
                      FxSpacing.width(4),
                      FxText.b1(star.toString(), fontWeight: 600),
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
                          FxText.b2(
                            shopName,
                            muted: true,
                          )
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
