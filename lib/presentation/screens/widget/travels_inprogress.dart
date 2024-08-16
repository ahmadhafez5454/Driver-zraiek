import 'package:driverr/constant/string.dart';
import 'package:flutter/material.dart';
import '../../../constant/my_colors.dart';
import '../../../constant/string.dart';
import '../../../data/apis/update_statues_api.dart';
import '../../../data/model/inprogress_trip_model.dart';



Widget travelInprogress({required Data trip,required BuildContext context}) {

  return Padding(
    padding: const EdgeInsets.all(4.0),
    child: Container(
      height: 220,
      decoration: BoxDecoration(
          color: MyColors.myLightGrey, borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Text(
            trip.date!.substring(0,10),
            style: const TextStyle(
              fontWeight: FontWeight.w200,
              fontSize: 16,
              fontFamily: "cairo",
              color: Colors.white,
            ),
          ),
          Row(
            children: [
              Expanded(
                  child: Column(
                    children: [
                      const Icon(
                        Icons.directions_bus_rounded,
                        color: MyColors.myGrey,
                      ),
                      const Text(
                        "الانطلاق",
                        style: TextStyle(
                          fontWeight: FontWeight.w200,
                          fontSize: 14,
                          fontFamily: "cairo",
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        trip.startTrip!.substring(11,16),
                        style: const TextStyle(
                          fontWeight: FontWeight.w200,
                          fontSize: 16,
                          fontFamily: "cairo",
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 4),
                      const Text(
                        "من مدينة",
                        style: TextStyle(
                          fontWeight: FontWeight.w200,
                          fontSize: 14,
                          fontFamily: "cairo",
                          color: MyColors.myYellow,
                        ),
                      ),
                      Text(
                        trip.fromTo!.source!,
                        style: const TextStyle(
                          fontWeight: FontWeight.w200,
                          fontSize: 16,
                          fontFamily: "cairo",
                          color: Colors.white,
                        ),
                      ),
                    ],
                  )),
              Expanded(
                  child: Column(
                    children: [
                      const Text(
                        "نوع الباص",
                        style: TextStyle(
                          fontWeight: FontWeight.w200,
                          fontSize: 14,
                          fontFamily: "cairo",
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        trip.bus!.type!,
                        style: const TextStyle(
                          fontWeight: FontWeight.w200,
                          fontSize: 14,
                          fontFamily: "cairo",
                          color: MyColors.myYellow,
                        ),
                      ),
                      const Text(
                        "رقم الباص",
                        style: TextStyle(
                          fontWeight: FontWeight.w200,
                          fontSize: 14,
                          fontFamily: "cairo",
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        "${trip.busId} ",
                        style: const TextStyle(
                          fontWeight: FontWeight.w200,
                          fontSize: 16,
                          fontFamily: "cairo",
                          color: Colors.white,
                        ),
                      ),
                      Container(
                        height: 20,
                        width: 60,
                        color: MyColors.myYellow,
                        child:  Center(
                          child: Text(
                            trip.status!,
                            style: TextStyle(
                              fontWeight: FontWeight.w200,
                              fontSize: 12,
                              fontFamily: "cairo",
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
              Expanded(
                  child: Column(
                    children: [
                      const Icon(
                        Icons.directions_bus_rounded,
                        color: MyColors.myGrey,
                      ),
                      const Text(
                        "الوصول",
                        style: TextStyle(
                          fontWeight: FontWeight.w200,
                          fontSize: 14,
                          fontFamily: "cairo",
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        trip.endTrip!.substring(11, 16),
                        style: const TextStyle(
                          fontWeight: FontWeight.w200,
                          fontSize: 16,
                          fontFamily: "cairo",
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        "إلى مدينة",
                        style: TextStyle(
                          fontWeight: FontWeight.w200,
                          fontSize: 14,
                          fontFamily: "cairo",
                          color: MyColors.myYellow,
                        ),
                      ),
                      Text(
                        trip.fromTo!.destination!,
                        style: const TextStyle(
                          fontWeight: FontWeight.w200,
                          fontSize: 16,
                          fontFamily: "cairo",
                          color: Colors.white,
                        ),
                      ),

                    ],
                  )),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: MaterialButton(
              onPressed: () {
                UpdateStatuesApi().updateTripStatus(trip.id!);
              },
              child: Container(
                  alignment: Alignment.center,
                  height: 40,
                  decoration: BoxDecoration(
                    // color: MyColors.myGrey,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: MyColors.myYellow, width: 2),
                  ),
                  child: const Text(
                    "إنهاء الرحلة",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: MyColors.myYellow,
                        fontSize: 16,
                        fontFamily: "cairo"),
                  )),
            ),
          ),
        ],
      ),
    ),
  );
}
