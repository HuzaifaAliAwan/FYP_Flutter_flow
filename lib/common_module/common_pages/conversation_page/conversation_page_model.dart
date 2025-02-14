import '/backend/backend.dart';
import '/common_module/common_components/end_drawer_component/end_drawer_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'conversation_page_widget.dart' show ConversationPageWidget;
import 'package:flutter/material.dart';

class ConversationPageModel extends FlutterFlowModel<ConversationPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for EndDrawerComponent component.
  late EndDrawerComponentModel endDrawerComponentModel;
  // Stores action output result for [Backend Call - Read Document] action in userList widget.
  UsersRecord? customerDocument;
  // Stores action output result for [Backend Call - Read Document] action in userList widget.
  UsersRecord? propertyOwnerDocument;

  @override
  void initState(BuildContext context) {
    endDrawerComponentModel =
        createModel(context, () => EndDrawerComponentModel());
  }

  @override
  void dispose() {
    endDrawerComponentModel.dispose();
  }
}
