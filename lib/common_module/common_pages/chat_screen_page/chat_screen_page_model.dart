import '/flutter_flow/flutter_flow_util.dart';
import 'chat_screen_page_widget.dart' show ChatScreenPageWidget;
import 'package:flutter/material.dart';

class ChatScreenPageModel extends FlutterFlowModel<ChatScreenPageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for messagesColumn widget.
  ScrollController? messagesColumn;
  // State field(s) for InputMessage widget.
  FocusNode? inputMessageFocusNode;
  TextEditingController? inputMessageTextController;
  String? Function(BuildContext, String?)? inputMessageTextControllerValidator;

  @override
  void initState(BuildContext context) {
    messagesColumn = ScrollController();
  }

  @override
  void dispose() {
    messagesColumn?.dispose();
    inputMessageFocusNode?.dispose();
    inputMessageTextController?.dispose();
  }
}
