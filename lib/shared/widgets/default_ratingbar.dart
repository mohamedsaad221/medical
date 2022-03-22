import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DefaultRatingbar extends StatelessWidget {
  const DefaultRatingbar({
    Key? key,
    required this.rate,
    this.size = 20.0,
    this.padding = const EdgeInsets.symmetric(vertical: 4),
  }) : super(key: key);

  final double rate;
  final double size;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: rate,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemSize: size,
      itemPadding: padding,
      itemBuilder: (context, _) => const Icon(Icons.star, color: Colors.amber),
      onRatingUpdate: (rating) {},
    );
  }
}
