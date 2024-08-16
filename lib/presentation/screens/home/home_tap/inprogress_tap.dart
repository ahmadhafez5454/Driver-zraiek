import 'package:driverr/constant/my_colors.dart';
import 'package:driverr/data/apis/current_api.dart';
import 'package:driverr/presentation/screens/widget/travels_inprogress.dart';
import 'package:flutter/material.dart';
import '../../../../data/model/inprogress_trip_model.dart';

class InprogressTap extends StatefulWidget {
  const InprogressTap({super.key});

  @override
  State<InprogressTap> createState() => _CurrentTripState();
}

class _CurrentTripState extends State<InprogressTap> {
  CurrentTravelModel trip2 = CurrentTravelModel();
  bool loading = true;

  Future<void> getcurrent() async {
    trip2 = await CurrentApi().currentApi();
    print(trip2.data!.length);
    loading = false;
    if(trip2!.data != null){
      Text("hello mr");
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getcurrent();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: MyColors.myBlack,
      body: loading
          ? Center(child: CircularProgressIndicator())
          : trip2.data == null || trip2.data!.isEmpty
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
          : RefreshIndicator(
        onRefresh: getcurrent,
        child: ListView.builder(
          itemCount: trip2.data?.length,
          itemBuilder: (context, i) {
            return travelInprogress(
                trip: trip2.data![i], context: context);
          },
        ),
      ),
    );
  }
}
