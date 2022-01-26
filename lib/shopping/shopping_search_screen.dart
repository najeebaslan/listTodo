// import 'package:UIKit/utils/Generator.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutx/themes/app_theme.dart';
import 'package:flutx/utils/spacing.dart';
import 'package:flutx/widgets/card/card.dart';
import 'package:flutx/widgets/container/container.dart';
import 'package:flutx/widgets/text/text.dart';
import 'package:local_notifaiction/ui/widgets/custom_transitions.dart';
import 'package:local_notifaiction/ui/widgets/style.dart';
import 'package:local_notifaiction/utils/error_response.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nb_utils/src/extensions/widget_extensions.dart';

import 'generator.dart';
import 'product_search_screen.dart';
import 'shopping_product_screen.dart';

class ShoppingSearchScreen extends StatefulWidget {
  const ShoppingSearchScreen({Key? key}) : super(key: key);

  @override
  _ShoppingSearchScreenState createState() => _ShoppingSearchScreenState();
}

class _ShoppingSearchScreenState extends State<ShoppingSearchScreen>
    with SingleTickerProviderStateMixin {
  double findAspectRatio(double width) {
    //Logic for aspect ratio of grid view
    return (width / 2 - 24) / ((width / 2 - 24) + 64);
  }

  Widget build(BuildContext context) {
    return Theme(
      data: FxAppTheme.theme.copyWith(
          colorScheme: FxAppTheme.theme.colorScheme.copyWith(
              secondary: FxAppTheme.theme.primaryColor.withAlpha(10))),
      child: SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: ListView(
              physics: const ClampingScrollPhysics(),
              padding: FxSpacing.zero,
              children: <Widget>[
                Container(
                  padding: FxSpacing.all(16),
                  child: Row(
                    children: <Widget>[
                      FxCard(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute<void>(
                              builder: (BuildContext context) {
                                return ProductsSearchScreen();
                              },
                              fullscreenDialog: true));
                        },
                        paddingAll: 12,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              MdiIcons.magnify,
                              color: FxAppTheme.theme.colorScheme.primary,
                              size: 20,
                            ),
                            Container(
                                margin: FxSpacing.left(8),
                                child: Text(
                                  "بحث",
                                  style: titleStyle,
                                )

                                //  FxText.sh2(
                                //     fontWeight: 600, letterSpacing: 0),
                                )
                          ],
                        ),
                      ).expand(),
                      FxSpacing.width(8),
                      FxCard(
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (BuildContext buildContext) {
                                return const SortBottomSheet();
                              });
                        },
                        margin: FxSpacing.x(4),
                        padding: FxSpacing.all(12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              MdiIcons.swapVertical,
                              color: FxAppTheme.theme.colorScheme.primary,
                              size: 20,
                            ),
                            FxSpacing.width(8),
                            Text(
                              "ترتيب",
                              style: titleStyle,
                            )
                            // FxText.sh2("ترتيب",
                            //     fontWeight: 600, letterSpacing: 0)
                          ],
                        ),
                      ).expand(),
                      FxSpacing.width(8),
                      FxCard(
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (BuildContext buildContext) {
                                return const FilterBottomSheet();
                              });
                        },
                        padding: FxSpacing.all(12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              MdiIcons.tune,
                              color: FxAppTheme.theme.colorScheme.primary,
                              size: 22,
                            ),
                            FxSpacing.width(8),
                            Text(
                              "فلتر",
                              style: titleStyle,
                            )
                            // FxText.sh2("فلتر",
                            //     fontWeight: 600, letterSpacing: 0)
                          ],
                        ),
                      ).expand(),
                    ],
                  ),
                ),
                Image.asset(
                  'images/number-removebg-preview.png',
                  height: 400,
                  width: 400,
                ),
                Center(
                  child: Text(
                    'التطبيق لا يزال قيد التطوير',
                    style: TextStyle(
                      fontFamily: StyleWidget.fontName,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: FxAppTheme.theme.colorScheme.primary,
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({Key? key}) : super(key: key);

  @override
  _FilterBottomSheetState createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  bool colorBlack = false,
      colorRed = true,
      colorOrange = false,
      colorTeal = true,
      colorPurple = false;

  bool sizeXS = false,
      sizeS = true,
      sizeM = false,
      sizeL = true,
      sizeXL = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: FxAppTheme.customTheme.bgLayer2,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16), topRight: Radius.circular(16))),
      padding: FxSpacing.all(24),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              children: <Widget>[
                Center(
                    child: Text(
                  "فلتر",
                  style: titleStyle,
                )
                    //          FxText.b1(
                    //   "فلتر",
                    //   fontWeight: 700,
                    // )
                    ).expand(),
                GestureDetector(
                  onTap: () {
                    ErrorResponse.awesomeDialog(
                      error: 'سيتم تفعيل الخدمة قربياً',
                      context: context,
                      dialogType: DialogType.QUESTION,
                    );

                    // Navigator.pop(context);
                  },
                  child: Container(
                      padding: FxSpacing.all(8),
                      decoration: BoxDecoration(
                          color: FxAppTheme.theme.colorScheme.primary,
                          borderRadius: BorderRadius.all(Radius.circular(22))),
                      child: Icon(
                        MdiIcons.check,
                        size: 20,
                        color: FxAppTheme.theme.colorScheme.onPrimary,
                      )),
                )
              ],
            ),
            FxSpacing.height(8),
            FxText.sh2("أوشك على الانتهاء لهذا",
                fontWeight: 600, letterSpacing: 0),
            _TypeChipWidget(),
            FxSpacing.height(8),
            FxText.sh2("الون", fontWeight: 600, letterSpacing: 0),
            FxSpacing.height(16),
            Row(
              children: <Widget>[
                InkWell(
                    onTap: () {
                      setState(() {
                        colorBlack = !colorBlack;
                      });
                    },
                    child:
                        colorWidget(color: Colors.black, checked: colorBlack)),
                FxSpacing.width(8),
                InkWell(
                  onTap: () {
                    setState(() {
                      colorRed = !colorRed;
                    });
                  },
                  child: colorWidget(color: Colors.red, checked: colorRed),
                ),
                FxSpacing.width(8),
                InkWell(
                  onTap: () {
                    setState(() {
                      colorOrange = !colorOrange;
                    });
                  },
                  child:
                      colorWidget(color: Colors.orange, checked: colorOrange),
                ),
                FxSpacing.width(8),
                InkWell(
                  onTap: () {
                    setState(() {
                      colorTeal = !colorTeal;
                    });
                  },
                  child: colorWidget(color: Colors.teal, checked: colorTeal),
                ),
                FxSpacing.width(8),
                InkWell(
                  onTap: () {
                    setState(() {
                      colorPurple = !colorPurple;
                    });
                  },
                  child:
                      colorWidget(color: Colors.purple, checked: colorPurple),
                ),
              ],
            ),
            FxSpacing.height(16),
            FxText.sh2("رقم القضية", fontWeight: 600, letterSpacing: 0),
            FxSpacing.height(16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    setState(() {
                      sizeXS = !sizeXS;
                    });
                  },
                  child: SingleSizeWidget(size: "12", isSelected: sizeXS),
                ),
                Container(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        sizeS = !sizeS;
                      });
                    },
                    child: SingleSizeWidget(size: "2", isSelected: sizeS),
                  ),
                ),
                Container(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        sizeM = !sizeM;
                      });
                    },
                    child: SingleSizeWidget(size: "16", isSelected: sizeM),
                  ),
                ),
                Container(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        sizeL = !sizeL;
                      });
                    },
                    child: SingleSizeWidget(size: "8", isSelected: sizeL),
                  ),
                ),
                Container(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        sizeXL = !sizeXL;
                      });
                    },
                    child: SingleSizeWidget(size: "22", isSelected: sizeXL),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget colorWidget({Color? color, bool checked = true}) {
    return FxContainer.none(
      width: 36,
      height: 36,
      color: color,
      borderRadiusAll: 18,
      child: checked
          ? const Center(
              child: Icon(
                MdiIcons.check,
                color: Colors.white,
                size: 20,
              ),
            )
          : Container(),
    );
  }
}

