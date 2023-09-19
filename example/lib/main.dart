import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hex_ui_widgets/hex_ui_widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UI Components',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Color backgroundColor = const Color(0xff151c2b);
  Color primaryColor = const Color(0xff4fbf48);
  Color neutralD300 = const Color(0xff222d45);
  bool isLoading = false;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  void _toggleLoading() {
    setState(() {
      isLoading = true;
    });
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  String? errorValidator(String? value) {
    if (value == null || value.isEmpty || value.length < 5) {
      return 'Please enter some text';
    } else {
      return null;
    }
  }

  String? warningValidator(String? value) {
    if (value != null &&
        value.isNotEmpty &&
        value.length >= 5 &&
        value.length < 10) {
      return 'Please enter some more text';
    } else {
      return null;
    }
  }

  String? successValidator(String? value) {
    if (value != null && value.length >= 10) {
      return 'Good to go';
    } else {
      return null;
    }
  }

  void showToast(ToastType toastType) {
    scaffoldKey.currentState?.showBottomSheet(
      (context) {
        return Toast(
          toastType: toastType,
          message: "Toast Displayed",
          onActionIconPressed: () {
            if (Navigator.of(context).canPop()) {
              Navigator.of(context).pop();
            }
          },
        );
      },
      backgroundColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(40)),
      ),
    );
    Future.delayed(const Duration(seconds: 2), () {
      if (Navigator.of(context).canPop()) {
        Navigator.of(context).pop();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 60),
      child: FitBottomNavView(
        initialTab: 2,
        height: 100,
        backgroundColor: backgroundColor,
        icons: const [
          Icons.notifications,
          Icons.shopping_cart,
          Icons.home,
          Icons.favorite,
          Icons.person,
        ],
        screens: [
          Scaffold(
            backgroundColor: backgroundColor,
            body: SafeArea(
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    HexTextField(
                      errorValidator: errorValidator,
                      warningValidator: warningValidator,
                      successValidator: successValidator,
                      leadingWidget: const Icon(
                        Icons.email,
                        color: Colors.grey,
                      ),
                      hintText: "type something",
                    ),
                    HexSwipeButton(
                      onSwipeComplete: () {
                        log('Swipe completed');
                      },
                      minCompletionPercentage: 0.5,
                      text: "Swipe Me",
                      textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Scaffold(
            backgroundColor: backgroundColor,
            body: Center(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  HexListTileSmall(
                    title: "Title",
                    subTitle: "Sub Title",
                    leading: const Icon(
                      Icons.star,
                      color: Colors.white,
                    ),
                    leadingBackgroundColor: primaryColor,
                    backgroundColor: primaryColor,
                    backgroundColorOpacity: 0.2,
                  ),
                  HexListTileSmall(
                    title: "Title",
                    subTitle: "Sub Title",
                    trailing: const Icon(
                      Icons.star,
                      color: Colors.white,
                    ),
                    trailingBackgroundColor: primaryColor,
                    backgroundColor: primaryColor,
                    backgroundColorOpacity: 0.2,
                  ),
                  HexListTileSmall(
                    title: "Title",
                    subTitle: "Sub Title",
                    leading: Icon(
                      Icons.star,
                      color: primaryColor,
                    ),
                    leadingBackgroundColor: primaryColor,
                    leadingBackgroundColorOpacity: 0.2,
                    outlineGradientPrimaryColor: primaryColor,
                  ),
                  HexListTileSmall(
                    title: "Title",
                    subTitle: "Sub Title",
                    leading: Icon(
                      Icons.star,
                      color: primaryColor,
                    ),
                    leadingBackgroundColor: neutralD300,
                    outlineColor: neutralD300,
                  ),
                  HexListTileSmall(
                    title: "Title",
                    leading: Icon(
                      Icons.star,
                      color: primaryColor,
                    ),
                    backgroundColor: primaryColor,
                    backgroundColorOpacity: 0.2,
                  ),
                ],
              ),
            ),
          ),
          Scaffold(
            backgroundColor: backgroundColor,
            body: SafeArea(
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    HexButton(
                      text: "Press Me",
                      isLoading: isLoading,
                      onPress: _toggleLoading,
                    ),
                    HexButton(
                      text: "Press Me",
                      isLoading: isLoading,
                      onPress: _toggleLoading,
                      color: backgroundColor,
                    ),
                    HexButtonSmall(
                      text: "Press Me",
                      isLoading: isLoading,
                      onPress: _toggleLoading,
                    ),
                    HexButtonSmall(
                      text: "Press Me",
                      isLoading: isLoading,
                      color: backgroundColor,
                      onPress: _toggleLoading,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        HexIconButton(
                          icon: const Icon(
                            Icons.favorite,
                            color: Colors.white,
                          ),
                          isLoading: isLoading,
                          onPress: _toggleLoading,
                        ),
                        HexIconButton(
                          icon: const Icon(
                            Icons.favorite,
                            color: Colors.green,
                          ),
                          isLoading: isLoading,
                          color: backgroundColor,
                          onPress: _toggleLoading,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Scaffold(
            backgroundColor: backgroundColor,
            key: scaffoldKey,
            body: SafeArea(
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        HexButtonSmall(
                          text: "Success Toast",
                          onPress: () {
                            showToast(ToastType.success);
                          },
                          color: backgroundColor,
                        ),
                        HexButtonSmall(
                          text: "Warning Toast",
                          onPress: () {
                            showToast(ToastType.warning);
                          },
                          color: backgroundColor,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        HexButtonSmall(
                          text: "Error Toast",
                          onPress: () {
                            showToast(ToastType.error);
                          },
                          color: backgroundColor,
                        ),
                        HexButtonSmall(
                          text: "Info Toast",
                          onPress: () {
                            showToast(ToastType.info);
                          },
                          color: backgroundColor,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Scaffold(
            backgroundColor: backgroundColor,
            body: const SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      LoaderIcon(),
                      SizedBox(width: 30),
                      LoaderIcon(
                        primaryColor: Colors.green,
                        secondaryColor: Colors.greenAccent,
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      LoaderIcon(
                        animationDuration: 300,
                      ),
                      SizedBox(width: 30),
                      LoaderIcon(radius: 5),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
