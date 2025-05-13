import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:in_app_feedback_rating/in_app_feedback_rating.dart';

void main() {
  testWidgets('InAppFeedback with emojis test', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: InAppFeedbackRating(
            onRatingSubmitted: (rating) {},
            onFeedbackSubmitted: (feedback) {},
            onFeedbackRatingSubmitted: () {},
          ),
        ),
      ),
    );

    // Check if the Rating widget (with emojis) is present
    expect(find.byType(RatingBar), findsOneWidget);
    expect(find.text('😢'), findsOneWidget); // Check for 1 star emoji
    expect(find.text('😐'), findsOneWidget); // Check for 2 stars emoji
    expect(find.text('😊'), findsOneWidget); // Check for 3 stars emoji
    expect(find.text('😄'), findsOneWidget); // Check for 4 stars emoji
    expect(find.text('😍'), findsOneWidget); // Check for 5 stars emoji

    // Check if the feedback text field is present
    expect(find.byType(TextField), findsOneWidget);

    // Check if the submit button is present
    expect(find.text('Submit'), findsOneWidget);
  });
}