class SingleSizeWidget extends StatefulWidget {
  final String size;
  final bool isSelected;

  const SingleSizeWidget(
      {Key? key, required this.size, required this.isSelected})
      : super(key: key);

  @override
  _SingleSizeWidgetState createState() => _SingleSizeWidgetState();
}

class _SingleSizeWidgetState extends State<SingleSizeWidget> {
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return FxCard(
      width: 44,
      height: 44,
      paddingAll: 0,
      bordered: !widget.isSelected,
      border: Border.all(color: FxAppTheme.customTheme.border2, width: 1.6),
      color: widget.isSelected
          ? themeData.colorScheme.primary
          : Colors.transparent,
      child: Center(
        child: FxText(widget.size.toString(),
            letterSpacing: -0.2,
            fontWeight: 700,
            color: widget.isSelected
                ? themeData.colorScheme.onPrimary
                : themeData.colorScheme.onBackground),
      ),
    );
  }
}

class _TypeChipWidget extends StatefulWidget {
  final List<String> typeList = ["اليوم", "الاسبوع", "الشهر", "العام"];

  @override
  _TypeChipWidgetState createState() => _TypeChipWidgetState();
}

class _TypeChipWidgetState extends State<_TypeChipWidget> {
  List<String> selectedChoices = ["Man"];

  _buildChoiceList() {
    List<Widget> choices = [];
    widget.typeList.forEach((item) {
      choices.add(Container(
        padding: FxSpacing.all(8),
        child: ChoiceChip(
          backgroundColor: FxAppTheme.customTheme.bgLayer2,
          materialTapTargetSize: MaterialTapTargetSize.padded,
          selectedColor: FxAppTheme.theme.colorScheme.primary,
          label: FxText.b2(item,
              color: selectedChoices.contains(item)
                  ? FxAppTheme.theme.colorScheme.onSecondary
                  : FxAppTheme.theme.colorScheme.onBackground,
              fontWeight: selectedChoices.contains(item) ? 700 : 600),
          selected: selectedChoices.contains(item),
          onSelected: (selected) {
            setState(() {
              selectedChoices.contains(item)
                  ? selectedChoices.remove(item)
                  : selectedChoices.add(item);
            });
          },
        ),
      ));
    });
    return choices;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: _buildChoiceList(),
    );
  }
}

