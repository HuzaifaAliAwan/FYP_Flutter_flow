import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'customer_booking_calendar_widget.dart'
    show CustomerBookingCalendarWidget;
import 'package:flutter/material.dart';

class CustomerBookingCalendarModel
    extends FlutterFlowModel<CustomerBookingCalendarWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for inputCheckinDate widget.
  DateTimeRange? inputCheckinDateSelectedDay;
  // State field(s) for inputCheckoutDate widget.
  DateTimeRange? inputCheckoutDateSelectedDay;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Firestore Query - Query a collection] action in AcceptButton widget.
  List<BookingRecord>? previousBookings;

  @override
  void initState(BuildContext context) {
    inputCheckinDateSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
    inputCheckoutDateSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
  }

  @override
  void dispose() {
    tabBarController?.dispose();
  }
}
