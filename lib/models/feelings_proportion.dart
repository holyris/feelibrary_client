class FeelingsProportion {
  final int feelingTypeId;
  final int amount;
  final double proportion;

  FeelingsProportion(this.feelingTypeId, this.amount, this.proportion);

  FeelingsProportion.fromJson(Map<String, dynamic> json)
      : feelingTypeId = json['feelingTypeId'],
        amount = json['amount'],
        proportion = json['proportion'];
}
