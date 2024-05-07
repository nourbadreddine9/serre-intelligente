class AnalysePlanteModel {
  int? confidence;
  int? predictedClass;
  String? predictedClassName;

  AnalysePlanteModel(
      {this.confidence, this.predictedClass, this.predictedClassName});

  AnalysePlanteModel.fromJson(Map<String, dynamic> json) {
    confidence = json['confidence'];
    predictedClass = json['predicted_class'];
    predictedClassName = json['predicted_class_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['confidence'] = this.confidence;
    data['predicted_class'] = this.predictedClass;
    data['predicted_class_name'] = this.predictedClassName;
    return data;
  }
}
