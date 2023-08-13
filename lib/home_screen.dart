import 'package:flutter/material.dart';
import 'package:personal_library/db_helper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<Map<String, dynamic>> _allData=[];
  bool _isLoading = true;

  void _refreshData() async{
    final data = await SQLHelper.getAllData();
    setState(() {
      _allData = data;
      _isLoading = false;
    });
  }

  @override
  void initState(){
    super.initState();
    _refreshData();
  }


  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descController = TextEditingController();

  Future<void> _addData() async{
    await SQLHelper.createData(_titleController.text, _descController.text);
    _refreshData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
