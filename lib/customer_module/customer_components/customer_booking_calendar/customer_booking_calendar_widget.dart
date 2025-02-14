import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/customer_module/customer_components/customer_booking_confirmed_box/customer_booking_confirmed_box_widget.dart';
import '/customer_module/customer_components/customer_booking_invalid_box/customer_booking_invalid_box_widget.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'customer_booking_calendar_model.dart';
export 'customer_booking_calendar_model.dart';

class CustomerBookingCalendarWidget extends StatefulWidget {
  const CustomerBookingCalendarWidget({
    super.key,
    required this.propertyId,
    required this.propertyOwnerId,
  });

  final DocumentReference? propertyId;
  final DocumentReference? propertyOwnerId;

  @override
  State<CustomerBookingCalendarWidget> createState() =>
      _CustomerBookingCalendarWidgetState();
}

class _CustomerBookingCalendarWidgetState
    extends State<CustomerBookingCalendarWidget> with TickerProviderStateMixin {
  late CustomerBookingCalendarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CustomerBookingCalendarModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Icon(
              Icons.horizontal_rule,
              color: FlutterFlowTheme.of(context).secondaryText,
              size: 40.0,
            ),
            Expanded(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment(0.0, 0),
                    child: TabBar(
                      labelColor: FlutterFlowTheme.of(context).primaryText,
                      unselectedLabelColor:
                          FlutterFlowTheme.of(context).secondaryText,
                      labelStyle:
                          FlutterFlowTheme.of(context).titleMedium.override(
                                fontFamily: 'Roboto',
                                letterSpacing: 0.0,
                              ),
                      unselectedLabelStyle: TextStyle(),
                      indicatorColor: FlutterFlowTheme.of(context).primary,
                      padding: EdgeInsets.all(4.0),
                      tabs: [
                        Tab(
                          text: 'Check In Date',
                        ),
                        Tab(
                          text: 'Check Out Date',
                        ),
                      ],
                      controller: _model.tabBarController,
                      onTap: (i) async {
                        [() async {}, () async {}][i]();
                      },
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: _model.tabBarController,
                      children: [
                        FlutterFlowCalendar(
                          color: FlutterFlowTheme.of(context).primary,
                          iconColor: FlutterFlowTheme.of(context).secondaryText,
                          weekFormat: false,
                          weekStartsMonday: true,
                          rowHeight: 64.0,
                          onChange: (DateTimeRange? newSelectedDate) {
                            safeSetState(() => _model
                                .inputCheckinDateSelectedDay = newSelectedDate);
                          },
                          titleStyle: FlutterFlowTheme.of(context)
                              .headlineSmall
                              .override(
                                fontFamily: 'Inter',
                                letterSpacing: 0.0,
                              ),
                          dayOfWeekStyle:
                              FlutterFlowTheme.of(context).labelLarge.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                          dateStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Roboto',
                                    letterSpacing: 0.0,
                                  ),
                          selectedDateStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                          inactiveDateStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                          locale: FFLocalizations.of(context).languageCode,
                        ),
                        FlutterFlowCalendar(
                          color: FlutterFlowTheme.of(context).primary,
                          iconColor: FlutterFlowTheme.of(context).secondaryText,
                          weekFormat: false,
                          weekStartsMonday: false,
                          rowHeight: 64.0,
                          onChange: (DateTimeRange? newSelectedDate) {
                            safeSetState(() =>
                                _model.inputCheckoutDateSelectedDay =
                                    newSelectedDate);
                          },
                          titleStyle: FlutterFlowTheme.of(context)
                              .headlineSmall
                              .override(
                                fontFamily: 'Inter',
                                letterSpacing: 0.0,
                              ),
                          dayOfWeekStyle:
                              FlutterFlowTheme.of(context).labelLarge.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                          dateStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Roboto',
                                    letterSpacing: 0.0,
                                  ),
                          selectedDateStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                          inactiveDateStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                          locale: FFLocalizations.of(context).languageCode,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Opacity(
              opacity: 0.8,
              child: Divider(
                thickness: 2.0,
                color: FlutterFlowTheme.of(context).secondaryText,
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                child: FlutterFlowDropDown<String>(
                  controller: _model.dropDownValueController ??=
                      FormFieldController<String>(
                    _model.dropDownValue ??= '2',
                  ),
                  options: ['1', '2', '3', '4', '5', '6', '7', '8'],
                  onChanged: (val) =>
                      safeSetState(() => _model.dropDownValue = val),
                  width: double.infinity,
                  height: 56.0,
                  textStyle: FlutterFlowTheme.of(context).labelSmall.override(
                        fontFamily: 'Roboto',
                        letterSpacing: 0.0,
                      ),
                  hintText: 'No of People',
                  icon: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 24.0,
                  ),
                  fillColor: FlutterFlowTheme.of(context).primaryBackground,
                  elevation: 2.0,
                  borderColor: FlutterFlowTheme.of(context).secondaryText,
                  borderWidth: 2.0,
                  borderRadius: 15.0,
                  margin: EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
                  hidesUnderline: true,
                  isOverButton: true,
                  isSearchable: false,
                  isMultiSelect: false,
                ),
              ),
            ),
            Opacity(
              opacity: 0.8,
              child: Divider(
                thickness: 2.0,
                color: FlutterFlowTheme.of(context).secondaryText,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 20.0, 10.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FFButtonWidget(
                    onPressed: () async {
                      // Close Bottom Sheet
                      Navigator.pop(context);
                    },
                    text: 'Cancel',
                    options: FFButtonOptions(
                      height: 40.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: Colors.white,
                      textStyle: FlutterFlowTheme.of(context)
                          .titleSmall
                          .override(
                            fontFamily: 'Inter',
                            color: FlutterFlowTheme.of(context).secondaryText,
                            letterSpacing: 0.0,
                          ),
                      elevation: 0.0,
                      borderSide: BorderSide(
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  Builder(
                    builder: (context) => FFButtonWidget(
                      onPressed: () async {
                        if (_model.inputCheckinDateSelectedDay!.start >
                            dateTimeFromSecondsSinceEpoch(
                                getCurrentTimestamp.secondsSinceEpoch)) {
                          if ((_model.inputCheckoutDateSelectedDay!.start >
                                  getCurrentTimestamp) &&
                              (_model.inputCheckoutDateSelectedDay!.start >
                                  _model.inputCheckinDateSelectedDay!.end)) {
                            // Bookings
                            _model.previousBookings =
                                await queryBookingRecordOnce(
                              queryBuilder: (bookingRecord) =>
                                  bookingRecord.where(
                                'propertyId',
                                isEqualTo: widget.propertyId,
                              ),
                            );
                            if (functions.isBookingAvailable(
                                _model.inputCheckinDateSelectedDay!.start,
                                _model.inputCheckoutDateSelectedDay!.end,
                                _model.previousBookings!.toList())) {
                              // CreatePropertyBooking

                              await BookingRecord.collection
                                  .doc()
                                  .set(createBookingRecordData(
                                    propertyId: widget.propertyId,
                                    customerId: currentUserReference,
                                    checkInDate: _model
                                        .inputCheckinDateSelectedDay?.start,
                                    checkOutDate: _model
                                        .inputCheckoutDateSelectedDay?.end,
                                    noOfGuests: _model.dropDownValue,
                                    activeStatus: true,
                                    reqApproved: false,
                                    propertyOwnerId: widget.propertyOwnerId,
                                    showInHistoryPropertyOwner: false,
                                    showInHistoryCustomer: false,
                                  ));
                              await showDialog(
                                context: context,
                                builder: (dialogContext) {
                                  return Dialog(
                                    elevation: 0,
                                    insetPadding: EdgeInsets.zero,
                                    backgroundColor: Colors.transparent,
                                    alignment: AlignmentDirectional(0.0, 0.0)
                                        .resolve(Directionality.of(context)),
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.8,
                                      child:
                                          CustomerBookingConfirmedBoxWidget(),
                                    ),
                                  );
                                },
                              );

                              Navigator.pop(context);
                            } else {
                              Navigator.pop(context);
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                enableDrag: false,
                                useSafeArea: true,
                                context: context,
                                builder: (context) {
                                  return Padding(
                                    padding: MediaQuery.viewInsetsOf(context),
                                    child: Container(
                                      height: 300.0,
                                      child: CustomerBookingInvalidBoxWidget(),
                                    ),
                                  );
                                },
                              ).then((value) => safeSetState(() {}));
                            }
                          } else {
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  title: Text('Invalid Check out date'),
                                  content: Text(
                                      'Please select correct check out date'),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(alertDialogContext),
                                      child: Text('Ok'),
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        } else {
                          await showDialog(
                            context: context,
                            builder: (alertDialogContext) {
                              return AlertDialog(
                                title: Text('Invalid Check in date'),
                                content:
                                    Text('Please select correct check in date'),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(alertDialogContext),
                                    child: Text('Ok'),
                                  ),
                                ],
                              );
                            },
                          );
                        }

                        safeSetState(() {});
                      },
                      text: 'Accept',
                      options: FFButtonOptions(
                        height: 40.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: Color(0xFF0080FF),
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Inter',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                ),
                        elevation: 3.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
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
