import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'customer_booking_invalid_box_model.dart';
export 'customer_booking_invalid_box_model.dart';

/// I shows when customer try to do invalid Bookings.
class CustomerBookingInvalidBoxWidget extends StatefulWidget {
  const CustomerBookingInvalidBoxWidget({super.key});

  @override
  State<CustomerBookingInvalidBoxWidget> createState() =>
      _CustomerBookingInvalidBoxWidgetState();
}

class _CustomerBookingInvalidBoxWidgetState
    extends State<CustomerBookingInvalidBoxWidget> {
  late CustomerBookingInvalidBoxModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CustomerBookingInvalidBoxModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).error,
        borderRadius: BorderRadius.circular(35.0),
      ),
      child: Align(
        alignment: AlignmentDirectional(0.0, 0.0),
        child: Stack(
          children: [
            Align(
              alignment: AlignmentDirectional(1.0, -1.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 20.0, 0.0),
                child: FlutterFlowIconButton(
                  borderRadius: 20.0,
                  borderWidth: 1.0,
                  buttonSize: 40.0,
                  icon: Icon(
                    Icons.close,
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    size: 24.0,
                  ),
                  onPressed: () async {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Property Is',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Roboto',
                          color: Colors.white,
                          fontSize: 36.0,
                          letterSpacing: 0.0,
                        ),
                  ),
                  Text(
                    'Already Booked',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Roboto',
                          color: Colors.white,
                          fontSize: 36.0,
                          letterSpacing: 0.0,
                        ),
                  ),
                  Text(
                    'On These Days',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Roboto',
                          color: Colors.white,
                          fontSize: 36.0,
                          letterSpacing: 0.0,
                        ),
                  ),
                  Icon(
                    Icons.warning_rounded,
                    color: FlutterFlowTheme.of(context).warning,
                    size: 50.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
