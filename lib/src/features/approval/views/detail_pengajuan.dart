import 'package:flutter/material.dart';
import 'package:presensi_gs/utils/components/my_appbar.dart';

class DetailPengajuanView extends StatelessWidget {
  const DetailPengajuanView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar("Detail Pengajuan"),
    );
  }
}
