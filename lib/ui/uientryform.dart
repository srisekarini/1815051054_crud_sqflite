import 'package:flutter/material.dart';
import 'package:belajar_sqflite/models/mkontak.dart';

class EntryForm extends StatefulWidget {
  final Contact contact;

  EntryForm(this.contact);

  @override
  EntryFormState createState() => EntryFormState(this.contact);
}
//class controller
class EntryFormState extends State<EntryForm> {
  Contact contact;

  EntryFormState(this.contact);

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController gajiController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //kondisi
    if (contact != null) {
      nameController.text = contact.name;
      phoneController.text = contact.phone;
      gajiController.text = contact.gaji;
    }
    //rubah
    return Scaffold(
        appBar: AppBar(
          title: contact == null ? Text('Add') : Text('Edit'),
          leading: Icon(Icons.keyboard_arrow_left),
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 15.0, left:10.0, right:10.0),
          child: ListView(
            children: <Widget> [
              // nama
              Padding (
                padding: EdgeInsets.only(top:20.0, bottom:20.0),
                child: TextField(
                  controller: nameController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Nama Lengkap',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
                    //
                  },
                ),
              ),

              // telepon
              Padding (
                padding: EdgeInsets.only(top:20.0, bottom:20.0),
                child: TextField(
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: 'Telepon',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
                    //
                  },
                ),
              ),

              Padding (
                padding: EdgeInsets.only(top:20.0, bottom:20.0),
                child: TextField(
                  controller: gajiController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: 'Total Pembelian',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
                    //
                  },
                ),
              ),

              // tombol button
              Padding (
                padding: EdgeInsets.only(top:10.0, bottom:10.0),
                child: Row(
                  children: <Widget> [
                    // tombol simpan
                    Expanded(
                      child: RaisedButton(
                        color: Colors.black,
                        textColor: Colors.limeAccent,
                        child: Text(
                          'Save',
                          textScaleFactor: 1.5,
                        ),
                        onPressed: () {
                          if (contact == null) {
                            // tambah data
                            contact = Contact(nameController.text, phoneController.text, gajiController.text);
                          } else {
                            // ubah data
                            contact.name = nameController.text;
                            contact.phone = phoneController.text;
                            contact.gaji = gajiController.text;
                          }
                          // kembali ke layar sebelumnya dengan membawa objek contact
                          Navigator.pop(context, contact);
                        },
                      ),
                    ),
                    Container(width: 5.0,),
                    // tombol batal
                    Expanded(
                      child: RaisedButton(
                        color: Colors.black,
                        textColor: Colors.limeAccent,
                        child: Text(
                          'Cancel',
                          textScaleFactor: 1.5,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
    );
  }
}