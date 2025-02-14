import '/common_module/common_components/end_drawer_component/end_drawer_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'property_owner_extra_services_list_page_widget.dart'
    show PropertyOwnerExtraServicesListPageWidget;
import 'package:flutter/material.dart';

class PropertyOwnerExtraServicesListPageModel
    extends FlutterFlowModel<PropertyOwnerExtraServicesListPageWidget> {
  ///  State fields for stateful widgets in this page.

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
