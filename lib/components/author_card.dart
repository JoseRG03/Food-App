import 'package:demo_app/food_theme.dart';
import 'package:flutter/material.dart';

import 'circle_image.dart';

class AuthorCard extends StatefulWidget {
  const AuthorCard({super.key, required this.authorName, required this.title, this.imageProvider});

  final String authorName;
  final String title;
  final ImageProvider? imageProvider;

  @override
  State<AuthorCard> createState() => _AuthorCardState();
}

class _AuthorCardState extends State<AuthorCard> {

  bool _isFavorite = false;

  void _changeFavorite () {
    setState(() {
      _isFavorite = !_isFavorite;
    });
    
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Favorite Pressed')));
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleImage(imageProvider: widget.imageProvider, radius: 28),
              SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.authorName, style: FoodTheme.lightTextTheme.bodyLarge),
                  Text(widget.title, style: FoodTheme.lightTextTheme.bodyLarge),
                ],
              ),
            ],
          ),
          IconButton(
              iconSize: 30,
              color: Colors.red,
              onPressed: _changeFavorite,
              icon: Icon(_isFavorite ? Icons.favorite : Icons.favorite_border)),
        ],
      ),
    );
  }
}
