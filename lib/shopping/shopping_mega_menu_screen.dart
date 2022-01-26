// import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:flutx/themes/app_theme.dart';
import 'package:flutx/utils/spacing.dart';
import 'package:flutx/widgets/container/container.dart';
import 'package:flutx/widgets/text/text.dart';
import 'package:local_notifaiction/services/my_size.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ShoppingMegaMenuScreen extends StatefulWidget {
  @override
  _ShoppingMegaMenuScreenState createState() => _ShoppingMegaMenuScreenState();
}

class _ShoppingMegaMenuScreenState extends State<ShoppingMegaMenuScreen> {
  double findAspectRatio(double width) {
    //Logic for aspect ratio of grid view
    return (width / 2 - 24) / ((width / 2 - 24) - 20);
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: FxAppTheme.theme.scaffoldBackgroundColor,
          elevation: 0,
          leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(MdiIcons.chevronLeft),
          ),
          title: FxText.sh1("Mega menu", fontWeight: 600),
        ),
        body: Container(
          child: GridView.count(
            padding: FxSpacing.nTop(16),
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            crossAxisCount: 2,
            childAspectRatio:
                findAspectRatio(MediaQuery.of(context).size.width),
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            children: <Widget>[
              singleItem(
                  image: 'images/shopping/vector/tshirt.png',
                  title: "Top wear",
                  listItem: [
                    "Formal shirts",
                    "Casual t-shirts",
                    "Suits \& Blazers"
                  ]),
              singleItem(
                  image: 'images/shopping/vector/dress.png',
                  title: "Dress",
                  listItem: ["Balloon Dress", "Cocktail Dress", "Denim Dress"]),
              singleItem(
                  image: 'images/shopping/vector/shoes.png',
                  title: "Shoes",
                  listItem: ["Sports Shoes", "Casual Shoes", "Formal Shoes"]),
              singleItem(
                  image: 'images/shopping/vector/laptop.png',
                  title: "Laptop",
                  listItem: ["Ultrabook", "Chromebook", "Macbook"]),
              singleItem(
                  image: 'images/shopping/vector/headphone.png',
                  title: "Headphone",
                  listItem: ["On Ear", "Over Ear", "Earbuds"]),
              singleItem(
                  image: 'images/shopping/vector/mobile.png',
                  title: "Mobile",
                  listItem: [
                    "Xiaomi",
                    "Samsung",
                    "Apple",
                  ]),
              singleItem(
                  image: 'images/shopping/vector/watch.png',
                  title: "Watches",
                  listItem: ["Titan", "Fast Track", "Fossil"]),
            ],
          ),
        ));
  }

  Widget buildListItem(List<String> listItem) {
    List<Widget> list = [];

    for (int i = 0; i < listItem.length; i++) {
      list.add(Container(
        margin: EdgeInsets.only(bottom: 2),
        child: FxText.caption(listItem[i], fontWeight: 500, letterSpacing: 0.2),
      ));
    }

    list.add(FxText.caption("More ...", fontWeight: 500, letterSpacing: 0.2));

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: list,
    );
  }

  Widget singleItem(
      {required String image,
      required String title,
      required List<String> listItem}) {
    return FxContainer.bordered(
      paddingAll: 16,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Image(
                image: AssetImage(image),
                height: 24,
                width: 24,
                color: FxAppTheme.theme.colorScheme.primary,
              ),
              FxSpacing.width(8),
              FxText.b1(
                title,
                fontWeight: 600,
                letterSpacing: 0.2,
                color: FxAppTheme.theme.colorScheme.primary,
              )
            ],
          ),
          Container(
              margin: Spacing.fromLTRB(32, 8, 0, 0),
              child: buildListItem(listItem))
        ],
      ),
    );
  }
}
