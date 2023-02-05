import 'package:flutter/material.dart';
import 'package:rejuvenate_mobile_app/screens/editprofile.dart';

class ViewProfile extends StatefulWidget {
  static const routeName = "/view-user-profile";
  const ViewProfile({super.key});
  @override
  State<ViewProfile> createState() => _ViewProfileState();
}

class _ViewProfileState extends State<ViewProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
      child: Center(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 50,
          ),
          Stack(
            children: [
                SizedBox(
                width:150,
                height:150,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.network(
                    'https://cdn5.vectorstock.com/i/1000x1000/28/59/businesspeople-design-person-icon-flat-vector-9372859.jpg',
                    fit: BoxFit.cover,
                  ),
                )),
              
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), color:Colors.cyan),
                child: const Icon(Icons.edit,
                color: Colors.black,
                size:20,
                ),
              ),
              ),
            ],
          ),
        
        
        const SizedBox(
          height: 30,
        ),

        Text(
            "Salma Salah",
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(fontSize: 28, color: Colors.black),
          ),
        ],
      ),
      ),
),
      floatingActionButton: FloatingActionButton(
        onPressed:()=> Navigator.pushNamed(context, EditProfile.routeName),
        // tooltip: 'Increment',
        child: const Icon(Icons.edit),
      ), 
    
    );
  }
}