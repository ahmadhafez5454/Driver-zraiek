class UpcomingTravelModel {
  List<Data>? data;
  String? msg;
  int? status;

  UpcomingTravelModel({this.data, this.msg, this.status});

  UpcomingTravelModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      for (var i = 0; i < json['data'].length; i++) {
        data!.add(Data.fromJson(json['data'][i]));
      }
    }
    msg = json['msg'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['msg'] = this.msg;
    data['status'] = this.status;
    return data;
  }
}

class Data {
  int? id;
  int? tripNum;
  String? date;
  String? startTrip;
  String? endTrip;
  String? status;
  int? availableChair;
  String? tripType;
  int? cost;
  int? driverId;
  int? busId;
  int? fromToId;
  int? branchId;
  Bus? bus;
  FromTo? fromTo;

  Data(
      {this.id,
        this.tripNum,
        this.date,
        this.startTrip,
        this.endTrip,
        this.status,
        this.availableChair,
        this.tripType,
        this.cost,
        this.driverId,
        this.busId,
        this.fromToId,
        this.branchId,
        this.bus,
        this.fromTo});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tripNum = json['trip_num'];
    date = json['date'];
    startTrip = json['start_trip'];
    endTrip = json['end_trip'];
    status = json['status'];
    availableChair = json['available_chair'];
    tripType = json['trip_type'];
    cost = json['cost'];
    driverId = json['Driver_id'];
    busId = json['Bus_id'];
    fromToId = json['From_To_id'];
    branchId = json['Branch_id'];
    bus = json['bus'] != null ? new Bus.fromJson(json['bus']) : null;
    fromTo =
    json['from_to'] != null ? new FromTo.fromJson(json['from_to']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['trip_num'] = this.tripNum;
    data['date'] = this.date;
    data['start_trip'] = this.startTrip;
    data['end_trip'] = this.endTrip;
    data['status'] = this.status;
    data['available_chair'] = this.availableChair;
    data['trip_type'] = this.tripType;
    data['cost'] = this.cost;
    data['Driver_id'] = this.driverId;
    data['Bus_id'] = this.busId;
    data['From_To_id'] = this.fromToId;
    data['Branch_id'] = this.branchId;
    if (this.bus != null) {
      data['bus'] = this.bus!.toJson();
    }
    if (this.fromTo != null) {
      data['from_to'] = this.fromTo!.toJson();
    }
    return data;
  }
}

class Bus {
  int? id;
  int? busNumber;
  String? busName;
  String? model;
  String? type;
  int? chairCount;

  Bus(
      {this.id,
        this.busNumber,
        this.busName,
        this.model,
        this.type,
        this.chairCount});

  Bus.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    busNumber = json['bus_number'];
    busName = json['bus_name'];
    model = json['model'];
    type = json['type'];
    chairCount = json['chair_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['bus_number'] = this.busNumber;
    data['bus_name'] = this.busName;
    data['model'] = this.model;
    data['type'] = this.type;
    data['chair_count'] = this.chairCount;
    return data;
  }
}

class FromTo {
  int? id;
  String? source;
  String? destination;

  FromTo({this.id, this.source, this.destination});

  FromTo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    source = json['source'];
    destination = json['destination'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['source'] = this.source;
    data['destination'] = this.destination;
    return data;
  }
}
