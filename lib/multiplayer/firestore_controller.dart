import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _firestore;

  FirestoreService(this._firestore);

  Future<String> createGame() async {
    var gameRef = await _firestore.collection('games').add({
      'board': List.generate(6, (_) => List.filled(7, 0)),
      'currentPlayer': 1,
      'isActive': true,
    });
    return gameRef.id;
  }

  Stream<DocumentSnapshot> getGameStream(String gameId) {
    return _firestore.collection('games').doc(gameId).snapshots();
  }

  Future<void> makeMove(String gameId, int column, int player) async {
    var gameDoc = _firestore.collection('games').doc(gameId);
    var gameData = await gameDoc.get();

    if (gameData.exists && gameData['isActive']) {
      List<List<int>> board =
          List.from(gameData['board'].map((row) => List<int>.from(row)));

      // Find the first empty spot in the column
      for (int row = 5; row >= 0; row--) {
        if (board[row][column] == 0) {
          board[row][column] = player;
          break;
        }
      }

      await gameDoc.update({
        'board': board,
        'currentPlayer': player == 1 ? 2 : 1,
      });
    }
  }

  Future<void> resetGame(String gameId) async {
    await _firestore.collection('games').doc(gameId).update({
      'board': List.generate(6, (_) => List.filled(7, 0)),
      'currentPlayer': 1,
    });
  }
}