class SortBottomSheet extends StatefulWidget {
  const SortBottomSheet({Key? key}) : super(key: key);

  @override
  _SortBottomSheetState createState() => _SortBottomSheetState();
}

class _SortBottomSheetState extends State<SortBottomSheet> {
  int _radioValue = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Container(
        padding: FxSpacing.xy(24, 16),
        decoration: BoxDecoration(
            color: FxAppTheme.customTheme.bgLayer2,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16), topRight: Radius.circular(16))),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            FxSpacing.height(8),
            Column(
              children: <Widget>[
                InkWell(
                  onTap: () {
                    setState(() {
                      _radioValue = 0;
                    });
                  },
                  child: Row(
                    children: <Widget>[
                      Radio(
                        onChanged: (dynamic value) {
                          setState(() {
                            _radioValue = 0;
                          });
                        },
                        groupValue: _radioValue,
                        value: 0,
                        visualDensity: VisualDensity.compact,
                        activeColor: FxAppTheme.theme.colorScheme.primary,
                      ),
                      FxText.sh2("تصاعدي -", fontWeight: 60),
                      FxText.sh2("ترتيب"),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      _radioValue = 1;
                    });
                  },
                  child: Row(
                    children: <Widget>[
                      Radio(
                        onChanged: (dynamic value) {
                          setState(() {
                            _radioValue = 1;
                          });
                        },
                        groupValue: _radioValue,
                        value: 1,
                        visualDensity: VisualDensity.compact,
                        activeColor: FxAppTheme.theme.colorScheme.primary,
                      ),
                      FxText.sh2("تنازلي - ", fontWeight: 600),
                      FxText.sh2("ترتيب"),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      _radioValue = 2;
                    });
                  },
                  child: Row(
                    children: <Widget>[
                      Radio(
                        onChanged: (dynamic value) {
                          setState(() {
                            _radioValue = 2;
                          });
                        },
                        groupValue: _radioValue,
                        value: 2,
                        visualDensity: VisualDensity.compact,
                        activeColor: FxAppTheme.theme.colorScheme.primary,
                      ),
                      FxText.sh2("حسب التهمه -  ", fontWeight: 600),
                      FxText.sh2("ترتيب"),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      _radioValue = 3;
                    });
                  },
                  child: Row(
                    children: <Widget>[
                      Radio(
                        onChanged: (dynamic value) {
                          setState(() {
                            _radioValue = 3;
                          });
                        },
                        groupValue: _radioValue,
                        value: 3,
                        visualDensity: VisualDensity.compact,
                        activeColor: FxAppTheme.theme.colorScheme.primary,
                      ),
                      FxText.sh2("اخر متهمين تم اظافتهم - ", fontWeight: 600),
                      FxText.sh2("ترتيب حسب"),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _ProductListWidget extends StatefulWidget {
  final String name, image, shopName;
  final double star;
  final double price;
  final BuildContext rootContext;

  const _ProductListWidget(
      {Key? key,
      required this.name,
      required this.image,
      required this.shopName,
      required this.star,
      required this.price,
      required this.rootContext})
      : super(key: key);

  @override
  __ProductListWidgetState createState() => __ProductListWidgetState();
}

class __ProductListWidgetState extends State<_ProductListWidget> {
  @override
  Widget build(BuildContext context) {
    String key = Generator.randomString(10);
    return FxCard(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      padding: FxSpacing.bottom(4),
      onTap: () {
        Navigator.push(
            context,
            CostumNvigator(ShoppingProductScreen(
              heroTag: key,
              image: widget.image,
            )));
        // Navigator.push(
        //     widget.rootContext,
        //     MaterialPageRoute(
        //         builder: (context) => ShoppingProductScreen(
        //               heroTag: key,
        //               image: widget.image,
        //             )));
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Hero(
                tag: key,
                child: Image.asset(
                  widget.image,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                  right: 8,
                  top: 8,
                  child: Icon(
                    MdiIcons.heartOutline,
                    color: FxAppTheme.theme.colorScheme.primary,
                    size: 20,
                  ))
            ],
          ),
          Container(
            padding: FxSpacing.nBottom(8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                FxText.sh2(widget.name, fontWeight: 500),
                FxSpacing.height(4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    FxText("\$ " + widget.price.toString(), fontWeight: 700),
                    FxContainer(
                      color: FxAppTheme.theme.colorScheme.primary,
                      paddingAll: 6,
                      child: Row(
                        children: <Widget>[
                          Icon(
                            MdiIcons.star,
                            color: FxAppTheme.theme.colorScheme.onPrimary,
                            size: 12,
                          ),
                          FxSpacing.width(4),
                          FxText.overline(widget.star.toString(),
                              color: FxAppTheme.theme.colorScheme.onPrimary,
                              fontWeight: 600),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
