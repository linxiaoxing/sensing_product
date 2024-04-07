CREATE TABLE IF NOT EXISTS detection_history (
    begin BIGINT,
    end BIGINT,
    last_doc_id TEXT,
    PRIMARY KEY (begin, end)
);

CREATE TABLE IF NOT EXISTS detection_history_items (
    category TEXT,
    detection_id TEXT,
    detected_location TEXT,
    recording_date BIGINT,
    fs_mode_set_tracking_id TEXT,
    detection_tracking_id TEXT,
    begin BIGINT,
    end BIGINT,
    FOREIGN KEY (begin, end) REFERENCES detection_history (begin, end)
);
