import 'package:closor/bloc/LeadChnage/lead_change_bloc.dart';
import 'package:closor/bloc/LeadChnage/lead_change_event.dart';
import 'package:closor/bloc/LeadChnage/lead_change_state.dart';
import 'package:closor/bloc/lead/leads_bloc.dart';
import 'package:closor/bloc/lead/leads_event.dart';
import 'package:closor/helper/launhers.dart';
import 'package:closor/helper/navigator.dart';
import 'package:closor/model/lead.dart';
import 'package:closor/model/leads_model.dart';
import 'package:closor/model/qualified.dart';
import 'package:closor/model/user.dart';
import 'package:closor/routes.dart';
import 'package:closor/widgets/snakBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../constants.dart';
import 'm_slidable/slidable.dart';
import 'm_slidable/slidable_action_pane.dart';
import 'm_slidable/slide_action.dart';

class LeadsCardsWidget extends StatelessWidget {
  Lead lead;

  LeadsCardsWidget({this.lead});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LeadChangeBLoc>(
      create: (context) => LeadChangeBLoc(),
      child: InkWell(
          onTap: () {
            pushNameWithArguments(context, LEAD_INFO, lead);
          },
          child: BlocConsumer<LeadChangeBLoc, LeadChangeState>(
            listener: (context, state) {
              if (state is LeadChangeUninitialized) {} else
              if (state is LeadChangeSuccess) {
                LeadsBloc leadsBloc = BlocProvider.of(context);
                leadsBloc.add(LeadChange(qualified: state.qualified));
                return showSnackBar(context, state.qualified.message ?? '');
              } else if (state is LeadChangeFailed) {
                return showSnackBar(context, state.error ?? '');
              }
            },
            builder: (context, state) {
              LeadChangeBLoc leadChangeBLoc = BlocProvider.of(context);
              return buildSlidable(context, state, leadChangeBLoc);
            },
          )),
    );
  }

  Widget buildSlidable(BuildContext context, LeadChangeState state,
      LeadChangeBLoc leadChangeBLoc) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Slidable(
        actionPane: SlidableScrollActionPane(),
        actionExtentRatio: 0.25,
        actions: <Widget>[
          IconSlideAction(
            caption: 'Unqualified',
            color: Colors.red,
            icon: Icons.thumb_down,
            onTap: () {
              leadChangeBLoc.add(
                LeadChangeQualifiedPressed(
                  qualified: Qualified.changeState(2, lead.id),
                ),
              );
            },
          ),
          IconSlideAction(
            caption: 'Qualified',
            color: Colors.green[500],
            icon: Icons.thumb_up,
            onTap: () {
              leadChangeBLoc.add(
                LeadChangeQualifiedPressed(
                  qualified: Qualified.changeState(1, lead.id),
                ),
              );
            },
          ),
        ],
        secondaryActions: <Widget>[
          IconSlideAction(
            caption: 'Whatsapp',
            color: Colors.blue,
            iconWidget: SvgPicture.asset(
              "assets/icons/whats.svg",
              height: 25,
              width: 25,
              color: Colors.white,
            ),
            onTap: () => MLaucher.openWhatsApp(lead.phone)
            ,
          ),
          IconSlideAction(
            caption: 'Email',
            foregroundColor: Colors.white,
            color: Colors.yellow[700],
            iconWidget: SvgPicture.asset(
              "assets/icons/email.svg",
              height: 25,
              width: 25,
              color: Colors.white,
            ),
            onTap: () {
              MLaucher.sendMail(lead.email);
            },
          ),
          IconSlideAction(
            caption: 'Call',
            color: Colors.green[500],
            iconWidget: SvgPicture.asset(
              "assets/icons/fastCallIcon.svg",
              height: 25,
              width: 25,
              color: Colors.white,
            ),
            onTap: () {
              MLaucher.makePhoneCall(lead.phone);
            },
          ),
        ],
        child: Card(
          margin: EdgeInsets.all(0),
          child: Row(
//          crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Container(
                  height: 100.0,
                  width: 10,
                  color: Theme
                      .of(context)
                      .accentColor,
                ),
              ),
              SizedBox(width: 5,),
              Expanded(
                child: Container(
                  // elevation: 2,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 8,),

                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.asset(
                              lead.status == 2
                                  ? 'assets/icons/red_like.svg'
                                  : "assets/icons/grey_like.svg",
                              height: 12,
                              color: getStatusColor(),
                              width: 12,
                            ),
                          ),
                          Text(
                            lead.name ?? '',
                            style:
                            kTextStyle.copyWith(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      Padding(
                        padding:
                        const EdgeInsets.only(bottom: 15, top: 1, left: 5),
                        child: Row(
                          children: [
                            Text(
                              "Product:  ",
                              style: kTextStyle.copyWith(color: Colors.grey[500]),
                            ),
                            Text(
                              lead.product?.title ?? '',
                              style: kTextStyle.copyWith(
                                  fontWeight: FontWeight.bold),
                            ),
                            Spacer(),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 18,
                              color: Colors.grey[700],
                            ),
                            SizedBox(width: 5,),

                            // Padding(
                            //   padding: const EdgeInsets.only(left: 70),
                            //   child: SvgPicture.asset(
                            //     "assets/icons/Shape.svg",
                            //     height: 20,
                            //     width: 20,
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          SizedBox(width: 4),
                          Text(
                            "Source:  ",
                            style: kTextStyle.copyWith(color: Colors.grey[500]),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: getStatusColor(),
                                borderRadius: BorderRadius.circular(4)
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 3
                            ),
                            child: Text(
                              '${lead.source?.name}',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          Spacer(),
                          Flexible(
                            child: Text(
                              ' Submitted on ${lead.created_at?.substring(0,11)}',
//                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                              style: kTextStyle.copyWith(fontSize: 10),
                            ),
                          ),
                          SizedBox(
                            width: 4,
                          )
                        ],
                      ),
                      SizedBox(height: 8,)
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Color getStatusColor() {
    if (lead.status == 1) {
      return Colors.green;
    } else if (lead.status == 2) {
      return Colors.red;
    }
    return Colors.grey;
  }
}
