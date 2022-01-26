import 'dart:async';

// import 'package:UIKit/utils/Generator.dart';
import 'package:flutter/material.dart';
import 'package:flutx/themes/app_theme.dart';
import 'package:flutx/themes/text_style.dart';
import 'package:flutx/utils/generators/star_rating.dart';
import 'package:flutx/utils/spacing.dart';
import 'package:flutx/widgets/card/card.dart';
import 'package:flutx/widgets/container/container.dart';
import 'package:flutx/widgets/text/text.dart';
import 'package:flutx/widgets/text_field/text_field.dart';
import 'package:local_notifaiction/shopping/generator.dart';
import 'package:local_notifaiction/services/app_theme_notifier.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nb_utils/src/extensions/widget_extensions.dart';
import 'package:provider/provider.dart';

// import '../../AppThemeNotifier.dart';

class ProductsSearchScreen extends StatefulWidget {
  @override
  _ProductsSearchScreenState createState() => _ProductsSearchScreenState();
}

class _ProductsSearchScreenState extends State<ProductsSearchScreen> {
  bool _isInProgress = false;
  Timer? _timer;

  void _onSubmit(text) {
    startTimer();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) => startTimer());
  }

  void startTimer() {
    setState(() {
      _isInProgress = true;
    });
    const Duration oneSec = const Duration(milliseconds: 2500);
    _timer = Timer.periodic(
        oneSec,
        (Timer timer) => {
              _timer!.cancel(),
              setState(
                () {
                  _isInProgress = false;
                },
              )
            });
  }

  @override
  void dispose() {
    super.dispose();
    if (_timer != null) _timer!.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: FxAppTheme.theme.copyWith(
          colorScheme: FxAppTheme.theme.colorScheme.copyWith(
              secondary: FxAppTheme.theme.primaryColor.withAlpha(10))),
      child: Consumer<AppThemeNotifier>(
        builder: (BuildContext context, AppThemeNotifier value, Widget? child) {
          return Scaffold(
              body: Column(
            children: <Widget>[
              FxSpacing.height(48),
              FxCard(
                margin: FxSpacing.x(16),
                padding: FxSpacing.xy(12, 8),
                child: Row(
                  children: <Widget>[
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          MdiIcons.chevronLeft,
                          size: 24,
                          color: FxAppTheme.theme.colorScheme.onBackground,
                        )),
                    FxSpacing.width(16),
                    FxTextField(
                        hintText: "Try to Search",
                        hintStyle: FxTextStyle.b2(),
                        labelStyle: FxTextStyle.b2(),
                        style: FxTextStyle.b2(),
                        autoIcon: false,
                        autofocus: false,
                        maxLines: 1,
                        textInputAction: TextInputAction.search,
                        textCapitalization: TextCapitalization.sentences,
                        onSubmitted: _onSubmit,
                      ).expand(),
                    
                  ],
                ),
              ),
              FxSpacing.height(16),
              _isInProgress
                    ? Container(
                        child: Center(
                          child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                            FxAppTheme.theme.colorScheme.primary,
                          )),
                        ),
                      )
                    : ListView(
                        padding: FxSpacing.zero,
                        children: <Widget>[
                          Container(
                            padding: FxSpacing.x(16),
                            child: FxText.b2("Result", fontWeight: 600),
                          ),
                          Container(
                            padding: FxSpacing.nBottom(16),
                            child: Row(
                              children: <Widget>[
                                const _SimpleCard(
                                  image:
                                      'images/shopping/product/product-7.jpg',
                                  name: 'Product-1',
                                  description:
                                      'Lorem ipsum, or lipsum as it is sometimes',
                                  star: 4,
                                  countStar: 15,
                                ).expand(),
                                FxSpacing.width(16),
                                 const _SimpleCard(
                                  image:
                                      'images/shopping/product/product-8.jpg',
                                  name: 'Product-1',
                                  description:
                                      'Lorem ipsum, or lipsum as it is sometimes',
                                  star: 5,
                                  countStar: 2,
                                ).expand(),
                              ],
                            ),
                          ),
                          Container(
                            padding: FxSpacing.nBottom(16),
                            child: FxText.b2("Recommended", fontWeight: 600),
                          ),
                          FxSpacing.height(16),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: <Widget>[
                                FxSpacing.width(16),
                                _SimpleCard(
                                  image:
                                      'images/shopping/product/product-3.jpg',
                                  name: 'Product-1',
                                  description:
                                      'Lorem ipsum, or lipsum as it is sometimes',
                                  star: 4,
                                  countStar: 15,
                                  width: 160,
                                ),
                                FxSpacing.width(16),
                                _SimpleCard(
                                  image:
                                      'images/shopping/product/product-5.jpg',
                                  name: 'Product-1',
                                  description:
                                      'Lorem ipsum, or lipsum as it is sometimes',
                                  star: 5,
                                  countStar: 2,
                                  width: 160,
                                ),
                                FxSpacing.width(16),
                                _SimpleCard(
                                  image:
                                      'images/shopping/product/product-2.jpg',
                                  name: 'Product-1',
                                  description:
                                      'Lorem ipsum, or lipsum as it is sometimes',
                                  star: 5,
                                  countStar: 2,
                                  width: 160,
                                ),
                                FxSpacing.width(16),
                              ],
                            ),
                          ),
                        ],
                      ).expand(),
              
            ],
          ));
        },
      ),
    );
  }
}

class _SimpleCard extends StatefulWidget {
  final String? image, name, description;
  final int? star, countStar;
  final double? width;

  const _SimpleCard({
    Key? key,
    this.image,
    this.name,
    this.description,
    this.star,
    this.countStar,
    this.width,
  }) : super(key: key);

  @override
  _SimpleCardState createState() => _SimpleCardState();
}

class _SimpleCardState extends State<_SimpleCard> {
  @deprecated
  late ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return FxCard(
      paddingAll: 0,
      clipBehavior: Clip.hardEdge,
      width: widget.width == null
          ? MediaQuery.of(context).size.width
          : widget.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image(
            image: AssetImage(widget.image!),
            width: widget.width == null
                ? MediaQuery.of(context).size.width
                : widget.width,
            fit: BoxFit.fill,
          ),
          FxContainer(
            paddingAll: 8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                FxText.b2(widget.name!),
                FxSpacing.height(2),
                FxText.caption(
                  widget.description!,
                  letterSpacing: 0.15,
                  height: 1.2,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                FxSpacing.height(2),
                Row(
                  children: <Widget>[
                    FxStarRating.buildRatingStar(
                        rating: widget.star!.toDouble(),
                        inactiveColor: Generator.starColor),
                    FxSpacing.width(4),
                    FxText.b2("(" + widget.countStar.toString() + ")",
                        letterSpacing: 0.2)
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
