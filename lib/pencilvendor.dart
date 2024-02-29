import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendor_app/main.dart';

class PencilVendor extends StatefulWidget {
  PencilVendor({super.key});

  @override
  State<PencilVendor> createState() => _PencilVendorState();
}

class _PencilVendorState extends State<PencilVendor> {

  String? selectedvalue;

  void logout() async {
    await FirebaseAuth.instance
        .signOut()
        .then((value) => Get.off(Login()));
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Pencil vendor for \n Stationary."),
          ),
          centerTitle: true,
          automaticallyImplyLeading: false,
          shape: Border.all(width: 2),
        ),
        body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Particulars"),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("inventory in \n Subhash's Stationary"),
                          ),
                        ]
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: StreamBuilder<DocumentSnapshot>(
                            stream: FirebaseFirestore.instance.collection('Quantity').doc("pencil").snapshots(),
                            builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                              if (snapshot.connectionState == ConnectionState.waiting) {
                                return CircularProgressIndicator(); // Or any loading indicator
                              }
                              if (snapshot.hasError) {
                                return Text('Error: ${snapshot.error}');
                              }
                              // Check if the document exists
                              if (!snapshot.hasData || !snapshot.data!.exists) {
                                return Text('Document does not exist');
                              }
                              // Access the data
                              selectedvalue = snapshot.data?.get('product 2');

                              // Now you can use 'productValue' as your single variable
                              return Row(
                                children: [
                                  Text("Pencil"),
                                  SizedBox(width: 60,),
                                  Text(selectedvalue!),
                                ],
                              );
                            },
                          ),
                        ),

                      ],
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {

                            logout();

                          },
                          child: Text("LogOut")),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
