// import 'dart:collection';

// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:flutx/styles/shadow.dart';
// import 'package:flutx/themes/app_theme.dart';
// import 'package:flutx/themes/text_style.dart';
// import 'package:flutx/utils/spacing.dart';
// import 'package:flutx/widgets/button/button.dart';
// import 'package:flutx/widgets/card/card.dart';
// import 'package:flutx/widgets/container/container.dart';
// import 'package:flutx/widgets/text/text.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

// // import '../../AppTheme.dart';

// class ShoppingAddressScreen extends StatefulWidget {
//   @override
//   _ShoppingAddressScreenState createState() => _ShoppingAddressScreenState();
// }

// class _ShoppingAddressScreenState extends State<ShoppingAddressScreen> {
//   late GoogleMapController mapController;


//   BitmapDescriptor? pinLocationIcon;
//   int? _radioValue = 1;

//   bool loaded = false;

//   final Set<Marker> _markers = HashSet();
//   final LatLng _center = const LatLng(45.521563, -122.677433);

//   @override
//   void initState() {
//     super.initState();

//     WidgetsBinding.instance!.addPostFrameCallback((_) => {changeLoaded()});
//   }

//   changeLoaded() {
//     setState(() {
//       loaded = true;
//     });
//   }

//   Marker marker = Marker(
//     markerId: MarkerId('1'),
//     position: LatLng(45.521563, -122.677433),
//   );

//   void _onMapCreated(GoogleMapController controller) {
//     mapController = controller;
//     setState(() {
//       _markers.add(marker);
//     });
//   }

