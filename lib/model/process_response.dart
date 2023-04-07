class ProcessResponse{

  final bool success;
  final String message;
  final String code;

  ProcessResponse({required this.message,this.success=false,this.code=''});
}