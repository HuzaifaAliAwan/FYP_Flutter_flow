import '/common_module/common_components/end_drawer_component/end_drawer_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'property_owner_edit_extra_service_page_widget.dart'
    show PropertyOwnerEditExtraServicePageWidget;
import 'package:flutter/material.dart';

class PropertyOwnerEditExtraServicePageModel
    extends FlutterFlowModel<PropertyOwnerEditExtraServicePageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for EndDrawerComponent component.
  late EndDrawerComponentModel endDrawerComponentModel;
  // State field(s) for InputServiceName widget.
  FocusNode? inputServiceNameFocusNode;
  TextEditingController? inputServiceNameTextController;
  String? Function(BuildContext, String?)?
      inputServiceNameTextControllerValidator;
  // State field(s) for InputServicePrice widget.
  FocusNode? inputServicePriceFocusNode;
  TextEditingController? inputServicePriceTextController;
  String? Function(BuildContext, String?)?
      inputServicePriceTextControllerValidator;

  @override
  void initState(BuildContext context) {
    endDrawerComponentModel =
        createModel(context, () => EndDrawerComponentModel());
  }

  @override
  void dispose() {
    endDrawerComponentModel.dispose();
    inputServiceNameFocusNode?.dispose();
    inputServiceNameTextController?.dispose();

    inputServicePriceFocusNode?.dispose();
    inputServicePriceTextController?.dispose();
  }
}
