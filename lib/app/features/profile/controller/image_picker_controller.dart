import 'dart:convert';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:task_manager/app/utils/helper/image_picker_utils.dart';
import 'package:task_manager/app/utils/secure_storage/secure_storage.dart';

class ImagePickerController extends GetxController {
  final ImagePickerUtils imagePickerUtils = ImagePickerUtils();
  final SecureStorage _storage = SecureStorage();
  final Rx<String> selectedImagePath = ''.obs;
  final Rx<double> uploadProgress = 0.0.obs;
  final Rx<String> errorMessage = ''.obs;

  // Reactive variable to hold Base64 image string
  final base64Image = ''.obs;

  // To store the decoded image bytes
  final imageBytes = Rxn<Uint8List>();
  late final String imageId;

  // Reference to Firestore collection
  final CollectionReference<Map<String, dynamic>> collectionRef = FirebaseFirestore.instance.collection('images');

  Future<void> setImageId() async {
    imageId = await _storage.read(key: SSKey.email);
  }

  @override
  void onInit() {
    setImageId();
    fetchImage();
    super.onInit();
  }

  Future<void> pickImageFromCamera() async {
    try {
      XFile? pickedFile = await imagePickerUtils.cameraCapture();
      if (pickedFile != null) {
        selectedImagePath.value = pickedFile.path;
        await uploadImageToFirebase(pickedFile);
      }
    } catch (e) {
      errorMessage(e.toString());
    }
  }

  Future<void> pickImageFromGallery() async {
    try {
      XFile? pickedFile = await imagePickerUtils.galleryImagePicker();
      if (pickedFile != null) {
        selectedImagePath.value = pickedFile.path;
        await uploadImageToFirebase(pickedFile);
      }
    } catch (e) {
      errorMessage(e.toString());
    }
  }

  Future<void> uploadImageToFirebase(imageFile) async {
    // Read file as bytes;

    imageBytes.value = await imageFile.readAsBytes();
    base64Image.value = base64Encode(imageBytes.value!);
    try {
      // Query to check if the image with this ID exists
      final querySnapshot = await collectionRef.where('imageId', isEqualTo: imageId).get();

      if (querySnapshot.docs.isNotEmpty) {
        // Image exists, update the document
        final docId = querySnapshot.docs.first.id; // Get document ID
        await collectionRef.doc(docId).update({
          'image': base64Image.value,
          'uploaded_at': FieldValue.serverTimestamp(),
        });
      } else {
        // Image does not exist, add a new document
        await collectionRef.add({
          'imageId': imageId, // Add the unique image ID
          'image': base64Image.value,
          'uploaded_at': FieldValue.serverTimestamp(),
        });
      }
      await fetchImage();
    } catch (e) {
      rethrow;
    }
  }

  // Fetch image from Firestore
  Future<void> fetchImage() async {
    try {
      final querySnapshot = await collectionRef.where('imageId', isEqualTo: imageId).get();

      if (querySnapshot.docs.isNotEmpty) {
        final dynamic imageData = querySnapshot.docs.first['image'];

        if (imageData is String) {
          // If the data is a Base64-encoded string, decode it
          base64Image.value = imageData;
          imageBytes.value = base64Decode(imageData);
        } else if (imageData is Uint8List) {
          // If the data is already in bytes, use it directly
          imageBytes.value = imageData;
        } else {
          throw Exception('Unexpected image format: ${imageData.runtimeType}');
        }
      } else {
        base64Image('');
      }
    } catch (e) {
      base64Image('');
    }
  }
}
