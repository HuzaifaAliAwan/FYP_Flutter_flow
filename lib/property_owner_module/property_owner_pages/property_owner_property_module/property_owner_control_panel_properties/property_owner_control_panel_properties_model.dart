import '/common_module/common_components/end_drawer_component/end_drawer_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'property_owner_control_panel_properties_widget.dart'
    show PropertyOwnerControlPanelPropertiesWidget;
import 'package:flutter/material.dart';

class PropertyOwnerControlPanelPropertiesModel
    extends FlutterFlowModel<PropertyOwnerControlPanelPropertiesWidget> {
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
