CREATE TABLE IF NOT EXISTS shout (
	hash VARCHAR(100) NOT NULL UNIQUE,
	guild_or_user BIGINT NOT NULL,
	channel BIGINT NOT NULL,
	message BIGINT NOT NULL PRIMARY KEY UNIQUE,
	time TIMESTAMP WITH TIME ZONE DEFAULT (now() AT TIME ZONE 'UTC')
);

-- https://stackoverflow.com/a/26284695/1378440
CREATE OR REPLACE FUNCTION update_time_column()
RETURNS TRIGGER AS $$
BEGIN
	IF row(NEW.hash) IS DISTINCT FROM row(OLD.hash) THEN
		NEW.time = now() AT TIME ZONE 'UTC';
		RETURN NEW;
	ELSE
		RETURN OLD;
	END IF;
END;
$$ language 'plpgsql';

DROP TRIGGER IF EXISTS update_shout_time ON shout;

CREATE TRIGGER update_shout_time
BEFORE UPDATE ON shout
FOR EACH ROW EXECUTE PROCEDURE update_time_column();
