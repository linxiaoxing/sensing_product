-- detection_history テーブルにデータを挿入
INSERT INTO detection_history (begin_time, end_time, last_doc_id) VALUES (1234567890, 1234567899, 'abc123');

INSERT INTO detection_history_items (category, detection_id, detected_location, recording_date, fs_mode_set_tracking_id, detection_tracking_id, begin_time, end_time)
VALUES 
    ('category1', 'id1', 'location1', 1234567890, NULL, NULL, 1234567890, 1234567899),
    ('category2', 'id2', 'location2', 1234567900, NULL, NULL, 1234567890, 1234567899);
