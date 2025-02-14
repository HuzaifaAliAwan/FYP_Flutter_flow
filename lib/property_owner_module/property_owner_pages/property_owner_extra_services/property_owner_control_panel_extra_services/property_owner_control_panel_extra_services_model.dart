import '/common_module/common_components/end_drawer_component/end_drawer_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'property_owner_control_panel_extra_services_widget.dart'
    show PropertyOwnerControlPanelExtraServicesWidget;
import 'package:flutter/material.dart';

class PropertyOwnerControlPanelExtraServicesModel
    extends FlutterFlowModel<PropertyOwnerControlPanelExtraServicesWidget> {
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
