import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutx/themes/app_theme.dart';
import 'package:flutx/utils/spacing.dart';
import 'package:flutx/widgets/container/container.dart';
import 'package:flutx/widgets/text/text.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nb_utils/src/extensions/widget_extensions.dart';

class ShoppingOrderScreen extends StatefulWidget {
  @override
  _ShoppingOrderScreenState createState() => _ShoppingOrderScreenState();
}

class _ShoppingOrderScreenState extends State<ShoppingOrderScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: FxAppTheme.theme.copyWith(
          colorScheme: FxAppTheme.theme.colorScheme.copyWith(
              secondary: FxAppTheme.theme.primaryColor.withAlpha(10))),
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: FxAppTheme.customTheme.border1,
            elevation: 0,
            leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                MdiIcons.chevronLeft,
                color: FxAppTheme.theme.colorScheme.onBackground,
              ),
            ),
            title: FxText.sh1("Orders", fontWeight: 600),
          ),
          body: ListView(
            padding: FxSpacing.x(24),
            children: [
              singleOrderItem(
                  price: 49.49,
                  time: "12 April 2020, 1:45",
                  listItem: [
                    "images/shopping/product/product-1.jpg",
                    "images/shopping/product/product-2.jpg",
                    "images/shopping/product/product-3.jpg",
                    "images/shopping/product/product-4.jpg"
                  ],
                  number: 4568,
                  status: "In Progress"),
              singleOrderItem(
                  price: 54.99,
                  time: "14 Feb 2020, 12:04",
                  listItem: [
                    "images/shopping/product/product-5.jpg",
                    "images/shopping/product/product-3.jpg"
                  ],
                  number: 1478,
                  status: "Delivered"),
              singleOrderItem(
                  price: 69.99,
                  time: "16 Dec 2019, 8:48",
                  listItem: [
                    "images/shopping/product/product-9.jpg",
                    "images/shopping/product/product-7.jpg",
                    "images/shopping/product/product-10.jpg",
                  ],
                  number: 1123,
                  status: "Delivered"),
            ],
          )),
    );
  }

  Widget singleOrderItem(
      {required List<String> listItem,
      int? number,
      String? time,
      String? status,
      double? price}) {
    //Logic for row items
    double space = 16;
    double width = (MediaQuery.of(context).size.width - 83 - (2 * space)) / 3;

    List<Widget> _itemWidget = [];
    for (int i = 0; i < listItem.length; i++) {
      if (i == 2 && listItem.length > 3) {
        _itemWidget.add(
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            child: Container(
              color: FxAppTheme.customTheme.border2,
              height: width,
              width: width,
              child: Center(
                  child: FxText.sh1("+" + (listItem.length - 2).toString(),
                      letterSpacing: 0.5, fontWeight: 600)),
            ),
          ),
        );
        break;
      } else {
        _itemWidget.add(
          Container(
            margin: (i == 2) ? EdgeInsets.zero : EdgeInsets.only(right: space),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              child: Image.asset(
                listItem[i],
                height: width,
                fit: BoxFit.fill,
              ),
            ),
          ),
        );
      }
    }

    return FxContainer.bordered(
      margin: FxSpacing.bottom(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
             Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FxText("Order $number",
                        fontWeight: 700, letterSpacing: -0.2),
                    FxSpacing.width(4),
                    FxText.b2("\$ $price", fontWeight: 600, letterSpacing: 0),
                  ],
                ).expand(),
              FxContainer(
                padding: FxSpacing.all(10),
                color: FxAppTheme.customTheme.bgLayer1,
                borderRadiusAll: 4,
                child: FxText.caption(status!.toUpperCase(),
                    fontWeight: 700, letterSpacing: 0.2),
              )
            ],
          ),
          FxSpacing.height(16),
          FxText.b2(
            time!,
            fontWeight: 600,
            letterSpacing: -0.2,
            xMuted: true,
          ),
          FxSpacing.height(16),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: _itemWidget,
          ),
        ],
      ),
    );
  }
}
