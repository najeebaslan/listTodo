// import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:flutx/themes/app_theme.dart';
import 'package:flutx/utils/spacing.dart';
import 'package:flutx/widgets/text/text.dart';
import 'package:local_notifaiction/services/my_size.dart';
import 'package:local_notifaiction/ui/widgets/custom_transitions.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nb_utils/src/extensions/widget_extensions.dart';

import 'shopping_single_category_screen.dart';

class ShoppingCategoryScreen extends StatefulWidget {
  @override
  _ShoppingCategoryScreenState createState() => _ShoppingCategoryScreenState();
}

class _ShoppingCategoryScreenState extends State<ShoppingCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: FxAppTheme.theme.copyWith(
          colorScheme: FxAppTheme.theme.colorScheme.copyWith(
              secondary: FxAppTheme.theme.primaryColor.withAlpha(10))),
      child: Scaffold(
          body: ListView(
        padding: FxSpacing.fromLTRB(24, 44, 24, 24),
        children: <Widget>[
          Row(
            children: [
              Container(
                margin: Spacing.left(16),
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    MdiIcons.chevronLeft,
                    color: FxAppTheme.theme.colorScheme.onBackground,
                  ),
                ),
              ),
               Container(
                  margin: Spacing.right(24),
                  child: Center(
                    child: FxText.h6(
                      "Category",
                      fontWeight: 700,
                      letterSpacing: 0,
                    ),
                  ),
                ).expand(),
              
            ],
          ),
          FxSpacing.height(16),
          singleCategory(
              image: 'images/shopping/technology.jpg',
              title: "Technology",
              description: '241 Item'),
          FxSpacing.height(16),
          singleCategory(
              image: 'images/shopping/lifestyle.jpg',
              title: "Life Style",
              description: '325 Item'),
          FxSpacing.height(16),
          singleCategory(
              image: 'images/shopping/fashion.jpg',
              title: "Fashion",
              description: '784 Item'),
          FxSpacing.height(16),
          singleCategory(
              image: 'images/shopping/art.jpg',
              title: "Art",
              description: '124 Item'),
        ],
      )),
    );
  }

  Widget singleCategory(
      {required String image, String? title, String? description}) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
              context, CostumNvigator(ShoppingSingleCategoryScreen()));
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //         builder: (context) => ShoppingSingleCategoryScreen()));
        },
        child: ClipRRect(
          clipBehavior: Clip.antiAlias,
          borderRadius: BorderRadius.all(Radius.circular(16)),
          child: Stack(
            children: <Widget>[
              Container(
                child: Image(
                  image: AssetImage(image),
                  height: 160,
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  color: Colors.black.withAlpha(150),
                  padding: FxSpacing.xy(16, 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      FxText.b1(description.toString(),
                          color: Colors.white,
                          fontWeight: 600,
                          letterSpacing: 0.2),
                      FxText.sh1(title.toString(),
                          color: Colors.white,
                          fontWeight: 600,
                          letterSpacing: 0.2)
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
