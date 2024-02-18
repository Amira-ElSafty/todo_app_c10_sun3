import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app_todo_c10_sun3/model/task.dart';

class FirebaseUtils {
  static CollectionReference<Task> getTasksCollection() {
    return FirebaseFirestore.instance
        .collection(Task.collectionName)
        .withConverter<Task>(
            fromFirestore: ((snapshot, options) =>
                Task.fromFireStore(snapshot.data()!)),
            toFirestore: (task, _) => task.toFireStore());
  }

  static Future<void> addTaskToFireStore(Task task) {
    CollectionReference<Task> taskCollection = getTasksCollection();

    /// collection
    DocumentReference<Task> taskDocRef = taskCollection.doc();
    task.id = taskDocRef.id;

    /// auto id
    return taskDocRef.set(task);
  }

  static Future<void> deleteTaskFromFireStore(Task task) {
    return getTasksCollection().doc(task.id).delete();
  }
}
