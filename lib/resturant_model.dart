import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NotePage extends StatefulWidget {
  String? docId;
  NotePage({super.key, this.docId});

  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  final TextEditingController editNoteController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.docId != null) {
      loadFunc();
    }
  }

  void loadFunc() async {
    DocumentSnapshot doc = await FirebaseFirestore.instance
        .collection('content')
        .doc(widget.docId)
        .get();

    editNoteController.text = doc['content'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        centerTitle: true,
        title: const Text(
          'Note Page',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              sendDataToFirebase(editNoteController.text);
              editNoteController.clear();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Data added to firebase successfully')),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Write your note here',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextField(
                    controller: editNoteController,
                    maxLines: null,
                    decoration: InputDecoration(
                      hintText: 'Write as you think',

                      hintStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                    ),
                  ),
                ),
                SizedBox(height: 50),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> sendDataToFirebase(String data) async {
    if (data.trim().isEmpty) {
      print('There is no data to send firebase');
      return;
    }

    try {
      FirebaseFirestore firebaseInstance = FirebaseFirestore.instance;

      if (widget.docId == null) {
        // CollectionReference collectionReference = firebaseInstance.collection(
        //   'content',
        // );

        // Map<String, dynamic> noteData = {'content': data};
        //  collectionReference.add(noteData);
        await firebaseInstance.collection('content').add({'content': data});
      } else {
        // Map<String, dynamic> noteData = {'content': data};
        firebaseInstance.collection('content').doc(widget.docId).update({
          'content': data,
        });
      }

      print('Data added to Firebase successfully');
    } catch (e) {
      print('Error: Sending data to Firestore Failed');
    }
  }
}

// Future<void> sendDataToFirebase(String noteText) async {
//   if (noteText.trim().isEmpty) {
//     print("Error: Note Text is empty!");
//     return;
//   }

//   try {
//     final FirebaseFirestore firestoreInstance = FirebaseFirestore.instance;
//     final CollectionReference noteReference = firestoreInstance.collection(
//       'content',
//     );

//     final Map<String, dynamic> noteData = {'content': noteText};
//     await noteReference.add(noteData);

//     print('Data sent successfully');
//   } catch (e) {
//     print('Error: Sending data to Firestore failed');
//   }
// }

// Future<void> sendDataToFirebase(String data) async {
//   if (data.trim().isEmpty) {
//     print('There is no data to send firebase');
//     return;
//   }

//   try {
//     FirebaseFirestore firebaseInstance = FirebaseFirestore.instance;

//     if (Widget.docId) {}
//     CollectionReference collectionReference = firebaseInstance.collection(
//       'content',
//     );

//     Map<String, dynamic> noteData = {'content': data};
//     await collectionReference.add(noteData);

//     print('Data added to Firebase successfully');
//   } catch (e) {
//     print('Error: Sending data to Firestore Failed');
//   }
// }
