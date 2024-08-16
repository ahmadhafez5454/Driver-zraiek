import 'package:driverr/constant/my_colors.dart';
import 'package:driverr/data/apis/upcoming_api.dart';
import 'package:flutter/material.dart';
import '../../../../data/model/upcoming_trip_model.dart';
import '../../widget/travels_upcoming.dart';

class UpcomingTrip extends StatefulWidget {
  const UpcomingTrip({super.key});

  @override
  State<UpcomingTrip> createState() => _CurrentTripState();
}

class _CurrentTripState extends State<UpcomingTrip> {
  UpcomingTravelModel trip1 = UpcomingTravelModel();
  bool loading = true;

  Future<void> getupcoming() async {
    trip1 = await UpcomingApi().upcomingapi();
    loading = false;
    setState(() {

    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getupcoming();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: MyColors.myBlack,
        body: loading
            ? Center(child: CircularProgressIndicator())
            : trip1.data == null || trip1.data!.isEmpty
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
                'لا يوجد لديك رحلات مجدولة الآن    ',
                style: TextStyle(color: Colors.white, fontSize: 20,fontFamily: "cairo"),
              ),
            ),
          ),
        )
            : RefreshIndicator(
          onRefresh: getupcoming,
              child: ListView.builder(
                  itemCount: trip1.data?.length,
                  itemBuilder: (context, i) {
                    return travel(trip: trip1.data![i], context: context);
                  }),
            ));
  }
}
