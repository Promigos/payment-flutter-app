import 'package:flutter/material.dart';
import 'package:payment_app/screens/add_accounts_page.dart';
import 'package:payment_app/screens/update_cred.dart';
import 'package:payment_app/screens/addphno_page.dart';
import 'package:payment_app/utils/utils.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _profpage();
}

class _profpage extends State<ProfilePage> {
  getData() async {
    var userName = await getName;
    var userEmail = await getEmailID;
    var phoneNumber = await getPhoneNumber;

    return {
      "userName": userName,
      "userEmail": userEmail,
      "phoneNumber": phoneNumber
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            splashRadius: 20,
            icon: const Icon(
              Icons.arrow_back_ios_outlined,
            )),
      ),
      body: FutureBuilder(
          future: getData(),
          builder: (context, AsyncSnapshot snapshot) {
            return snapshot.hasData ? Padding(
              padding: const EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(
                    height: 40,
                  ),
                  Center(
                    child: CircleAvatar(
                      radius: 70.0,
                      backgroundColor: Colors.blue,
                      child: Text(
                        snapshot.data!['userName'][0] ?? "",
                        style: const TextStyle(
                          fontSize: 65.0,
                          color: Colors.white,
                          letterSpacing: 2.0,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Text(
                      snapshot.data!['userName'] ?? "",
                      style: const TextStyle(
                        fontSize: 28.0,
                        letterSpacing: 2.0,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Icon(
                          Icons.email,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            snapshot.data!['userEmail'] ?? "",
                            style: const TextStyle(
                              fontSize: 19.0,
                              letterSpacing: 1.0,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const Divider(
                    color: Colors.blue,
                    height: 60.0,
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    'Phone Number :',
                    style: TextStyle(color: Colors.blue[600], fontSize: 22),
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    snapshot.data!['phoneNumber'] ?? "",
                    style: const TextStyle(
                      fontSize: 19.0,
                    ),
                  ),
                  Expanded(child: Container()),
                  const SizedBox(height: 50.0),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AddAccounts()));
                      },
                      child: Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: const <Widget>[
                          Icon(
                            Icons.add_box,
                            color: Colors.white,
                            size: 24.0,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text("MANAGE ACCOUNTS"),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const UpdateCredentials()));
                          },
                          child: const Text(
                            "CHANGE PASSWORD",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const ChangePhNo()));
                          },
                          child: const Text(
                            "CHANGE PHONE NUMBER",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  )
                ],
              ),
            ) : const CircularProgressIndicator();
          }),
    );
  }
}
