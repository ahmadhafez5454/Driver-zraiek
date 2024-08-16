import 'package:driverr/data/apis/finish_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../constant/my_colors.dart';
import '../../../../data/model/finish_trip_model.dart';
import '../../widget/travels_finish.dart';

class FinishTap extends StatefulWidget {
  const FinishTap({super.key});

  @override
  State<FinishTap> createState() => _CurrentTripState();
}

class _CurrentTripState extends State<FinishTap> {
  FinishTravelModel trip3 = FinishTravelModel();

  bool loading = true;

  Future<void> getfinish() async {
    trip3 = await FinishApi().finishapi();
    loading = false;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getfinish();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: MyColors.myBlack,

        body:loading
        ? Center(child: CircularProgressIndicator())
        : trip3.data == null || trip3.data!.isEmpty
    ? Center(
    child: Container(
    height: 50,
    width: 350,
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(25),
    color: MyColors.myYellow
    ),
    child: const Padding(
    padding:  EdgeInsets.only(left: 40,top: 10),
    child:  Text(
    'لا يوجد لديك رحلات من هذا النوع',
    style: TextStyle(color: Colors.white, fontSize: 20,fontFamily: "cairo"),
    ),
    ),
    ),
    )
        :RefreshIndicator(
          onRefresh: getfinish,
          child: ListView.builder(
              itemCount: trip3.data?.length,
              itemBuilder: (context , i ){
                return travelfinish(trip: trip3.data![i], context: context);
              }),
        )
    );

  }
}
