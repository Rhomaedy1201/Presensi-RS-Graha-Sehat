import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presensi_gs/src/features/approval/views/pengajuan.dart';
import 'package:presensi_gs/utils/colors.dart';
import 'package:presensi_gs/utils/components/my_style_text.dart';

class ApprovalView extends StatefulWidget {
  const ApprovalView({super.key});

  @override
  State<ApprovalView> createState() => _ApprovalViewState();
}

class _ApprovalViewState extends State<ApprovalView>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cGrey_200,
      appBar: AppBar(
        backgroundColor: cPrimary,
        centerTitle: true,
        title: Text(
          "Approval",
          style: customTextStyle(FontWeight.w500, 20, cBlack),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(55),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 10,
            ),
            child: Container(
              decoration: const BoxDecoration(
                color: cWhite,
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(2.5),
                child: Container(
                  decoration: const BoxDecoration(
                    color: cWhite,
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  child: TabBar(
                    onTap: (value) {
                      print("object");
                    },
                    dividerColor: cWhite,
                    unselectedLabelColor: Colors.black,
                    labelColor: cWhite,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicator: const BoxDecoration(
                      color: cPrimary,
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                    controller: _tabController,
                    tabs: const <Widget>[
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          "Pengajuan",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 10),
                        ),
                      ),
                      Text(
                        "on Progress",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 10),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "Selesai",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 10),
                      ),
                      Text(
                        "Need Approval",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 10),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        physics: const NeverScrollableScrollPhysics(),
        children: const <Widget>[
          Column(
            children: [
              PengajuanComponents(),
            ],
          ),
          Center(
            child: Text("It's rainy here"),
          ),
          Center(
            child: Text("It's sunny here"),
          ),
          Center(
            child: Text("It's sunny here"),
          ),
        ],
      ),
    );
  }
}
