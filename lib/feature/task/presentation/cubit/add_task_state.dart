part of 'add_task_cubit.dart';


sealed class AddTaskState {}

final class AddTaskInitial extends AddTaskState {}

final class AddTaskLoadingl extends AddTaskState {}
final class AddTaskSuccess extends AddTaskState {}
final class AddTaskError extends AddTaskState {}
/////////////

final class StartTimeLoadingl extends AddTaskState {}
final class StartTimeSuccess extends AddTaskState {}
final class StartTimeError extends AddTaskState {}
/////////////

final class EndTimeLoadingl extends AddTaskState {}
final class EndTimeSuccess extends AddTaskState {}
final class EndTimeError extends AddTaskState {}
/////////////

final class ChechState extends AddTaskState {}


////////////////*
final class InsertLoading extends AddTaskState {}
final class InsertSuccess extends AddTaskState {}
final class InsertError extends AddTaskState {}
////////////////*

final class GettasksLoading extends AddTaskState {}
final class GettasksSuccess extends AddTaskState {}
final class GettasksError extends AddTaskState {}
////////////////*


final class UpdatetasksLoading extends AddTaskState {}
final class UpdatetasksSuccess extends AddTaskState {}
final class UpdatetasksError extends AddTaskState {}
////////////////*
final class DeletetasksLoading extends AddTaskState {}
final class DeletetasksSuccess extends AddTaskState {}
final class DeletetasksError extends AddTaskState {}
//////////*
final class GetDateLoading extends AddTaskState {}
final class GetDateSuccess extends AddTaskState {}