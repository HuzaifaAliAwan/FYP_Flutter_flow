import '/flutter_flow/flutter_flow_util.dart';
import 'view_property_widget.dart' show ViewPropertyWidget;
import 'package:flutter/material.dart';

class ViewPropertyModel extends FlutterFlowModel<ViewPropertyWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
