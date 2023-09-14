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
  static Color backgroundColor = const Color(0xff151c2b);
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
    if (value == null || value.isEmpty || value.length < 3) {
      return 'Please enter some text';
    } else {
      return null;
    }
  }

  String? warningValidator(String? value) {
    if (value != null &&
        value.isNotEmpty &&
        value.length >= 3 &&
        value.length < 6) {
      return 'Please enter some more text';
    } else {
      return null;
    }
  }

  String? successValidator(String? value) {
    if (value != null && value.length >= 6) {
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
    return FitBottomNavView(
      initialTab: 2,
      height: 85,
      backgroundColor: backgroundColor,
      icons: const [
        Icons.radio_button_checked,
        Icons.text_fields,
        Icons.person,
        Icons.border_bottom,
        Icons.logout,
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
                  HexButton(
                    text: "Hello",
                    isLoading: isLoading,
                    onPress: _toggleLoading,
                  ),
                  HexButtonSmall(
                    text: "Hello",
                    isLoading: isLoading,
                    onPress: _toggleLoading,
                  ),
                  HexIconButton(
                    icon: const Icon(
                      Icons.heart_broken,
                      color: Colors.white,
                    ),
                    isLoading: isLoading,
                    onPress: _toggleLoading,
                  ),
                  HexSwipeButton(
                    onSwipeComplete: () {
                      log('Swipe completed');
                    },
                    minCompletionPercentage: 0.5,
                    returnToStart: true,
                  ),
                  // const LoaderIcon(animationDuration: 300),
                ],
              ),
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
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
          width: 20,
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
                  HexButton(
                    text: "Success Toast",
                    onPress: () {
                      showToast(ToastType.success);
                    },
                  ),
                  HexButton(
                    text: "Warning Toast",
                    onPress: () {
                      showToast(ToastType.warning);
                    },
                  ),
                  HexButton(
                    text: "Error Toast",
                    onPress: () {
                      showToast(ToastType.error);
                    },
                  ),
                  HexButton(
                    text: "Info Toast",
                    onPress: () {
                      showToast(ToastType.info);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
          width: 20,
        ),
      ],
    );
  }
}
