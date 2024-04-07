CREATE TABLE IF NOT EXISTS detection_history (
    begin_time BIGINT,
    end_time BIGINT,
    last_doc_id TEXT,
    PRIMARY KEY (begin_time, end_time)
);

CREATE TABLE IF NOT EXISTS detection_history_items (
    category TEXT,
    detection_id TEXT,
    detected_location TEXT,
    recording_date BIGINT,
    fs_mode_set_tracking_id TEXT,
    detection_tracking_id TEXT,
    begin_time BIGINT,
    end_time BIGINT,
    FOREIGN KEY (begin_time, end_time) REFERENCES detection_history (begin_time, end_time)
);
