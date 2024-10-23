
// This file is "trpc_routes.dart"
import 'trpc_annotations.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'trpc_routes.g.dart'; 


@TrpcGeneratorAnnotation(
  jsonFilePath: 'lib/config/routes.json', // Path to your JSON file
)

class TrpcRoutes {}