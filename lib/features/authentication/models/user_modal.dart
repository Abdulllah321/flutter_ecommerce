import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:t_store/utils/formatters/formatter.dart';

class UserModel {
  final String id;
  String firstName;
  String lastName;
  final String username;
  final String email;
  String phoneNumber;
  String profilePicture;
  String? gender; // Nullable gender
  DateTime? dob; // Nullable dob

  /// **Constructor**
  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.profilePicture,
    this.gender,
    this.dob,
  });

  /// **Helper function to get the full name**
  String get fullName => "$firstName $lastName";

  /// **Helper function to format phone number**
  String get formattedPhoneNumber => TFormatter.formatPhoneNumber(phoneNumber);

  /// **Helper function to format DOB (Returns 'Not Provided' if null)**
  String get formattedDOB => dob != null ? TFormatter.formatDate(dob!) : "Not Provided";

  /// **Static function to generate a username from full name**
  static String generateUsername(String fullName) {
    List<String> nameParts = fullName.split(" ");
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";
    return "cat_$firstName$lastName"; // Prefix "cat_"
  }

  /// **Static function to create an empty user model**
  static UserModel empty() {
    return UserModel(
      id: "",
      firstName: "",
      lastName: "",
      username: "",
      email: "",
      phoneNumber: "",
      profilePicture: "",
      gender: null, // Gender is optional
      dob: null, // Keep null instead of a default date
    );
  }

  /// **Static function to split full name into first and last name**
  static List<String> nameParts(String fullName) {
    return fullName.split(" ");
  }

  /// **Convert model to JSON structure for Firebase**
  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'username': username,
      'email': email,
      'phoneNumber': phoneNumber,
      'profilePicture': profilePicture,
      'gender': gender, // Can be null
      'dob': dob != null ? DateFormat("dd MMM yyyy").format(dob!) : null,
    };
  }


  /// **Factory method to create a `UserModel` from Firebase document snapshot**
  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data();
    if (data != null) {
      return UserModel(
        id: document.id,
        firstName: data['firstName'] ?? '',
        lastName: data['lastName'] ?? '',
        username: data['username'] ?? '',
        email: data['email'] ?? '',
        phoneNumber: data['phoneNumber'] ?? '',
        profilePicture: data['profilePicture'] ?? '',
        gender: data['gender'], // Nullable
        dob: data['dob'] != null ? DateTime.tryParse(data['dob']) : null, // Handle parsing safely
      );
    }
    return UserModel.empty();
  }
}
