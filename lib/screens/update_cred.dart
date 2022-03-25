import 'package:flutter/material.dart';

class UpdateCredentials extends StatefulWidget {
  const UpdateCredentials({Key? key}) : super(key: key);

  @override
  _UpdateCredentialsState createState() => _UpdateCredentialsState();
}

class _UpdateCredentialsState extends State<UpdateCredentials> {
  bool _isObscure = true;
  bool _isObscure1=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 30,
              ),

              const SizedBox(
                height: 30,
              ),
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text('CHANGE PASSWORD',
                    style: TextStyle(
                        fontSize: 20,
                        letterSpacing: 1.5,
                        fontWeight: FontWeight.bold)),
              ),
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text('Current Password :',
                    style: TextStyle(
                      color: Colors.blue[500],
                      fontSize: 22,
                      letterSpacing: 1,
                    )),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  obscureText: _isObscure,

                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter your current password',
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isObscure ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _isObscure = !_isObscure;
                        });
                      },
                    ),
                ),
              ),),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text('New Password :',
                    style: TextStyle(
                      color: Colors.blue[500],
                      fontSize: 22,
                      letterSpacing: 1,
                    )),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  obscureText: _isObscure1,

                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter your current password',
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isObscure1 ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _isObscure1 = !_isObscure1;
                        });
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(18),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        'SAVE CHANGES',
                        style: TextStyle(
                          fontSize: 19,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
    );
  }
}
