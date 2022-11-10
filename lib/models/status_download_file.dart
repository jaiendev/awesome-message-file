enum StatusFileDownload {
  downloading,
  completed,
  cancel,
  exist,
  none,
}

class StatusFile {
  StatusFileDownload getStatusFile({int? status}) {
    switch (status) {
      case 2:
        return StatusFileDownload.downloading;
      case 3:
        return StatusFileDownload.completed;
      case 5:
        return StatusFileDownload.cancel;
      default:
        return StatusFileDownload.exist;
    }
  }
}
