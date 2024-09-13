import 'package:flutter/foundation.dart';

int convertListeningTimeToMinutes(String listeningTimeString) {
  try {
    final parts = listeningTimeString.split(':'); // Split by colon
    if (parts.length != 3) {
      throw const FormatException(
          'Invalid listening time format. Expected "HH:MM:SS".');
    }

    final hours = int.parse(parts[0]);
    final minutes = int.parse(parts[1]);
    final seconds = int.parse(parts[2]);

    // Calculate total minutes (round up for seconds)
    return hours * 60 + minutes + (seconds + 30) ~/ 60;
  } on FormatException catch (e) {
    debugPrint('Error parsing listening time: $e');
    return 0; // Handle invalid format by returning 0 minutes (optional)
  } catch (error) {
    debugPrint('Unexpected error: $error');
    return 0; // Handle other unexpected errors by returning 0 minutes (optional)
  }
}

class HomeProvider with ChangeNotifier {
  bool isShortLoading = false;
  bool isBookLoading = false;
  bool isCollectionLoading = false;

  List<bool> showFAQs = [false, false, false, false, false];

  void updateShowFAQsIndex(int index, bool status) {
    showFAQs[index] = status;
    notifyListeners();
  }

  void updateShortLoader(bool value) {
    isShortLoading = value;
    notifyListeners();
  }

  void updateBooksLoader(bool value) {
    isShortLoading = value;
    notifyListeners();
  }

  void updateCollectionLoader(bool value) {
    isShortLoading = value;
    notifyListeners();
  }

  // Future<List<BookModel>> loadBooks() async {
  //   updateBooksLoader(true);
  //   debugPrint("Load Book function running");
  //   try {
  //     final snapshot =
  //         await FirebaseFirestore.instance.collection('Books').get();

  //     if (snapshot.docs.isNotEmpty) {
  //       books = [];
  //       bookIds = [];
  //       debugPrint("got Books");
  //       for (final doc in snapshot.docs) {
  //         final book = BookModel.fromFirestore(doc);
  //         books.add(book);
  //         bookIds.add(book.id);
  //       }
  //       debugPrint('Loaded ${books.length} books!');
  //       updateBooksLoader(false);
  //       return books; // Return the list of loaded books
  //     } else {
  //       updateBooksLoader(false);
  //       debugPrint('No books found in the collection.');
  //       return books; // Return an empty list if no books are found
  //     }
  //   } on FirebaseException catch (e) {
  //     updateBooksLoader(false);
  //     debugPrint('Error loading books: ${e.message}');
  //     // Handle potential Firebase errors (optional)
  //     rethrow; // Re-throw the exception for further handling (optional)
  //   } catch (error) {
  //     updateBooksLoader(false);
  //     debugPrint('Unexpected error: $error');
  //     // Handle other unexpected errors (optional)
  //     rethrow; // Re-throw the exception for further handling (optional)
  //   }
  // }

  // Future<List<Collection>> loadCollections() async {
  //   updateCollectionLoader(true);
  //   debugPrint("Load Collections function running");
  //   try {
  //     final snapshot = await FirebaseFirestore.instance
  //         .collection('Collection')
  //         .get(); // Replace 'collections' with your actual collection name

  //     if (snapshot.docs.isNotEmpty) {
  //       collections = [];
  //       debugPrint("got Collections");
  //       for (final doc in snapshot.docs) {
  //         final collection = Collection.fromFirestore(doc);
  //         debugPrint(
  //             "Collections Mapped"); // Replace 'CollectionNew' with your actual model class name
  //         collections.add(collection);
  //       }
  //       debugPrint('Loaded collections :${collections.length} !');
  //       updateCollectionLoader(false);
  //       return collections;
  //     } else {
  //       updateCollectionLoader(false);
  //       debugPrint('No collections found.');
  //       return collections; // Return an empty list if no collections are found
  //     }
  //   } on FirebaseException catch (e) {
  //     updateCollectionLoader(false);
  //     debugPrint('Error loading collections: ${e.message}');
  //     // Handle potential Firebase errors (optional)
  //     rethrow; // Re-throw the exception for further handling (optional)
  //   } catch (error) {
  //     updateCollectionLoader(false);
  //     debugPrint('Load Collections Unexpected error: $error');
  //     // Handle other unexpected errors (optional)
  //     rethrow; // Re-throw the exception for further handling (optional)
  //   }
  // }

  // Future<List<String>> loadCategories() async {
  //   List<String> categories = [];

  //   try {
  //     QuerySnapshot querySnapshot =
  //         await FirebaseFirestore.instance.collection('BookCategories').get();

  //     for (var doc in querySnapshot.docs) {
  //       String title = doc['title'];
  //       categories.add(title);
  //     }

  //     return categories;
  //   } catch (e) {
  //     debugPrint('Error getting categories: $e');
  //     return [];
  //   }
  // }
}
