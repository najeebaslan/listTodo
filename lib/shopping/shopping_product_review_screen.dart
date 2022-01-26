import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutx/themes/app_theme.dart';
import 'package:flutx/utils/generators/progress_bar.dart';
import 'package:flutx/utils/generators/star_rating.dart';
import 'package:flutx/utils/spacing.dart';
import 'package:flutx/utils/text_utils.dart';
import 'package:flutx/widgets/button/button.dart';
import 'package:flutx/widgets/container/container.dart';
import 'package:flutx/widgets/text/text.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nb_utils/src/extensions/widget_extensions.dart';

class ShoppingProductReviewScreen extends StatefulWidget {
  @override
  _ShoppingProductReviewScreenState createState() =>
      _ShoppingProductReviewScreenState();
}

class _ShoppingProductReviewScreenState
    extends State<ShoppingProductReviewScreen> {
  Widget build(BuildContext context) {
    return Theme(
      data: FxAppTheme.theme.copyWith(
          colorScheme: FxAppTheme.theme.colorScheme.copyWith(
              secondary: FxAppTheme.theme.primaryColor.withAlpha(10))),
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: FxAppTheme.customTheme.bgLayer1,
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
            title: FxText.sh1("Reviews", fontWeight: 600),
          ),
          body: Container(
            child: ListView(
              children: <Widget>[
                Container(
                  child: Column(
                    children: <Widget>[
                      FxText.h4("4.0", letterSpacing: 0.5, fontWeight: 700),
                      FxSpacing.height(8),
                      FxStarRating.buildRatingStar(
                          rating: 4.0,
                          activeColor: FxStarRating.starColor,
                          inactiveColor: FxAppTheme.customTheme.border2,
                          size: 24,
                          spacing: 1,
                          inactiveStarFilled: true),
                      FxSpacing.height(4),
                      FxText.caption(
                        "Based on 23 reviews",
                        letterSpacing: 0,
                        muted: true,
                      )
                    ],
                  ),
                ),
                Container(
                  margin: FxSpacing.fromLTRB(24, 16, 24, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          FxText.caption(
                            "Excellent",
                            muted: true,
                          ),
                          FxProgressBar.buildProgress(
                              progress: 85,
                              activeColor: Colors.green,
                              inactiveColor: FxAppTheme.customTheme.border2,
                              width: MediaQuery.of(context).size.width - 150,
                              height: 4),
                        ],
                      ),
                      FxSpacing.height(4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          FxText.caption(
                            "Good",
                            muted: true,
                          ),
                          FxProgressBar.buildProgress(
                              progress: 65,
                              activeColor: Colors.green,
                              inactiveColor: FxAppTheme.customTheme.border2,
                              width: MediaQuery.of(context).size.width - 150,
                              height: 4),
                        ],
                      ),
                      FxSpacing.height(4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          FxText.caption(
                            "Average",
                            muted: true,
                          ),
                          FxProgressBar.buildProgress(
                              progress: 45,
                              activeColor: Colors.yellow,
                              inactiveColor: FxAppTheme.customTheme.border2,
                              width: MediaQuery.of(context).size.width - 150,
                              height: 4),
                        ],
                      ),
                      FxSpacing.height(4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          FxText.caption(
                            "Below Average",
                            muted: true,
                          ),
                          FxProgressBar.buildProgress(
                              progress: 12,
                              activeColor: Colors.orange,
                              inactiveColor: FxAppTheme.customTheme.border2,
                              width: MediaQuery.of(context).size.width - 150,
                              height: 4),
                        ],
                      ),
                      FxSpacing.height(4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          FxText.caption(
                            "Poor",
                            muted: true,
                          ),
                          FxProgressBar.buildProgress(
                              progress: 25,
                              activeColor: Colors.red,
                              inactiveColor: FxAppTheme.customTheme.border2,
                              width: MediaQuery.of(context).size.width - 150,
                              height: 4),
                        ],
                      ),
                    ],
                  ),
                ),
                FxSpacing.height(32),
                Container(
                  margin: FxSpacing.x(24),
                  child: Column(
                    children: <Widget>[
                      _singleReview(
                          image: "images/avatar-4.jpg",
                          name: "Tegan Payne",
                          rating: 5,
                          review: FxTextUtils.getDummyText(32),
                          time: "1 day ago"),
                      FxSpacing.height(24),
                      _singleReview(
                          image: "images/avatar-3.jpg",
                          name: "Jamal Rossi",
                          rating: 4,
                          review: FxTextUtils.getDummyText(25),
                          time: "7 days ago"),
                      FxSpacing.height(24),
                      _singleReview(
                          image: "images/avatar-2.jpg",
                          name: "Harvie Duncan",
                          rating: 4,
                          review: FxTextUtils.getDummyText(30),
                          time: "1 month ago"),
                    ],
                  ),
                ),
                FxSpacing.height(24),
                Center(
                  child: FxButton.text(
                    onPressed: () {},
                    splashColor:
                        FxAppTheme.theme.colorScheme.primary.withAlpha(40),
                    child: FxText.b2(
                      "Write a Review",
                      color: FxAppTheme.theme.colorScheme.primary,
                      fontWeight: 600,
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }

  Widget _singleReview(
      {required String image,
      required String name,
      required double rating,
      required String time,
      required String review}) {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              FxContainer.rounded(
                  width: 36,
                  paddingAll: 0,
                  height: 36,
                  child: Image(image: AssetImage(image), fit: BoxFit.fill)),
              FxSpacing.width(8),
             Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FxText.b2(name, fontWeight: 600),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        FxStarRating.buildRatingStar(
                            rating: rating,
                            activeColor: FxStarRating.starColor,
                            showInactive: false,
                            spacing: 0),
                        FxSpacing.width(4),
                        FxText.b2(rating.toString(), fontWeight: 600)
                      ],
                    )
                  ],
                ).expand(),
              FxText.caption(
                time,
                muted: true,
                fontWeight: 600,
              )
            ],
          ),
          FxSpacing.height(12),
          FxText.caption("- " + review),
        ],
      ),
    );
  }
}
