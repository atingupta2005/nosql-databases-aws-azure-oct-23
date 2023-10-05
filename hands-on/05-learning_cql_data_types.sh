source /pyenv/bin/activate
export AWS_DEFAULT_REGION=us-east-1
cqlsh-expansion cassandra.us-east-1.amazonaws.com 9142 --ssl

CREATE KEYSPACE IF NOT EXISTS my_keyspace WITH replication = {'class': 'SimpleStrategy', 'replication_factor': 1} ;
USE my_keyspace;
CREATE TABLE IF NOT EXISTS user ( first_name text, last_name text, title text, PRIMARY KEY (first_name));

CONSISTENCY LOCAL_QUORUM;

# Write a couple of rows, but only if they don't exist already
INSERT INTO user (first_name, last_name, title) VALUES ('Atin', 'Gupta', 'Mr.') IF NOT EXISTS;
INSERT INTO user (first_name, last_name) VALUES ('Parul', 'Rodriguez') IF NOT EXISTS;

#
# UUID examples
#

# Add a unique identifier using a uuid
ALTER TABLE user ADD id uuid;

# Allow Cassandra to auto-assign a uuid
UPDATE user SET id = uuid() WHERE first_name = 'Parul';

# View the id that was set
SELECT first_name, id FROM user WHERE first_name = 'Parul';

#
# Set examples
#

# Add a set to contain email addresses
ALTER TABLE user ADD emails set<text>;

# Add an email address and check that it was added successfully
UPDATE user SET emails = { 'parul@example.com' } WHERE first_name = 'Parul';
SELECT emails FROM user WHERE first_name = 'Parul';

# Add another email address using concatenation
UPDATE user SET emails = emails + {'parul.mcdonald.AZ@gmail.com' } WHERE first_name = 'Parul';
SELECT emails FROM user WHERE first_name = 'Parul';

#
# List examples
#

# Modify the user table to add a list of phone numbers
ALTER TABLE user ADD phone_numbers list<text>;

# Add a phone number for Parul and check that it was added successfully
UPDATE user SET phone_numbers = [ '1-800-999-9999' ] WHERE first_name = 'Parul';
SELECT phone_numbers FROM user WHERE first_name = 'Parul';

# Add a second number by appending it:
UPDATE user SET phone_numbers = phone_numbers + [ '480-111-1111' ] WHERE first_name = 'Parul';
SELECT phone_numbers FROM user WHERE first_name = 'Parul';

# Replace an individual item in the list referenced by its index
UPDATE user SET phone_numbers[1] = '480-111-1111' WHERE first_name = 'Parul';

# Use the subtraction operator to remove a list item matching a specified value
UPDATE user SET phone_numbers = phone_numbers - [ '480-111-1111' ] WHERE first_name = 'Parul';

# Delete a specific item directly using its index
DELETE phone_numbers[0] from user WHERE first_name = 'Parul';

exit