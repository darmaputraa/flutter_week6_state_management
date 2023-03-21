import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/contact.dart';
// import '../model/get_contact.dart';
import 'create_contact_page.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  /// Activate it to using SetState
  // List<GetContact> contacts = [];

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
          'Contacts',
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.w900, color: Colors.black),
        ),
        backgroundColor: Colors.amber[600],
      ),
      body: Container(
          margin: const EdgeInsets.only(top: 12),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: contactProvider.contacts.length,
            itemBuilder: (context, index) {
              return Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  elevation: 1,
                  child: ListTile(
                    dense: true,
                    leading: CircleAvatar(
                      backgroundColor: Colors.amber[600],
                      radius: 24,
                      child: const Icon(
                        Icons.person,
                        color: Colors.black,
                        size: 32,
                      ),
                    ),

                    /// Set State
                    // title: setStateName(index),
                    // subtitle: setStatePhone(index)

                    /// Using Provider
                    title: Text(contactProvider.contacts[index].name,
                        style:
                            const TextStyle(fontSize: 26, color: Colors.black)),
                    subtitle: Text(
                      contactProvider.contacts[index].phone,
                      style: const TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(223, 136, 126, 126)),
                    ),
                  ));
            },
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          /// Using Set State
          // Navigator.of(context)
          //     .push(MaterialPageRoute<List<GetContact>>(
          //         builder: (_) => CreateNewContact(
          //               contactList: contacts,
          //             )))
          //     .then((updateContact) {
          //   setState(() {
          //     contacts = updateContact ?? [];
          //   });
          // });

          /// Using Provider
          Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const CreateNewContact()));
        },
        backgroundColor: Colors.amber[600],
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
    );
  }

  /// Activate this code to using SetState
  /// Name Title
  // Text setStateName(int index) {
  //   return Text(
  //     contacts[index].name.toString(),
  //     style: const TextStyle(fontSize: 26, color: Colors.black),
  //   );
  // }

  /// Activate this code to using SetState
  /// Phone Subtitle
  // Text setStatePhone(int index) {
  //   return Text(
  //     contacts[index].phone.toString(),
  //     style: const TextStyle(
  //         fontSize: 20, color: Color.fromARGB(223, 136, 126, 126)),
  //   );
  // }
}
