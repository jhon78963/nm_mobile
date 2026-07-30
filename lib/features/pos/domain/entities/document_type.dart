enum DocumentType {
  ticketInterno('TICKET_INTERNO'),
  boleta('BOLETA'),
  factura('FACTURA');

  const DocumentType(this.apiValue);

  final String apiValue;

  static const defaultSerie = {
    DocumentType.boleta: 'B001',
    DocumentType.factura: 'F001',
  };

  String get serie => defaultSerie[this] ?? '';
}
