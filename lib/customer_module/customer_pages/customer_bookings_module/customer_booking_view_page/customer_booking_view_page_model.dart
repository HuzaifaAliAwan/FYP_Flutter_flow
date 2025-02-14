import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'customer_booking_view_page_widget.dart'
    show CustomerBookingViewPageWidget;
import 'package:flutter/material.dart';

class CustomerBookingViewPageModel
    extends FlutterFlowModel<CustomerBookingViewPageWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for ratingdropdown widget.
  String? ratingdropdownValue;
  FormFieldController<String>? ratingdropdownValueController;
  // Stores action output result for [Validate Form] action in ratingbtn widget.
  bool? ratingFormValidity;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
