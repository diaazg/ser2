abstract class Failure {
   final String errMessage ;

  Failure({required this.errMessage});
} 

class FirebaseFailure extends Failure {
  

  FirebaseFailure({required super.errMessage});

  factory FirebaseFailure.fromCode(String code) {
    switch (code) {
      // Authentication Errors
      case "ERROR_EMAIL_ALREADY_IN_USE":
      case "account-exists-with-different-credential":
      case "email-already-in-use":
        return FirebaseFailure(
          errMessage: "Email already in use. Please try logging in.",
        );
      case "ERROR_WRONG_PASSWORD":
      case "wrong-password":
        return FirebaseFailure(
          errMessage: "Incorrect email/password combination.",
        );
      case "ERROR_USER_NOT_FOUND":
      case "user-not-found":
        return FirebaseFailure(
          errMessage: "No user found with this email.",
        );
      case "ERROR_USER_DISABLED":
      case "user-disabled":
        return FirebaseFailure(
          errMessage: "Your account has been disabled. Please contact support.",
        );
      case "ERROR_TOO_MANY_REQUESTS":
      case "operation-not-allowed":
        return FirebaseFailure(
          errMessage: "Too many login attempts. Please try again later.",
        );
      case "ERROR_INVALID_EMAIL":
      case "invalid-email":
        return FirebaseFailure(
          errMessage: "The email address you entered is invalid.",
        );

      // Database Errors (consider adding more specific error handling here)
      case "permission-denied":
        return FirebaseFailure(
          errMessage: "You don't have permission to access the data.",
        );
      case "data-consistency-error":
      case "disconnected":
      case "invalid-argument":
      case "canceled":
      case "network-error":
      case "unavailable":
        return FirebaseFailure(
          errMessage: "A database error occurred. Please try again later.",
        );

      // Storage Errors (consider adding more specific error handling here)
      case "unauthorized":
      case "object-not-found":
      case "bucket-not-found":
      case "download-canceled":
      case "download-failure":
      case "upload-canceled":
      case "upload-failure":
      case "canceled":
      case "invalid-argument":
      case "network-error":
      case "unavailable":
        return FirebaseFailure(
          errMessage: "A storage error occurred. Please try again later.",
        );

      // Functions Errors (consider adding more specific error handling here)
      case "https-error":
      case "invalid-argument":
      case "unavailable":
      case "internal":
        return FirebaseFailure(
          errMessage: "A function error occurred. Please try again later.",
        );

      // Firestore Errors (consider adding more specific error handling here)
      case "permission-denied":
        return FirebaseFailure(
          errMessage: "You don't have permission to access the Firestore database.",
        );
      // Add more Firestore error handling as needed

      default:
        return FirebaseFailure(
          errMessage: "An unknown error occurred. Please try again later.",
        );
    }
  }
 
}
