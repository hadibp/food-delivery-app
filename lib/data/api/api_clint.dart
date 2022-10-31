import 'package:flutter/material.dart';
import 'package:food_delivery/data/constants/apiConstants.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/list_notifier.dart';

class ApiClients extends GetConnect implements GetxController {
  late String token;
  final String appBaseUrl;

  late Map<String, String> _mainheaders;

  ApiClients({required this.appBaseUrl}) {
    baseUrl = appBaseUrl;
    timeout = const Duration(seconds: 30);
    token =  AppConstants.DBTOKEN;
    _mainheaders = {
      'Content-type': 'application/json; charset=UTF-8',
      'Authoization': 'Bearer $token',
    };
  }

  Future<Response> getdata(String uri) async {
    try {
      Response response = await get(uri);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  @override
  Disposer addListener(GetStateUpdate listener) {
    // TODO: implement addListener
    throw UnimplementedError();
  }

  @override
  Disposer addListenerId(Object? key, GetStateUpdate listener) {
    // TODO: implement addListenerId
    throw UnimplementedError();
  }

  @override
  void disposeId(Object id) {
    // TODO: implement disposeId
  }

  @override
  // TODO: implement hasListeners
  bool get hasListeners => throw UnimplementedError();

  @override
  // TODO: implement listeners
  int get listeners => throw UnimplementedError();

  @override
  void notifyChildrens() {
    // TODO: implement notifyChildrens
  }

  @override
  void refresh() {
    // TODO: implement refresh
  }

  @override
  void refreshGroup(Object id) {
    // TODO: implement refreshGroup
  }

  @override
  void removeListener(VoidCallback listener) {
    // TODO: implement removeListener
  }

  @override
  void removeListenerId(Object id, VoidCallback listener) {
    // TODO: implement removeListenerId
  }

  @override
  void update([List<Object>? ids, bool condition = true]) {
    // TODO: implement update
  }
}
