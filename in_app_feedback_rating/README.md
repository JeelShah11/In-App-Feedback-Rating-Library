<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/tools/pub/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/to/develop-packages).
-->

TODO: Put a short description of the package here that helps potential users
know whether this package might be useful for them.

## Features

TODO: List what your package can do. Maybe include images, gifs, or videos.

## Getting started

TODO: List prerequisites and provide or point to information on how to
start using the package.

## Usage

TODO: Include short and useful examples for package users. Add longer examples
to `/example` folder.

```dart
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final GlobalKey<ScaffoldMessengerState> _messengerKey =
  GlobalKey<ScaffoldMessengerState>();

  RxString ratingValue = "".obs;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: _messengerKey,
      home: Scaffold(
        appBar: AppBar(title: Text("In-App Feedback Test")),
        body: Center(
          child: Column(
            children: [
              InAppFeedbackRating(
                // feedbackHint: "Enter Feedback Here",
                // ratingHint: "Rating Here",
                submitButtonText: "Submit",
                onRatingSubmitted: (rating) {
                  print("Rating: $rating");

                  ratingValue.value = rating.toString();
                },
                onFeedbackSubmitted: (feedback) {
                  print("Feedback: $feedback");
                },
                onFeedbackRatingSubmitted: () {
                  print("Feedback and Rating Submitted!");

                  // Show SnackBar using the global key
                  _messengerKey.currentState?.showSnackBar(
                    SnackBar(
                      content: Text('Rating ${ratingValue.value} submitted!'),
                    ),
                  );
                  // Show a SnackBar when the button is pressed
                  /*    ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Feedback and Rating submitted!'),
                      duration: Duration(seconds: 2),
                      // Duration of the SnackBar
                      backgroundColor: Colors.blue,
                      // Background color of SnackBar
                      action: SnackBarAction(
                        label: 'UNDO',
                        onPressed: () {
                          // Handle the action, like undoing the change
                          print('Undo action');
                        },
                      ),
                    ),
                  );*/
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```

## Additional information

TODO: Tell users more about the package: where to find more information, how to
contribute to the package, how to file issues, what response they can expect
from the package authors, and more.
