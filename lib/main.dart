import 'package:flutter/material.dart';

void main() {
  runApp(ContactApp());
}

class Contact {
  final String name;
  final String email;
  final String phoneNumber;

  Contact({required this.name, required this.email, required this.phoneNumber});
}

class ContactApp extends StatelessWidget {
  final List<Contact> contacts = [
    Contact(
      name: "John Doe",
      email: "john.doe@example.com",
      phoneNumber: "123-456-7890",
    ),
    Contact(
      name: "Jane Smith",
      email: "jane.smith@example.com",
      phoneNumber: "987-654-3210",
    ),
    Contact(
      name: "Alice Johnson",
      email: "alice.johnson@example.com",
      phoneNumber: "555-123-4567",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contact List',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: ContactListScreen(contacts: contacts),
    );
  }
}

class ContactListScreen extends StatelessWidget {
  final List<Contact> contacts;

  const ContactListScreen({required this.contacts});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact List'),
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(contacts[index].name),
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return ContactDetailsSheet(contact: contacts[index]);
                },
              );
            },
          );
        },
      ),
    );
  }
}

class ContactDetailsSheet extends StatelessWidget {
  final Contact contact;

  const ContactDetailsSheet({required this.contact});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Contact Details',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('Name: ${contact.name}'),
            SizedBox(height: 4),
            Text('Email: ${contact.email}'),
            SizedBox(height: 4),
            Text('Phone: ${contact.phoneNumber}'),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Close'),
            ),
          ],
        ),
      ),
    );
  }
}
