import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});
  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // appBar: AppBar(
      //   leading: IconButton(onPressed: () => Get.back(), icon: Icons.arrow_back),
      // ),
      // body: SingleChildScrollView(
        body: Column(
      // child: Column(
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
                        prefixIcon: const Icon(Icons.person_outlined),
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
                  prefixIcon: const Icon(Icons.email_outlined),
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
                  prefixIcon: const Icon(Icons.password),
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

            const SizedBox(
              height: 30,
            ),

            // ElevatedButton(
            // onPressed:()=> Navigator.of(context).pushNamed('/splashscreen'),
            // child: const Text('Save Changes'),
            // ),

            Padding(
                  padding: const EdgeInsets.only(
                    top: 10, left: 15, right: 15, bottom: 0),
                  child: Container(
                  padding: const EdgeInsets.only(
                    top: 10, left: 15, right: 15, bottom: 5),
                  decoration: BoxDecoration(
                    color: Colors.cyan,
                    borderRadius: BorderRadius.circular(12),
                  ),
                      child: ElevatedButton(
                        onPressed:()=> Navigator.of(context).pushNamed('/savingprofileupdates'),
                        style: ElevatedButton.styleFrom(
                          elevation: 0.0,
                          backgroundColor: Colors.black.withOpacity(0),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12),),
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            'Save Changes',
                              style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

        ],
      ),
      // ),
    );
  }
}
