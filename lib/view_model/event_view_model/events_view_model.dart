import 'dart:developer';

import 'package:alleventstask/config/packages/toast/k_toast.dart';
import 'package:alleventstask/config/router/nav_service.dart';
import 'package:alleventstask/domain/models/json_models/categories_model.dart';
import 'package:alleventstask/general_providers.dart';
import 'package:alleventstask/view_model/event_view_model/events_base_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class EventsViewModel with ChangeNotifier implements EventsBaseClass {
  final Ref _ref;
  EventsViewModel(this._ref);

  List<CategoriesModel> _allCategories = [];
  List<CategoriesModel> get allCategories => _allCategories;

  // void configCategories() {
  //   _allCategories = [];
  //   SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
  //     notifyListeners();
  //   });
  // }

  bool _fetchingCategories = true;
  bool get fetchingCategories => _fetchingCategories;

  Future<void> fetchCategories({bool isRefreshing = false}) async {
    _searchedEvents = [];
    _fetchingCategories = true;
    _allCategories = [];
    Response<dynamic>? categoryResponse =
        await _ref.read(eventsProvider).fetchTestCategories();
    if (categoryResponse != null) {
      log(categoryResponse.data!.runtimeType.toString());
      for (var i = 0; i < categoryResponse.data!.length; i++) {
        CategoriesModel temp = CategoriesModel(
          category: categoryResponse.data![i]['category'],
          data: categoryResponse.data[i]['data'],
        );
        _allCategories.add(temp);
        // if (i == 0) { configSelectedCategory(temp); }
      }
      CategoriesModel temp0 = CategoriesModel(
        category: categoryResponse.data![0]['category'],
        data: categoryResponse.data[0]['data'],
      );
      configSelectedCategory(temp0);
      log("All Categories $_allCategories");
    } else {
      _allCategories = [];
    }
    _fetchingCategories = false;

    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      notifyListeners();
    });
    if (isRefreshing) {
      kToast(message: "Events have been refreshed 1 second ago");
    }
  }

  CategoriesModel _selectedCategories =
      const CategoriesModel(category: "", data: "");
  CategoriesModel get selectedCategories => _selectedCategories;

  Future<void> configSelectedCategory(CategoriesModel ccv,
      {bool fromBottomSheet = false}) async {
    _selectedCategories = ccv;
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      notifyListeners();
    });
    if (fromBottomSheet) {
      _ref.read(navProvider).pushBack();
    }
    await fetchEventFromCategory(eventUrl: ccv.data!);
  }

  bool _fetchingEvents = false;
  bool get fetchingEvents => _fetchingEvents;

  List _selectedEvents = [];
  List get selectedEvents => _selectedEvents;

  List _selectedEventsSuggested = [];
  List get selectedEventsSuggested => _selectedEventsSuggested;

  void configSuggestedEvents({required String eventId}) {
    _selectedEventsSuggested = _selectedEvents;
    _selectedEventsSuggested
        .removeWhere((element) => element['event_id'] == eventId);
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      notifyListeners();
    });
  }

  bool _sortedAscending = true;
  bool get sortedAscending => _sortedAscending;

  void sortEvents() {
    if (!_sortedAscending) {
      _sortedAscending = true;
      _searchedEvents.sort(
        (a, b) {
          DateTime first = DateTime.parse(
              DateFormat('MMM d yyyy').parse(a['label']).toString());
          DateTime second = DateTime.parse(
              DateFormat('MMM d yyyy').parse(b['label']).toString());
          return first.compareTo(second);
        },
      );
    } else {
      _sortedAscending = false;
      _searchedEvents.sort(
        (a, b) {
          DateTime first = DateTime.parse(
              DateFormat('MMM d yyyy').parse(a['label']).toString());
          DateTime second = DateTime.parse(
              DateFormat('MMM d yyyy').parse(b['label']).toString());
          return second.compareTo(first);
        },
      );
    }
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      notifyListeners();
    });
  }

  Future<void> fetchEventFromCategory({required String eventUrl}) async {
    _fetchingEvents = true;
    _selectedEvents = [];
    Response<dynamic>? response =
        await _ref.read(eventsProvider).fetchEventFromUrl(eventUrl: eventUrl);
    if (response != null) {
      log("Event Url data: ${response.data!}");
      log("type   : ${response.data!.runtimeType.toString()}");
      _selectedEvents = response.data!['item'];
      sortEvents();
    }
    _fetchingEvents = false;
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      notifyListeners();
    });
  }

  /// searching events
  List _searchedEvents = [];
  List get searchedEvents => _searchedEvents;

  void searchEvents({required TextEditingController querying}) {
    _searchedEvents = [];
    if (querying.text.isEmpty) {
      return;
    }
    List allTemps = _selectedEvents;
    for (Map<String, dynamic> element in allTemps) {
      if (element['eventname']
          .toString()
          .toLowerCase()
          .contains(querying.text.trim().toLowerCase())) {
        _searchedEvents.add(element);
      }
    }

    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      notifyListeners();
    });
  }

  /// view type = grid or list
  int _selectedViewType = 0;
  int get selectedViewType => _selectedViewType;

  void configViewType() {
    if (_selectedViewType == 1) {
      _selectedViewType = 0;
    } else {
      _selectedViewType = 1;
    }
    notifyListeners();
  }

  /// to  view map
  int _isViewingMap = 0;
  int get isViewingMap => _isViewingMap;

  void configMapView({int? vvc}) {
    if (vvc != null) {
      _isViewingMap = vvc;
    } else {
      if (_isViewingMap == 1) {
        _isViewingMap = 0;
      } else {
        _isViewingMap = 1;
      }
    }
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      notifyListeners();
    });
  }

  //////////// maps view

  GoogleMapController? _googleMapController;
  GoogleMapController? get googleMapController => _googleMapController;
  CameraPosition? _kGooglePlex;
  CameraPosition? get kGooglePlex => _kGooglePlex;

  final double _currentLatitude = 0;
  double get currentLatitude => _currentLatitude;

  final double _currentLongitude = 0;
  double get currentLongitude => _currentLongitude;

  Future<void> getInitial(double lat, double long) async {
    // Position value = await Geolocator.getCurrentPosition();
    _kGooglePlex = CameraPosition(
      target: lat == 0 && long == 0
          ? LatLng(_currentLatitude, _currentLongitude)
          : LatLng(lat, long),
      zoom: 5,
    );
  }

  void changeCameraPosition(CameraPosition cameraPositiona) {
    _kGooglePlex = cameraPositiona;
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      notifyListeners();
    });
  }

  void changeController(controller) {
    _googleMapController = controller;
  }

  Future<void> onCameraIdle(BuildContext context) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        _kGooglePlex!.target.latitude,
        _kGooglePlex!.target.longitude,
      );

      // ignore: unused_local_variable
      String completeAddedableAdderess =
          "${placemarks.first.street}, ${placemarks.first.locality}, ${placemarks.first.postalCode}, ${placemarks.first.administrativeArea}";
      // _pinCode = placemarks.first.postalCode.toString();
      // _latitude = _kGooglePlex!.target.latitude;
      // _longitude = _kGooglePlex!.target.longitude;
      // log(_completeAddedableAdderess.toString());
    } catch (e) {
      kToast(message: e.toString()); // "Something went wrong"
      Navigate.instance.pushBack();
    }
    notifyListeners();
  }
}
