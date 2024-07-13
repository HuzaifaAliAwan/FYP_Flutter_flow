import '/flutter_flow/flutter_flow_util.dart';
import 'search_property_widget.dart' show SearchPropertyWidget;
import 'package:flutter/material.dart';

class SearchPropertyModel extends FlutterFlowModel<SearchPropertyWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
