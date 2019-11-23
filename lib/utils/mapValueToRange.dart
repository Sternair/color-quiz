int getMappedColorRangeValue(
    {double inputStart,
    double inputEnd,
    double input,
    double outputStart,
    double outputEnd}) {
  return (outputStart +
          ((outputEnd - outputStart) / (inputEnd - inputStart)) *
              (input - inputStart))
      .round();
}
