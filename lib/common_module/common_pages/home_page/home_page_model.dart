import '/backend/backend.dart';
import '/common_module/common_components/end_drawer_component/end_drawer_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for inputSearch widget.
  final inputSearchKey = GlobalKey();
  FocusNode? inputSearchFocusNode;
  TextEditingController? inputSearchTextController;
  String? inputSearchSelectedOption;
  String? Function(BuildContext, String?)? inputSearchTextControllerValidator;
  List<PropertyRecord> simpleSearchResults = [];
  // Model for EndDrawerComponent component.
  late EndDrawerComponentModel endDrawerComponentModel;

  @override
  void initState(BuildContext context) {
    endDrawerComponentModel =
        createModel(context, () => EndDrawerComponentModel());
  }

  @override
  void dispose() {
    inputSearchFocusNode?.dispose();

    endDrawerComponentModel.dispose();
  }
}
