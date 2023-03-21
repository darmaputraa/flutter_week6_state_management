import 'package:flutter/material.dart';
import 'package:flutter_week6_state_management/model/get_contact.dart';

class Contact with ChangeNotifier {
  final List<GetContact> _contacts = [];

  List<GetContact> get contacts => _contacts;

  void add(GetContact contact) {
    _contacts.add(contact);
    notifyListeners();
  }
}