//   void changeLocation(double zoom, LatLng latLng) {
//     double newZoom = zoom > 15 ? zoom : 15;
//     setState(() {
//       mapController.animateCamera(CameraUpdate.newCameraPosition(
//           CameraPosition(target: latLng, zoom: newZoom)));
//       _markers.clear();
//       _markers.add(Marker(
//         markerId: MarkerId('1'),
//         position: latLng,
//       ));
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Theme(
//       data: FxAppTheme.theme.copyWith(
//           colorScheme: FxAppTheme.theme.colorScheme
//               .copyWith(secondary: FxAppTheme.theme.primaryColor.withAlpha(10))),
//       child: Scaffold(
//           body: Container(
//             child: Column(
//               children: <Widget>[
//                 Expanded(
//                   child: loaded
//                       ? GoogleMap(
//                     onMapCreated: _onMapCreated,
//                     markers: _markers,
//                     onTap: (latLong) {
//                       mapController.getZoomLevel().then(
//                               (value) => {changeLocation(value, latLong)});
//                     },
//                     initialCameraPosition: CameraPosition(
//                       target: _center,
//                       zoom: 11.0,
//                     ),
//                   )
//                       : Container(),
//                 ),
//                 FxContainer(
//                     paddingAll: 16,
//                     child: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       children: <Widget>[
//                         Container(
//                           child: Row(
//                             children: <Widget>[
//                               GestureDetector(
//                                 onTap: () {
//                                   setState(() {
//                                     _radioValue = 1;
//                                   });
//                                 },
//                                 child: Row(
//                                   mainAxisSize: MainAxisSize.min,
//                                   children: <Widget>[
//                                     Radio(
//                                       value: 1,
//                                       visualDensity: VisualDensity.compact,
//                                       activeColor: FxAppTheme
//                                           .theme.colorScheme.primary,
//                                       groupValue: _radioValue,
//                                       onChanged: (int? value) {
//                                         setState(() {
//                                           _radioValue = value;
//                                         });
//                                       },
//                                     ),
//                                     Text("Office",
//                                         style: AppTheme.getTextStyle(
//                                             FxAppTheme
//                                                 .theme.textTheme.subtitle2,
//                                             fontWeight: 600)),
//                                   ],
//                                 ),
//                               ),
//                               FxSpacing.width(8),
//                               GestureDetector(
//                                 onTap: () {
//                                   setState(() {
//                                     _radioValue = 2;
//                                   });
//                                 },
//                                 child: Row(
//                                   children: <Widget>[
//                                     Radio(
//                                       value: 2,
//                                       visualDensity: VisualDensity.compact,
//                                       activeColor: FxAppTheme
//                                           .theme.colorScheme.primary,
//                                       groupValue: _radioValue,
//                                       onChanged: (int? value) {
//                                         setState(() {
//                                           _radioValue = value;
//                                         });
//                                       },
//                                     ),
//                                     FxText.sh2("Home", fontWeight: 600),
//                                   ],
//                                 ),
//                               ),
//                               FxSpacing.width(8),
//                               GestureDetector(
//                                 onTap: () {
//                                   setState(() {
//                                     _radioValue = 3;
//                                   });
//                                 },
//                                 child: Row(
//                                   children: <Widget>[
//                                     Radio(
//                                       value: 3,
//                                       visualDensity: VisualDensity.compact,
//                                       activeColor: FxAppTheme
//                                           .theme.colorScheme.primary,
//                                       groupValue: _radioValue,
//                                       onChanged: (int? value) {
//                                         setState(() {
//                                           _radioValue = value;
//                                         });
//                                       },
//                                     ),
//                                     FxText.sh2("Other", fontWeight: 600),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         FxCard(
//                           marginAll: 8,
//                           paddingAll: 0,
//                           shadow: FxShadow(darkShadow: true, elevation: 16),
//                           borderRadiusAll: 8,
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: <Widget>[
//                               TextFormField(
//                                 style: FxTextStyle.b2(),
//                                 decoration: InputDecoration(
//                                   hintStyle: FxTextStyle.b2(),
//                                   hintText: "Address 1",
//                                   border: OutlineInputBorder(
//                                       borderRadius: BorderRadius.all(
//                                         Radius.circular(8),
//                                       ),
//                                       borderSide: BorderSide.none),
//                                   enabledBorder: OutlineInputBorder(
//                                       borderRadius: BorderRadius.all(
//                                         Radius.circular(8),
//                                       ),
//                                       borderSide: BorderSide.none),
//                                   focusedBorder: OutlineInputBorder(
//                                       borderRadius: BorderRadius.all(
//                                         Radius.circular(8),
//                                       ),
//                                       borderSide: BorderSide.none),
//                                   prefixIcon: Icon(MdiIcons.mapMarkerOutline,
//                                       size: 24),
//                                 ),
//                                 textCapitalization:
//                                 TextCapitalization.sentences,
//                               ),
//                               Divider(
//                                 height: 0,
//                               ),
//                               TextFormField(
//                                 style: FxTextStyle.b2(),
//                                 decoration: InputDecoration(
//                                   hintStyle: FxTextStyle.b2(),
//                                   hintText: "Delivery Note",
//                                   border: OutlineInputBorder(
//                                       borderRadius: BorderRadius.all(
//                                         Radius.circular(8),
//                                       ),
//                                       borderSide: BorderSide.none),
//                                   enabledBorder: OutlineInputBorder(
//                                       borderRadius: BorderRadius.all(
//                                         Radius.circular(8),
//                                       ),
//                                       borderSide: BorderSide.none),
//                                   focusedBorder: OutlineInputBorder(
//                                       borderRadius: BorderRadius.all(
//                                         Radius.circular(8),
//                                       ),
//                                       borderSide: BorderSide.none),
//                                   prefixIcon: Icon(
//                                     MdiIcons.informationOutline,
//                                     size: 24,
//                                   ),
//                                 ),
//                                 textCapitalization:
//                                 TextCapitalization.sentences,
//                               ),
//                             ],
//                           ),
//                         ),
//                         FxSpacing.height(16),
//                         Row(
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: <Widget>[
//                             InkWell(
//                               onTap: () {
//                                 Navigator.of(context).pop();
//                               },
//                               child: Icon(
//                                 MdiIcons.chevronLeft,
//                                 color:
//                                 FxAppTheme.theme.colorScheme.onBackground,
//                                 size: 24,
//                               ),
//                             ),
//                             Expanded(
//                               child: Center(
//                                 child: Container(
//                                   alignment: Alignment.center,
//                                   child: Container(
//                                     decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.all(
//                                           Radius.circular(8)),
//                                       boxShadow: [
//                                         BoxShadow(
//                                           color: FxAppTheme
//                                               .theme.colorScheme.primary
//                                               .withAlpha(28),
//                                           blurRadius: 4,
//                                           offset: Offset(0,
//                                               3), // changes position of shadow
//                                         ),
//                                       ],
//                                     ),
//                                     child: FxButton(
//                                         onPressed: () {
//                                           Navigator.pop(context);
//                                         },
//                                         backgroundColor: FxAppTheme
//                                             .theme.colorScheme.primary,
//                                         child: FxText.b2(
//                                             "Save Address".toUpperCase(),
//                                             fontWeight: 600,
//                                             letterSpacing: 0.5,
//                                             color: FxAppTheme.theme
//                                                 .colorScheme.onPrimary)),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         )
//                       ],
//                     ))
//               ],
//             ),
//           )),
//     );
//   }
// }
