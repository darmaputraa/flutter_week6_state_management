import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/contact.dart';
import '../model/get_contact.dart';

class CreateNewContact extends StatefulWidget {
  const CreateNewContact({Key? key}) : super(key: key);

  @override
  State<CreateNewContact> createState() => _CreateNewContactState();
}

class _CreateNewContactState extends State<CreateNewContact> {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void saveNewContact() {
    final name = nameController.text;
    final phone = phoneController.text;
    if (name.isEmpty && phone.isEmpty) {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    final contactProvider = Provider.of<Contact>(context);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        toolbarHeight: 70,
        centerTitle: true,
        title: const Text(
          'Create New Contact',
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.w900, color: Colors.black),
        ),
        backgroundColor: Colors.amber[600],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(22, 36, 22, 22),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please fill name';
                    }
                    return null;
                  },
                  controller: nameController,
                  onFieldSubmitted: (value) {},
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.people),
                      labelText: "Name",
                      hintText: "Input Name",
                      isDense: true,
                      contentPadding: const EdgeInsets.all(8),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18))),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please fill your phone number';
                    }
                    return null;
                  },
                  controller: phoneController,
                  onFieldSubmitted: (value) {},
                  keyboardType: TextInputType.phone,
                  maxLength: 12,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.phone),
                    labelText: "Phone Number",
                    hintText: "Input Phone Number",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        saveNewContact;

                        /// Activate this code to using SetState
                        // widget.contactList.add(GetContact(
                        //     name: nameController.text,
                        //     phone: phoneController.text));

                        /// Code Using Provider (Add new contact and return to list in Contact Page)
                        contactProvider.add(GetContact(
                            name: nameController.text,
                            phone: phoneController.text));
                        Navigator.pop(context);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.amber,
                    ),
                    child: const Text(
                      'SAVE',
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
