-- Copyright © 2018–2020 lambda#0987
--
-- CAPTAIN CAPSLOCK is free software: you can redistribute it and/or modify
-- it under the terms of the GNU Affero General Public License as published
-- by the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
--
-- CAPTAIN CAPSLOCK is distributed in the hope that it will be fun,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU Affero General Public License for more details.
--
-- You should have received a copy of the GNU Affero General Public License
-- along with CAPTAIN CAPSLOCK.  If not, see <https://www.gnu.org/licenses/>.

SET TIME ZONE 'UTC';

CREATE TABLE shout (
	chat_id INT8 NOT NULL,
	message_id INT4 NOT NULL,
	content TEXT NOT NULL,
	entities BYTEA[] NOT NULL DEFAULT ARRAY[]::BYTEA[],
	time TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,

	PRIMARY KEY (chat_id, message_id));

CREATE UNIQUE INDEX shout_content_unique_idx ON shout (chat_id, content, entities);

CREATE TABLE opt (
	peer_id INT8 NOT NULL PRIMARY KEY,
	state BOOLEAN NOT NULL);
