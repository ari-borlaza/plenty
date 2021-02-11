import 'package:flutter/material.dart';
import 'package:plenty/config/colors.dart';

class FoodItem extends StatelessWidget {
  const FoodItem({
    @required this.title,
    Key key,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) => Container(
        height: 96,
        child: Card(
          color: AppColors.yellow,
          child: Text(
            '$title a long title',
            style: TextStyle(
              color: Colors.red,
            ),
          ),
        ),
      );
}

class HorizontalItem extends StatelessWidget {
  const HorizontalItem({
    @required this.title,
    Key key,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) => Container(
        width: 140,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: Material(
            color: Colors.red,
            child: Center(
              child: Text(
                title,
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
          ),
        ),
      );
}

/// Wrap Ui item with animation & padding
Widget Function(
  BuildContext context,
  int index,
  Animation<double> animation,
) animationItemBuilder(
  Widget Function(int index) child, {
  EdgeInsets padding = EdgeInsets.zero,
}) =>
    (
      BuildContext context,
      int index,
      Animation<double> animation,
    ) =>
        FadeTransition(
          opacity: Tween<double>(
            begin: 0,
            end: 1,
          ).animate(animation),
          child: SlideTransition(
            position: Tween<Offset>(
              begin: Offset(0, -0.1),
              end: Offset.zero,
            ).animate(animation),
            child: Padding(
              padding: padding,
              child: child(index),
            ),
          ),
        );

Widget Function(
  BuildContext context,
  Animation<double> animation,
) animationBuilder(
  Widget child, {
  double xOffset = 0,
  EdgeInsets padding = EdgeInsets.zero,
}) =>
    (
      BuildContext context,
      Animation<double> animation,
    ) =>
        FadeTransition(
          opacity: Tween<double>(
            begin: 0,
            end: 1,
          ).animate(animation),
          child: SlideTransition(
            position: Tween<Offset>(
              begin: Offset(xOffset, 0.1),
              end: Offset.zero,
            ).animate(animation),
            child: Padding(
              padding: padding,
              child: child,
            ),
          ),
        );

class AppConfig {
  static const appName = "Nomadic Tribe";
  static const appTagline = "Nomadic Tribe";
}

class AvailableFonts {
  static const primaryFont = "Quicksand";
}

class AvailableImages {
  static const man1 = {
    'assetImage': AssetImage('assets/images/tribes/penan.jpg'),
    'assetPath': 'assets/images/tribes/penan.jpg',
  };

  static const man2 = {
    'assetImage': AssetImage('assets/images/tribes/limbu.jpg'),
    'assetPath': 'assets/images/tribes/limbu.jpg'
  };

  static const man3 = {
    'assetImage': AssetImage('assets/images/samples/man3.jpg'),
    'assetPath': 'assets/images/samples/man3.jpg',
  };

  static const man4 = {
    'assetImage': AssetImage('assets/images/samples/man4.jpg'),
    'assetPath': 'assets/images/samples/man4.jpg',
  };

  static const man5 = {
    'assetImage': AssetImage('assets/images/samples/man5.jpg'),
    'assetPath': 'assets/images/samples/man5.jpg',
  };

  static const woman1 = {
    'assetImage': AssetImage('assets/images/tribes/karen.jpg'),
    'assetPath': 'assets/images/tribes/karen.jpg',
  };

  static const woman2 = {
    'assetImage': AssetImage('assets/images/samples/woman2.jpg'),
    'assetPath': 'assets/images/samples/woman2.jpg',
  };

  static const woman3 = {
    'assetImage': AssetImage('assets/images/samples/woman3.jpg'),
    'assetPath': 'assets/images/samples/woman3.jpg',
  };

  static const woman4 = {
    'assetImage': AssetImage('assets/images/samples/woman4.jpg'),
    'assetPath': 'assets/images/samples/woman4.jpg',
  };

  static const woman5 = {
    'assetImage': AssetImage('assets/images/samples/woman5.jpg'),
    'assetPath': 'assets/images/samples/woman5.jpg',
  };

  static const postBanner = {
    'assetImage': AssetImage('assets/images/samples/post_banner.jpg'),
    'assetPath': 'assets/images/samples/post_banner.jpg',
  };

  static const emptyState = {
    'assetImage': AssetImage('assets/images/samples/empty.png'),
    'assetPath': 'assets/images/samples/empty.png',
  };

  static const homePage =
      const AssetImage('assets/images/samples/home_page.png');
  static const appLogo = const AssetImage('assets/images/samples/logo.png');
}
