import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class TaskEntity extends Equatable {
  final List<HeaderImages> headerImages;
  final String interest, title, date, coachName, aboutCoach, coachImage, aboutCourse;
  final int normalCost, specialCost, fastCost;
  bool isFavourite;

  TaskEntity(
      {@required this.headerImages,
      @required this.interest,
      @required this.title,
      @required this.date,
      @required this.coachName,
      @required this.aboutCoach,
      @required this.aboutCourse,
      @required this.normalCost,
      @required this.specialCost,
      @required this.fastCost,
      @required this.coachImage,
      this.isFavourite = false});

  @override
  List<Object> get props => [
        headerImages,
        interest,
        title,
        date,
        coachName,
        aboutCoach,
        aboutCourse,
        normalCost,
        specialCost,
        fastCost,
        coachImage,
        isFavourite
      ];
}

class HeaderImages extends Equatable {
  final String url;

  const HeaderImages({
    @required this.url,
  });

  @override
  List<Object> get props => [url];
}
