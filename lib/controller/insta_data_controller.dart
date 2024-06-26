// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import '../models/instagram_model.dart';

// class InstagramController extends GetxController {
//   var instagramData = InstagramResponse(
//     username: '',
//     profilePicture: '',
//     bio: '',
//     followers: 0,
//     following: 0,
//     postsCount: 0,
//     posts: [],
//   ).obs;

//   @override
//   void onInit() {
//     super.onInit();
//     fetchInstagramData();
//   }

//   void fetchInstagramData() async {
//     try {
//       final response = await http.get(Uri.parse('YOUR_API_URL'));

//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
//         instagramData.value = InstagramResponse.fromJson(data);
//       } else {
//         throw Exception('Failed to load data');
//       }
//     } catch (e) {
//       print('Error fetching data: $e');
//     }
//   }
// }
