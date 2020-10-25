import 'package:doctor_consultation_app/constant.dart';
import 'package:flutter/material.dart';

import '../constant.dart';

class CategoryCard extends StatelessWidget {
  var _title;
  var _imageUrl;
  var _bgColor;

  CategoryCard(this._title, this._imageUrl, this._bgColor);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 150,
      child: Stack(
        children: <Widget>[
          Card(
             color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
              width: 110,
              height: 110,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 16,
              ),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  _title,
                  style: TextStyle(
                    color: kTitleTextColor,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            right: 10,
            child: Container(
              height: 64,
              width: 64,
              decoration: BoxDecoration(
                color: _bgColor.withOpacity(0.8),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Image.asset(
                _imageUrl,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
