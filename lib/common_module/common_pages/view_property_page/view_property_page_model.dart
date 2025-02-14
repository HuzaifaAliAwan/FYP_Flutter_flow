import '/backend/backend.dart';
import '/common_module/common_components/end_drawer_component/end_drawer_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'view_property_page_widget.dart' show ViewPropertyPageWidget;
import 'package:flutter/material.dart';

class ViewPropertyPageModel extends FlutterFlowModel<ViewPropertyPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  UsersRecord? propertyOwnerDocument;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  int? previousConversationCount;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  ConversationsRecord? previousConversationDocument;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  ConversationsRecord? newConversationDocument;
  // Model for EndDrawerComponent component.
  late EndDrawerComponentModel endDrawerComponentModel;

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
