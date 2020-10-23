import 'package:flutter/material.dart';
import 'package:flutterapp/utils/AppMethods.dart';
import 'package:flutterapp/utils/AppTextStyles.dart';
import 'package:flutterapp/widgets/AppWidgets.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class MainForm extends StatefulWidget {
  @override
  _MainFormState createState() => _MainFormState();
}

class _MainFormState extends State<MainForm> {
  final singleFormKey = GlobalKey<FormState>();
  final _firstNameController = new TextEditingController();
  final _lastNameController = new TextEditingController();
  final _emailController = new TextEditingController();
  final _socialController = new TextEditingController();
  final _userNameController = new TextEditingController();

  TextEditingController _followerController;

  int _value = 1;
  bool autoValidation = false;
  String followers = '-';

  @override
  void initState() {
    // TODO: implement initState
    _followerController = TextEditingController(text: followers);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Regiter'),
      ),
      body: _buildScreenWidgets(),
    );
  }

  Widget _buildScreenWidgets() {
    return SingleChildScrollView(
      child: Container(
        child: Form(
          key: singleFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _firstNameWidget(),
              _lastNameWidget(),
              _emailWidget(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _textLabel('social Media Category'),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: _dropdown(),
                  ),
                ],
              ),
              _userNameWidget(),
              _followerWidget(context),
              AppWidgets.spacingWidget(20),
              Center(child: _registerButton(context)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _firstNameWidget() {
    return Container(
      margin: const EdgeInsets.only(
        left: 15,
        right: 15,
        top: 10,
      ),
      child: TextFormField(
        textCapitalization: TextCapitalization.sentences,
        controller: _firstNameController,
        autovalidate: autoValidation,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.next,
        validator: (value) {
          return AppMethods.validate(value, "Name");
        },
        decoration: InputDecoration(
          labelText: 'Full Name',
          hintText: 'Enter your Name',
          suffixIcon: Icon(Icons.person),
        ),
      ),
    );
  }

  Widget _lastNameWidget() {
    return Container(
      margin: const EdgeInsets.only(
        left: 15,
        right: 15,
        top: 10,
      ),
      child: TextFormField(
        textCapitalization: TextCapitalization.sentences,
        controller: _lastNameController,
        autovalidate: autoValidation,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.next,
        validator: (value) {
          return AppMethods.validate(value, "last name");
        },
        decoration: InputDecoration(
          labelText: 'Last Name',
          hintText: 'Enter your Last Name',
          suffixIcon: Icon(Icons.person_outline),
        ),
      ),
    );
  }

  Widget _emailWidget() {
    return Container(
      margin: const EdgeInsets.only(
        left: 15,
        right: 15,
        top: 10,
      ),
      child: TextFormField(
        textCapitalization: TextCapitalization.sentences,
        controller: _emailController,
        autovalidate: autoValidation,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.next,
        validator: (value) {
          return AppMethods.validate(value, "Email");
        },
        decoration: InputDecoration(
          labelText: 'Email',
          hintText: 'Enter your email',
          suffixIcon: Icon(Icons.email),
        ),
      ),
    );
  }

  Widget _textLabel(String title) {
    return Container(
      padding: EdgeInsets.only(left: 15, top: 10),
      child: new Text(
        title,
        style: AppTextStyles.appTextStyle(
            color: Colors.black, fontWeight: FontWeight.w600, fontSize: 18),
      ),
    );
  }

  Widget _dropdown() {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: DropdownButton(
          value: _value,
          items: [
            DropdownMenuItem(
              child: _dropdownItem('Instagram', Icons.info),
              value: 1,
            ),
          ],
          onChanged: (value) {
            setState(() {
              _value = value;
            });
          }),
    );
  }

  Widget _dropdownItem(String title, IconData iconData) {
    return Container(
      child: Row(
        children: [
          Icon(iconData),
          Text(
            title,
            style: AppTextStyles.appTextStyle(
                fontSize: 16, fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }

  Widget _userNameWidget() {
    return Container(
      margin: const EdgeInsets.only(
        left: 15,
        right: 15,
        top: 10,
      ),
      child: TextFormField(
        textCapitalization: TextCapitalization.sentences,
        controller: _userNameController,
        autovalidate: autoValidation,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.next,
        validator: (value) {
          return AppMethods.validate(value, "UserName");
        },
        decoration: InputDecoration(
          labelText: 'Username',
          hintText: 'Enter your username',
          suffixIcon: Icon(Icons.person_outline),
        ),
      ),
    );
  }

  Widget _followersWidget() {
    return Container(
      width: MediaQuery.of(context).size.width * .7,
      margin: const EdgeInsets.only(
        left: 15,
        right: 15,
        top: 10,
      ),
      child: TextFormField(
        textCapitalization: TextCapitalization.sentences,
        controller: _followerController,
        autovalidate: autoValidation,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.next,
        validator: (value) {
          return AppMethods.validate(value, "Name");
        },
        decoration: InputDecoration(
          labelText: 'Followers',
          suffixIcon: Icon(Icons.person_outline),
        ),
      ),
    );
  }

  Widget _followerWidget(BuildContext context) {
    return Row(
      children: [
        _followersWidget(),
        _createFetchButton(context),
      ],
    );
  }

  Future<dynamic> getFollowersButton(String username) async {
    final url = 'https://www.instagram.com/$username/?__a=1';

    final response = await http.get(url);

    if (response.statusCode == 200) {
      var responseJson = json.decode(response.body.toString());
      var user = responseJson['graphql']['user'];
      var edge_followed_by = user['edge_followed_by'];
      var count = edge_followed_by['count'];

      print(count);

      followers = count.toString();
      print(followers);
      setState(() {
        followers = count.toString();
        _followerController.text = followers;
      });
    } else {
      throw Exception('Failed to load post');
    }
  }

  getfollowers(String name) {
    getFollowersButton(name);
  }

  Widget _createFetchButton(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.green.withOpacity(0.1),
          spreadRadius: 0,
          blurRadius: 0,
          offset: Offset(0, 3), // changes position of shadow
        ),
      ]),
      width: MediaQuery.of(context).size.width * 0.2,
      child: new RaisedButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          padding: const EdgeInsets.all(12),
          onPressed: () {
            if (_userNameController.text.toString().isEmpty) {
              AppWidgets.emptyErrorDialog(context, 'Usernamee');
            } else {
              getfollowers(_userNameController.text.toString());
            }
          },
          color: Colors.green,
          child: new Text(
            'check',
            style: AppTextStyles.appTextStyle(
                fontSize: 18, fontWeight: FontWeight.w300, color: Colors.white),
          )),
    );
  }

  Widget _registerButton(BuildContext context) {
    return AppWidgets.appButton(
        context: context, voidCallback: () => showdialog(), title: 'Register');
  }

  void showdialog() {
    if (_emailController.text.toString().isEmpty) {
      AppWidgets.emptyErrorDialog(context, 'email');
    } else {
      AppWidgets.showErrorDialog(context,
          'your are succesfully registerd. wwe have sent you mail to ${_emailController.text}');
    }
  }
}
