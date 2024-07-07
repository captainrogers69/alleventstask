// class LocalService {

//   static const String RECENTVIEWEDEVENTS = 'recentlyViewedEventsLocal';


//   /// ===================//[RECENTVIEWEDEVENTS]//================ ///

//   Future<String> fetchRecentViewedEventsFromHive() async {
//     final testTemp = await LocalService.commonBox.get(RECENTVIEWEDEVENTS) ?? "";
//     if (testTemp.runtimeType.toString() == dataTypeStringValidator) {
//       return testTemp;
//     } else {
//       return "";
//     }
//     // String temp = await LocalService.commonBox.get(RECENTVIEWEDEVENTS) ?? "";
//     // log("============================= recent viewed shared ${temp.length}");
//     // return temp;
//   }

//   Future<void> saveRecentViewedEventsToHive(String lCate) async {
//     LocalService.commonBox.put(RECENTVIEWEDEVENTS, lCate);
//   }
// }