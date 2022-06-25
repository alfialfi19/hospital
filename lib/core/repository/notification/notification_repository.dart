part of 'base_notification_repository.dart';

class NotificationRepository extends BaseNotificationRepository {
  final BaseApiClient apiClient;
  final String baseUrl;

  NotificationRepository({
    required this.apiClient,
    required this.baseUrl,
  });
}
