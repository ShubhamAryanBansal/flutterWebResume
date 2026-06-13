import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/resume_data.dart';
import '../models/resume_model.dart';

final resumeProvider = Provider<ResumeData>((ref) => resumeData);
