import 'package:task/features/Task/domain/entities/task_entity.dart';

class TaskModel extends TaskEntity {
  final int id;
  final String title;
  final List<String> img;
  final String interest;
  final int price;
  final String date;
  final String address;
  final String trainerName;
  final String trainerImg;
  final String trainerInfo;
  final String occasionDetail;
  final String latitude;
  final String longitude;
  final bool isLiked;
  final bool isSold;
  final bool isPrivateEvent;
  final bool hiddenCashPayment;
  final int specialForm;
  final List<ReservType> reservTypes;

  TaskModel(
      {this.id,
      this.title,
      this.img,
      this.interest,
      this.price,
      this.date,
      this.address,
      this.trainerName,
      this.trainerImg,
      this.trainerInfo,
      this.occasionDetail,
      this.latitude,
      this.longitude,
      this.isLiked,
      this.isSold,
      this.isPrivateEvent,
      this.hiddenCashPayment,
      this.specialForm,
      this.reservTypes})
      : super(
          title: title,
          aboutCoach: trainerInfo,
          coachName: trainerName,
          coachImage: trainerImg,
          interest: interest,
          specialCost: price,
          normalCost: price,
          fastCost: price,
          date: date,
          aboutCourse: occasionDetail,
          headerImages: img.map((e) => HeaderImages(url: e)).toList(),
        );

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json['id'],
      title: json['title'],
      img: json['img'] != null ? new List<String>.from(json['img']) : null,
      interest: json['interest'],
      price: json['price'],
      date: json['date'],
      address: json['address'],
      trainerName: json['trainerName'],
      trainerImg: json['trainerImg'],
      trainerInfo: json['trainerInfo'],
      occasionDetail: json['occasionDetail'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      isLiked: json['isLiked'],
      isSold: json['isSold'],
      isPrivateEvent: json['isPrivateEvent'],
      hiddenCashPayment: json['hiddenCashPayment'],
      specialForm: json['specialForm'],
      reservTypes: json['reservTypes'] != null
          ? (json['reservTypes'] as List).map((i) => ReservType.fromJson(i)).toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['interest'] = this.interest;
    data['price'] = this.price;
    data['date'] = this.date;
    data['address'] = this.address;
    data['trainerName'] = this.trainerName;
    data['trainerImg'] = this.trainerImg;
    data['trainerInfo'] = this.trainerInfo;
    data['occasionDetail'] = this.occasionDetail;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['isLiked'] = this.isLiked;
    data['isSold'] = this.isSold;
    data['isPrivateEvent'] = this.isPrivateEvent;
    data['hiddenCashPayment'] = this.hiddenCashPayment;
    data['specialForm'] = this.specialForm;
    if (this.img != null) {
      data['img'] = this.img;
    }
    if (this.reservTypes != null) {
      data['reservTypes'] = this.reservTypes.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ReservType {
  final int id;
  final String name;
  final int count;
  final int price;

  ReservType({this.id, this.name, this.count, this.price});

  factory ReservType.fromJson(Map<String, dynamic> json) {
    return ReservType(
      id: json['id'],
      name: json['name'],
      count: json['count'],
      price: json['price'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['count'] = this.count;
    data['price'] = this.price;
    return data;
  }
}
