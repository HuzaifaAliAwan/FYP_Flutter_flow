import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'customer_booking_confirmed_box_model.dart';
export 'customer_booking_confirmed_box_model.dart';

class CustomerBookingConfirmedBoxWidget extends StatefulWidget {
  const CustomerBookingConfirmedBoxWidget({super.key});

  @override
  State<CustomerBookingConfirmedBoxWidget> createState() =>
      _CustomerBookingConfirmedBoxWidgetState();
}

class _CustomerBookingConfirmedBoxWidgetState
    extends State<CustomerBookingConfirmedBoxWidget> {
  late CustomerBookingConfirmedBoxModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CustomerBookingConfirmedBoxModel());

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
        color: Color(0xFF08306F),
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
                    'Booking',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Roboto',
                          color: Colors.white,
                          fontSize: 36.0,
                          letterSpacing: 0.0,
                        ),
                  ),
                  Text(
                    'Confirmed',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Roboto',
                          color: Colors.white,
                          fontSize: 36.0,
                          letterSpacing: 0.0,
                        ),
                  ),
                  Icon(
                    Icons.done_all,
                    color: Color(0xFF05650F),
                    size: 50.0,
                  ),
                ].divide(SizedBox(height: 5.0)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
