import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  static const routeName = "/edit-profile";
  const EditProfile({super.key});
  @override
  // ignore: library_private_types_in_public_api
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  // final TextEditingController _wordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   leading: IconButton(onPressed: () => Get.back(), icon: Icons.arrow_back),
      // ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Update Your Profile",
            style: Theme.of(context).textTheme.headline6!.copyWith(fontSize: 28, color: Colors.cyan),
          ),

// First Name
          const SizedBox(
            height: 30,
          ),
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              width: double.infinity,
              child: TextField(
                // controller: _wordController,
                // onSubmitted: (str) => _submitWord(),
                cursorColor: Colors.black,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        borderSide:
                            const BorderSide(color: Colors.cyan, width: 2.0)),
                        prefixIcon: const Icon(Icons.person),
                    labelText: "Full Name",
                    labelStyle: const TextStyle(color: Colors.grey),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 20),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        borderSide:
                            const BorderSide(color: Colors.cyan, width: 2.0))
                ),
                // style: TextStyle(color: Theme.of(context).primaryColor),
              )),

//Username
          const SizedBox(
            height: 30,
          ),

          Container(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              width: double.infinity,
              child: TextField(
                // controller: _wordController,
                // onSubmitted: (str) => _submitWord(),
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  // prefixIcon: const Icon(Icons.person),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        borderSide:
                            const BorderSide(color: Colors.cyan, width: 2.0)),
                    labelText: "Username",
                    labelStyle: const TextStyle(color: Colors.grey),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 20),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        borderSide:
                            const BorderSide(color: Colors.cyan, width: 2.0))
                ),
                // style: TextStyle(color: Theme.of(context).primaryColor),
              )),



//E-mail
          const SizedBox(
            height: 30,
          ),

          Container(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              width: double.infinity,
              child: TextField(
                // controller: _wordController,
                // onSubmitted: (str) => _submitWord(),
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.email),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        borderSide:
                            const BorderSide(color: Colors.cyan, width: 2.0)),
                    labelText: "Email",
                    labelStyle: const TextStyle(color: Colors.grey),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 20),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        borderSide:
                            const BorderSide(color: Colors.cyan, width: 2.0))
                ),
                // style: TextStyle(color: Theme.of(context).primaryColor),
              )),

//Password
          const SizedBox(
            height: 30,
          ),

          Container(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              width: double.infinity,
              child: TextField(
                // controller: _wordController,
                // onSubmitted: (str) => _submitWord(),
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.password_rounded),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        borderSide:
                            const BorderSide(color: Colors.cyan, width: 2.0)),
                    labelText: "Password",
                    labelStyle: const TextStyle(color: Colors.grey),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 20),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        borderSide:
                            const BorderSide(color: Colors.cyan, width: 2.0))
                ),
                // style: TextStyle(color: Theme.of(context).primaryColor),
              )),


//Phone Number
          const SizedBox(
            height: 30,
          ),

          Container(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              width: double.infinity,
              child: TextField(
                // controller: _wordController,
                // onSubmitted: (str) => _submitWord(),
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.phone),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        borderSide:
                            const BorderSide(color: Colors.cyan, width: 2.0)),
                    labelText: "Phone Number",
                    labelStyle: const TextStyle(color: Colors.grey),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 20),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        borderSide:
                            const BorderSide(color: Colors.cyan, width: 2.0))
                ),
                // style: TextStyle(color: Theme.of(context).primaryColor),
              )),

          // Container(
          //   margin: const EdgeInsets.only(right: 10),
          //   child: ElevatedButton(
          //     onPressed: ,
          //     child: FittedBox(
          //       child: Text("Confirm",
          //           style: Theme.of(context)
          //               .textTheme
          //               .headline6!
          //               .copyWith(color: Colors.white)),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
