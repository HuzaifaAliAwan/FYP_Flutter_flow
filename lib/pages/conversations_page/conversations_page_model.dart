import '/flutter_flow/flutter_flow_util.dart';
import 'conversations_page_widget.dart' show ConversationsPageWidget;
import 'package:flutter/material.dart';

class ConversationsPageModel extends FlutterFlowModel<ConversationsPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
