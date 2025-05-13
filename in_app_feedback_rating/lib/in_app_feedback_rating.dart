import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class InAppFeedbackRating extends StatefulWidget {
  final Function(double) onRatingSubmitted;
  final Function(String) onFeedbackSubmitted;
  final VoidCallback onFeedbackRatingSubmitted;
  final String feedbackHint;
  final String submitButtonText;
  final String ratingHint;

  const InAppFeedbackRating({
    super.key,
    required this.onRatingSubmitted,
    required this.onFeedbackSubmitted,
    required this.onFeedbackRatingSubmitted,
    this.feedbackHint = "Please provide your feedback",
    this.submitButtonText = "Submit",
    this.ratingHint = "Rate this app",
  });

  @override
  State<InAppFeedbackRating> createState() => _InAppFeedbackRatingState();
}

class _InAppFeedbackRatingState extends State<InAppFeedbackRating> {
  double _currentRating = 5; // Default rating is 0

  // Update the emoji based on rating
  void _updateEmoji(double rating) {
    setState(() {
      _currentRating = rating;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.ratingHint,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            // Inside the RatingBar.builder()
            RatingBar.builder(
              initialRating: _currentRating,
              minRating: 1,
              itemSize: 40,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemBuilder: (context, index) {
                String emoji;
                Color emojiColor =
                    Colors.grey; // Default color for non-selected emojis

                // Assign the correct emoji and color based on the rating
                switch (index) {
                  case 0:
                    emoji = '😢'; // 1 star - Sad face
                    break;
                  case 1:
                    emoji = '😐'; // 2 stars - Neutral face
                    break;
                  case 2:
                    emoji = '😊'; // 3 stars - Happy face
                    break;
                  case 3:
                    emoji = '😄'; // 4 stars - Grinning face
                    break;
                  case 4:
                    emoji = '😍'; // 5 stars - Heart eyes
                    break;
                  default:
                    emoji = '😢';
                }

                // Highlight the selected emoji
                if (index + 1 <= _currentRating) {
                  emojiColor =
                      Colors.blue; // Highlight color for selected rating
                }

                return GestureDetector(
                  onTap: () {
                    _updateEmoji(
                      index + 1.0,
                    ); // Update the rating when tapping an emoji
                    widget.onRatingSubmitted(index + 1.0);
                  },
                  child: AnimatedSwitcher(
                    duration: Duration(milliseconds: 300), // Animation duration
                    child: Text(
                      emoji,
                      key: ValueKey<double>(_currentRating),
                      // Key for animated switching
                      style: TextStyle(
                        fontSize: 40, // Size for the emoji
                        color:
                            emojiColor, // Color for the emoji based on rating
                      ),
                    ),
                  ),
                );
              },
              onRatingUpdate: widget.onRatingSubmitted,
            ),

            SizedBox(height: 16),
            Text(widget.feedbackHint, style: TextStyle(fontSize: 16)),
            TextField(
              maxLines: 3,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Write your feedback here...",
              ),
              onChanged: widget.onFeedbackSubmitted,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: widget.onFeedbackRatingSubmitted,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                widget.submitButtonText,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
