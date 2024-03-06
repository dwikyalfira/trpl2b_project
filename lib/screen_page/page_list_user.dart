import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/model_user.dart';

class PageListUser extends StatefulWidget {
  const PageListUser({super.key});

  @override
  State<PageListUser> createState() => _PageListUserStateState();
}

class _PageListUserStateState extends State<PageListUser> {
  bool isLoading = true;
  List<ModelUser> listUser = [];

  //method get data
  Future getUser() async {
    try {
      //load in background
      setState(() {
        isLoading = true;
      });
      http.Response response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
      var data = jsonDecode(response.body);
      setState(() {
        for (Map<String, dynamic> i in data) {
          listUser.add(ModelUser.fromJson(i));
        }
      });
    } catch (e) {
      //if error
      isLoading = false;
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  //do in background
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('List Data User'),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: listUser.length,
          itemBuilder: (context, index) {
            return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PageDetailUser(user: listUser[index]),
                      ));
                },
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Card(
                    child: ListTile(
                      title: Text(
                        listUser[index].name ?? "",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Colors.red),
                      ),
                      subtitle: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(listUser[index].email ?? ""),
                          Text(listUser[index].address.street ?? ""),
                          Text('Company:  ${listUser[index].company.name}' ??
                              ""),
                        ],
                      ),
                    ),
                  ),
                ));
          },
        ),
      ),
    );
  }
}

class PageDetailUser extends StatelessWidget {
  final ModelUser user;

  const PageDetailUser({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user.name),
        backgroundColor: Colors.cyan,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(''
                'Berikut ini adalah detail user: ',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
            ),
            Text(
              'Name: ${user.name}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.red),
            ),
            const SizedBox(height: 8),
            Text('Email: ${user.email}'),
            const SizedBox(height: 8),
            Text('Username: ${user.username}'),
            const SizedBox(height: 8),
            Text('Phone: ${user.phone}'),
            const SizedBox(height: 12),
            Text('Website: ${user.website}'),

            const SizedBox(height: 30),
            const Text('Street: '),
            Text('${user.address.street}, ${user.address.suite}, ${user.address.city}, ${user.address.zipcode} '),

            const SizedBox(height: 30),
            const Text('Company: '),
            Text(user.company.name),

            const SizedBox(height: 8),
            Text('Catch Phrase: ${user.company.catchPhrase}'),


            // Add more user details here if needed
          ],
        ),
      ),
    );
  }
}

// class PageDetailUser extends StatelessWidget {
//   const PageDetailUser({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Detail User'),
//       ),
//     );
//   }
// }
