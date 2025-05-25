import 'package:flutter/material.dart';

class ScreenWithNavPadding extends StatelessWidget {
  final Widget child;
  final bool applyPadding;
  static const double navBarHeight = 70.0;

  const ScreenWithNavPadding({
    super.key,
    required this.child,
    this.applyPadding = true,
  });

  @override
  Widget build(BuildContext context) {
    if (!applyPadding) {
      return child;
    }

    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).padding.bottom + navBarHeight,
      ),
      child: child,
    );
  }
}

// Usage example:
class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenWithNavPadding(
        child: Column(
          children: [
            // Your screen content here
            Text('Profile Screen'),
            // More content...
          ],
        ),
      ),
    );
  }
}

// For screens where you don't want the padding (like full-screen views):
// class FullScreenView extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ScreenWithNavPadding(
//         applyPadding: false,
//         child: YourFullScreenContent(),
//       ),
//     );
//   }
// }