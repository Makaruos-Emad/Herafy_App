String mapOrderStatus(String status) {
  switch (status) {
    case "Pending":
      return "قيد الانتظار";

    case "Accepted":
      return "تم القبول";

    case "InProgress":
      return "قيد التنفيذ";

    case "Completed":
      return "مكتمل";

    case "Cancelled":
      return "ملغي";

    case "Rejected":
      return "مرفوض";

    default:
      return status;
  }
}
