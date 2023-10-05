source /pyenv/bin/activate
export AWS_DEFAULT_REGION=us-east-1
cqlsh-expansion cassandra.us-east-1.amazonaws.com 9142 --ssl

CREATE KEYSPACE IF NOT EXISTS my_keyspace WITH replication = {'class': 'SimpleStrategy', 'replication_factor': 1} ;
USE my_keyspace;
CREATE TABLE IF NOT EXISTS user ( first_name text, last_name text, title text, PRIMARY KEY (first_name));

# Write a couple of rows, but only if they don't exist already
INSERT INTO user (first_name, last_name, title) VALUES ('Bill', 'Nguyen', 'Mr.') IF NOT EXISTS;
INSERT INTO user (first_name, last_name) VALUES ('Mary', 'Rodriguez') IF NOT EXISTS;

#
# UUID examples
#

# Add a unique identifier using a uuid
ALTER TABLE user ADD id uuid;

# Allow Cassandra to auto-assign a uuid
UPDATE user SET id = uuid() WHERE first_name = 'Mary';

# View the id that was set
SELECT first_name, id FROM user WHERE first_name = 'Mary';

#
# Set examples
#

# Add a set to contain email addresses
ALTER TABLE user ADD emails set<text>;

# Add an email address and check that it was added successfully
UPDATE user SET emails = { 'mary@example.com' } WHERE first_name = 'Mary';
SELECT emails FROM user WHERE first_name = 'Mary';

# Add another email address using concatenation
UPDATE user SET emails = emails + {'mary.mcdonald.AZ@gmail.com' } WHERE first_name = 'Mary';
SELECT emails FROM user WHERE first_name = 'Mary';

#
# List examples
#

# Modify the user table to add a list of phone numbers
ALTER TABLE user ADD phone_numbers list<text>;

# Add a phone number for Mary and check that it was added successfully
UPDATE user SET phone_numbers = [ '1-800-999-9999' ] WHERE first_name = 'Mary';
SELECT phone_numbers FROM user WHERE first_name = 'Mary';

# Add a second number by appending it:
UPDATE user SET phone_numbers = phone_numbers + [ '480-111-1111' ] WHERE first_name = 'Mary';
SELECT phone_numbers FROM user WHERE first_name = 'Mary';

# Replace an individual item in the list referenced by its index
UPDATE user SET phone_numbers[1] = '480-111-1111' WHERE first_name = 'Mary';

# Use the subtraction operator to remove a list item matching a specified value
UPDATE user SET phone_numbers = phone_numbers - [ '480-111-1111' ] WHERE first_name = 'Mary';

# Delete a specific item directly using its index
DELETE phone_numbers[0] from user WHERE first_name = 'Mary';


#
# Index examples
#

# Query based on a non-primary key column
# Why doesn't this work?
SELECT * FROM user WHERE last_name = 'Nguyen';

# Create a secondary index for the last_name column.
CREATE INDEX ON user ( last_name );

# Now try the query again
SELECT * FROM user WHERE last_name = 'Nguyen';

# View the output of the describe command to see the full index definition
# We didn't name the index, so Cassandra assigned a default name
DESCRIBE KEYSPACE;

# Create indexes on other attributes if desired, even collections
# Note that queries based on indexes are typically more expensive, as they involve talking to more nodes
CREATE INDEX ON user ( addresses );
CREATE INDEX ON user ( emails );
CREATE INDEX ON user ( phone_numbers );

# Drop indexes we no longer want maintained
DROP INDEX user_last_name_idx;
DROP INDEX user_addresses_idx;
DROP INDEX user_emails_idx;
DROP INDEX user_phone_numbers_idx;
