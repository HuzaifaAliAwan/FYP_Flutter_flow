import '/common_module/common_components/end_drawer_component/end_drawer_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'property_owner_extra_services_view_page_widget.dart'
    show PropertyOwnerExtraServicesViewPageWidget;
import 'package:flutter/material.dart';

class PropertyOwnerExtraServicesViewPageModel
    extends FlutterFlowModel<PropertyOwnerExtraServicesViewPageWidget> {
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
