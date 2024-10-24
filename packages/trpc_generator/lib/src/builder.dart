import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'package:trpc_client_generator/src/generator.dart';

Builder generateTRPCRoutes(BuilderOptions options) =>
    SharedPartBuilder([TRPCRoutesBuilder()], "trpc_routes");
