import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreDBHelper {
  FirestoreDBHelper._();

  static final FirestoreDBHelper firestoreDBHelper = FirestoreDBHelper._();

  static final FirebaseFirestore db = FirebaseFirestore.instance;

  insertBooks({required Map<String, dynamic> data}) async {
    DocumentSnapshot<Map<String, dynamic>> counter =
        await db.collection("counter").doc("books_counter").get();

    int id = counter['id'];
    int length = counter['length'];

    await db.collection("books").doc("${++id}").set(data);

    await db.collection("counter").doc("books_counter").update({"id": id});

    await db
        .collection("counter")
        .doc("books_counter")
        .update({"length": ++length});
  }

  deleteBoos({required String id}) async {
    await db.collection("books").doc(id).delete();

    DocumentSnapshot<Map<String, dynamic>> counter =
        await db.collection("counter").doc("books_counter").get();

    int length = counter['length'];

    await db
        .collection("counter")
        .doc("books_counter")
        .update({"length": --length});
  }

  update({
    required String id,
    required String author,
    required String bookname,
  }) async {
    await db.collection("authors").doc(id).update({
      "author": author,
      "bookname": bookname,
    });
  }
}
