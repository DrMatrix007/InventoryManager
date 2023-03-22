import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inventory_manager/providers.dart';

@immutable
class GroupsWidget extends ConsumerWidget {
  const GroupsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dataState = ref.watch(userGroupProvider);
    final state = dataState.value;
    return state != null
        ? ListView.builder(
            itemBuilder: (context, index) {
              return Card(
                  child: ListTile(
                title: Text(state[index].name),
              ));
            },
            itemCount: state.length,
          )
        : (dataState.isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Container());
  }
}
