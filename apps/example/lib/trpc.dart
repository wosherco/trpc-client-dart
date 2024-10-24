import 'package:trpc_client_annotations/trpc_client_annotations.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'trpc.freezed.dart';
part 'trpc.trpc.dart';
part 'trpc.g.dart';

@TrpcGenerator(routesFilePath: "routes.json")
class TrpcClient {}
