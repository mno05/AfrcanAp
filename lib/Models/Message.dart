class Messages implements Comparable {
  final String idMessage;
  final String idEx;
  final String idDes;
  final String text;
  final DateTime dateTime;
  const Messages({
    required this.idMessage,
    required this.idEx,
    required this.idDes,
    required this.text,
    required this.dateTime,
  });
  @override
  toString() {
    return "idMessage:${idMessage}--idEx:${idEx}--idDes:${idDes}--text:${text}--dateTime:${dateTime}";
  }

  @override
  int compareTo(other) {
    if (other is Messages) {
      return other.dateTime.compareTo(dateTime);
    }
    return 0;
  }
}
