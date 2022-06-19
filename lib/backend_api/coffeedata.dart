import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../api_data_model/get_coffee_model.dart';
import '../api_data_model/get_single_coffee_model.dart';
import '../database/userBoxController.dart';

class CoffeeData {
  int coffeeShopName =  UserBoxController().shopId;
  String sellerName = UserBoxController().userName;
  String token = UserBoxController().token;
  Future<bool> addCoffee({
    required String coffeeType,
    required String coffeeTaste,
    required String coffeeName,
    required String description,
    required int price,
    required File? imagefile,
  }) async {
    // var stream  = new http.ByteStream(imagefile!.openRead());
    // stream.cast();
    //
    // var length = await imagefile!.length();
    //
    // var uri = Uri.parse('https://fakestoreapi.com/products');
    //
    // var request = new http.MultipartRequest('POST', uri);
    //
    // request.fields['name'] = "$coffeeName" ;
    // request.fields['ratings'] = "0";
    // request.fields['taste'] = "$coffeeTaste";
    // request.fields['coffeeType'] = "$coffeeType";
    // request.fields['description'] = "$description";
    // request.fields['price'] = "23";
    // request.fields['user'] = "$sellerName";
    // request.fields['shopName'] = "$coffeeShopName";
    //
    // var multiport = new http.MultipartFile(
    //     'image',
    //     stream,
    //     length);
    //
    // request.files.add(multiport);
    //
    // var response = await request.send() ;
    http.Response response = await http.post(
        Uri.parse('https://coffee-app-systems.herokuapp.com/add-coffee/'),
        body: {
          "name": "$coffeeName",
          "image": imagefile,
          "ratings": 0,
          "totalUser": 0,
          "taste": "$coffeeTaste",
          "coffeeType": "$coffeeType",
          "description": "$description",
          "price": price,
          "shopName": coffeeShopName,
          "user": "$sellerName"
        },
        headers: {
          "Authorization": "Token $token"
        });
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> update_coffee_data({
    required String coffee_id,
    String? name,
    File? image,
    int? ratings,
    int? total_users,
    String? taste,
    String? coffeeType,
    String? description,
    int? price,
  }) async {
    http.Response response = await http.patch(
        Uri.parse(
            'https://coffee-app-systems.herokuapp.com/update-coffee/$coffee_id/'),
        headers: {
          "Authorization": "Token $token"
        },
        body: {
          "name": "$name",
          "image": image,
          "ratings": ratings,
          "taste": "$taste",
          "coffeeType": "$coffeeType",
          "description": "$description",
          "price": price,
          "user": "$name"
        });
    //is any of the field in this json is null then it doesn't upload the value.by postman
    //testing would visualize the action in real time using
  }

  Future<GetSingleCoffeeModel> get_a_coffe({
    required String coffee_id,
  }) async {
    http.Response response = await http.get(
        Uri.parse(
            'https://coffee-app-systems.herokuapp.com/update-coffee/$coffee_id/'),
        headers: {"Authorization": "Token $token"});
    var a_coffee = GetSingleCoffeeModel.fromJson(jsonDecode(response.body));
    return a_coffee;
  }

  Future get_all_coffee() async {
    http.Response response = await http.get(
        Uri.parse('https://coffee-app-systems.herokuapp.com/get-coffee/'),
        headers: {"Authorization": "Token $token"});
    var coffees = GetAllCoffeeModel.fromJson(jsonDecode(response.body));
    return coffees;
  }
}
