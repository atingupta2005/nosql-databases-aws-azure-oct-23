## The Cassandra Query Language (CQL)

- CQL offers a model similar to SQL
- The data is stored in tables containing rows of columns
- For that reason, when used in this document, these terms (tables, rows and columns) have the same definition that they have in SQL.

### Data Types - Native types

<table class="tableblock frame-all grid-all stretch">
<colgroup>
<col style="width: 33.3333%;">
<col style="width: 33.3333%;">
<col style="width: 33.3334%;">
</colgroup>
<thead>
</thead>
<tbody>
<tr>
<td class="tableblock halign-left valign-top"><p class="tableblock"><code>ascii</code></p></td>
<td class="tableblock halign-left valign-top"><p class="tableblock"><code>string</code></p></td>
<td class="tableblock halign-left valign-top"><p class="tableblock">ASCII character string</p></td>
</tr>
<tr>
<td class="tableblock halign-left valign-top"><p class="tableblock"><code>bigint</code></p></td>
<td class="tableblock halign-left valign-top"><p class="tableblock"><code>integer</code></p></td>
<td class="tableblock halign-left valign-top"><p class="tableblock">64-bit signed long</p></td>
</tr>
<tr>
<td class="tableblock halign-left valign-top"><p class="tableblock"><code>blob</code></p></td>
<td class="tableblock halign-left valign-top"><p class="tableblock"><code>blob</code></p></td>
<td class="tableblock halign-left valign-top"><p class="tableblock">Arbitrary bytes (no validation)</p></td>
</tr>
<tr>
<td class="tableblock halign-left valign-top"><p class="tableblock"><code>boolean</code></p></td>
<td class="tableblock halign-left valign-top"><p class="tableblock"><code>boolean</code></p></td>
<td class="tableblock halign-left valign-top"><p class="tableblock">Either <code>true</code> or <code>false</code></p></td>
</tr>
<tr>
<td class="tableblock halign-left valign-top"><p class="tableblock"><code>counter</code></p></td>
<td class="tableblock halign-left valign-top"><p class="tableblock"><code>integer</code></p></td>
<td class="tableblock halign-left valign-top"><p class="tableblock">Counter column (64-bit signed value). See <code>counters</code> for details.</p></td>
</tr>
<tr>
<td class="tableblock halign-left valign-top"><p class="tableblock"><code>date</code></p></td>
<td class="tableblock halign-left valign-top"><p class="tableblock"><code>integer</code>, <code>string</code></p></td>
<td class="tableblock halign-left valign-top"><p class="tableblock">A date (with no corresponding time value). See <code>dates</code> below for details.</p></td>
</tr>
<tr>
<td class="tableblock halign-left valign-top"><p class="tableblock"><code>decimal</code></p></td>
<td class="tableblock halign-left valign-top"><p class="tableblock"><code>integer</code>, <code>float</code></p></td>
<td class="tableblock halign-left valign-top"><p class="tableblock">Variable-precision decimal</p></td>
</tr>
<tr>
<td class="tableblock halign-left valign-top"><p class="tableblock"><code>double</code></p></td>
<td class="tableblock halign-left valign-top"><p class="tableblock"><code>integer</code> <code>float</code></p></td>
<td class="tableblock halign-left valign-top"><p class="tableblock">64-bit IEEE-754 floating point</p></td>
</tr>
<tr>
<td class="tableblock halign-left valign-top"><p class="tableblock"><code>duration</code></p></td>
<td class="tableblock halign-left valign-top"><p class="tableblock"><code>duration</code>,</p></td>
<td class="tableblock halign-left valign-top"><p class="tableblock">A duration with nanosecond precision. See <code>durations</code> below for details.</p></td>
</tr>
<tr>
<td class="tableblock halign-left valign-top"><p class="tableblock"><code>float</code></p></td>
<td class="tableblock halign-left valign-top"><p class="tableblock"><code>integer</code>, <code>float</code></p></td>
<td class="tableblock halign-left valign-top"><p class="tableblock">32-bit IEEE-754 floating point</p></td>
</tr>
<tr>
<td class="tableblock halign-left valign-top"><p class="tableblock"><code>inet</code></p></td>
<td class="tableblock halign-left valign-top"><p class="tableblock"><code>string</code></p></td>
<td class="tableblock halign-left valign-top"><p class="tableblock">An IP address, either IPv4 (4 bytes long) or IPv6 (16 bytes long). Note
that there is no <code>inet</code> constant, IP address should be input as strings.</p></td>
</tr>
<tr>
<td class="tableblock halign-left valign-top"><p class="tableblock"><code>int</code></p></td>
<td class="tableblock halign-left valign-top"><p class="tableblock"><code>integer</code></p></td>
<td class="tableblock halign-left valign-top"><p class="tableblock">32-bit signed int</p></td>
</tr>
<tr>
<td class="tableblock halign-left valign-top"><p class="tableblock"><code>smallint</code></p></td>
<td class="tableblock halign-left valign-top"><p class="tableblock"><code>integer</code></p></td>
<td class="tableblock halign-left valign-top"><p class="tableblock">16-bit signed int</p></td>
</tr>
<tr>
<td class="tableblock halign-left valign-top"><p class="tableblock"><code>text</code></p></td>
<td class="tableblock halign-left valign-top"><p class="tableblock"><code>string</code></p></td>
<td class="tableblock halign-left valign-top"><p class="tableblock">UTF8 encoded string</p></td>
</tr>
<tr>
<td class="tableblock halign-left valign-top"><p class="tableblock"><code>time</code></p></td>
<td class="tableblock halign-left valign-top"><p class="tableblock"><code>integer</code>, <code>string</code></p></td>
<td class="tableblock halign-left valign-top"><p class="tableblock">A time (with no corresponding date value) with nanosecond precision. See
<code>times</code> below for details.</p></td>
</tr>
<tr>
<td class="tableblock halign-left valign-top"><p class="tableblock"><code>timestamp</code></p></td>
<td class="tableblock halign-left valign-top"><p class="tableblock"><code>integer</code>, <code>string</code></p></td>
<td class="tableblock halign-left valign-top"><p class="tableblock">A timestamp (date and time) with millisecond precision. See <code>timestamps</code>
below for details.</p></td>
</tr>
<tr>
<td class="tableblock halign-left valign-top"><p class="tableblock"><code>timeuuid</code></p></td>
<td class="tableblock halign-left valign-top"><p class="tableblock"><code>uuid</code></p></td>
<td class="tableblock halign-left valign-top"><p class="tableblock">Version 1 <a href="https://en.wikipedia.org/wiki/Universally_unique_identifier">UUID</a>,
generally used as a “conflict-free” timestamp. Also see <code>timeuuid-functions</code>.</p></td>
</tr>
<tr>
<td class="tableblock halign-left valign-top"><p class="tableblock"><code>tinyint</code></p></td>
<td class="tableblock halign-left valign-top"><p class="tableblock"><code>integer</code></p></td>
<td class="tableblock halign-left valign-top"><p class="tableblock">8-bit signed int</p></td>
</tr>
<tr>
<td class="tableblock halign-left valign-top"><p class="tableblock"><code>uuid</code></p></td>
<td class="tableblock halign-left valign-top"><p class="tableblock"><code>uuid</code></p></td>
<td class="tableblock halign-left valign-top"><p class="tableblock">A <a href="https://en.wikipedia.org/wiki/Universally_unique_identifier">UUID</a> (of any version)</p></td>
</tr>
<tr>
<td class="tableblock halign-left valign-top"><p class="tableblock"><code>varchar</code></p></td>
<td class="tableblock halign-left valign-top"><p class="tableblock"><code>string</code></p></td>
<td class="tableblock halign-left valign-top"><p class="tableblock">UTF8 encoded string</p></td>
</tr>
<tr>
<td class="tableblock halign-left valign-top"><p class="tableblock"><code>varint</code></p></td>
<td class="tableblock halign-left valign-top"><p class="tableblock"><code>integer</code></p></td>
<td class="tableblock halign-left valign-top"><p class="tableblock">Arbitrary-precision integer</p></td>
</tr>
</tbody>
</table>

## Working with timestamps

- Timestamps can be input in CQL either using their value as an integer, or using a string that represents an ISO 8601 date. For instance, all of the values below are valid timestamp values for Mar 2, 2011, at 04:05:00 AM, GMT:
    - 1299038700000
    - '2011-02-03 04:05+0000'
    - '2011-02-03 04:05:00+0000'
    - '2011-02-03 04:05:00.000+0000'
    - '2011-02-03T04:05+0000'
    - '2011-02-03T04:05:00+0000'
    - '2011-02-03T04:05:00.000+0000'

## Duration type

- A duration can be input as: (quantity unit)+ like 12h30m where the unit can be:
    - y: years (12 months)
    - mo: months (1 month)
    - w: weeks (7 days)
    - d: days (1 day)
    - h: hours (3,600,000,000,000 nanoseconds)
    - m: minutes (60,000,000,000 nanoseconds)
    - s: seconds (1,000,000,000 nanoseconds)
    - ms: milliseconds (1,000,000 nanoseconds)
    - us or µs : microseconds (1000 nanoseconds)
    - ns: nanoseconds (1 nanosecond)


```CQL
// Create your own keyspace. Try using tab completion as you enter this command
CREATE KEYSPACE my_keyspace WITH replication = {'class': 'SimpleStrategy', 'replication_factor': 1};
USE my_keyspace
```




                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        AlreadyExists
    --------
    Keyspace 'my_keyspace' already exists




```CQL
CREATE TABLE RiderResults (
   rider text PRIMARY KEY,
   race text,
   result duration
);
```




    




```CQL
INSERT INTO RiderResults (rider, race, result)
   VALUES ('Christopher Froome', 'Tour de France', 89h4m48s);
```




    




```CQL
INSERT INTO RiderResults (rider, race, result)
   VALUES ('BARDET Romain', 'Tour de France', PT89H8M53S);
```




    




```CQL
INSERT INTO RiderResults (rider, race, result)
   VALUES ('QUINTANA Nairo', 'Tour de France', P0000-00-00T89:09:09);
```




    




```CQL
Select * from RiderResults
```




                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
     rider              | race           | result
    --------------------+----------------+-------------------------------------------
          BARDET Romain | Tour de France | 89.14805555555556h8.883333333333333m53.0s
     Christopher Froome | Tour de France |                           89.08h4.8m48.0s
         QUINTANA Nairo | Tour de France |                         89.1525h9.15m9.0s
    
    (3 rows)



## Maps

- A map is a (sorted) set of key-value pairs, where keys are unique and the map is sorted by its keys. You can define and insert a map with:


```CQL
CREATE TABLE users (
   id text PRIMARY KEY,
   name text,
   favs map<text, text> // A map of text keys, and text values
);
```




    




```CQL
INSERT INTO users (id, name, favs)
   VALUES ('jsmith', 'John Smith', { 'fruit' : 'Apple', 'band' : 'Beatles' });
```




    




```CQL
// Replace the existing map entirely.
UPDATE users SET favs = { 'fruit' : 'Banana' } WHERE id = 'jsmith';
```




    




```CQL
// Updating or inserting one or more elements:
UPDATE users SET favs['author'] = 'Ed Poe' WHERE id = 'jsmith';
UPDATE users SET favs = favs + { 'movie' : 'Cassablanca', 'band' : 'ZZ Top' } WHERE id = 'jsmith';
```




    




```CQL
// Removing one or more element (if an element doesn’t exist, removing it is a no-op but no error is thrown):
DELETE favs['author'] FROM users WHERE id = 'jsmith';
UPDATE users SET favs = favs - { 'movie', 'band'} WHERE id = 'jsmith';
```




    



## Sets
- A set is a (sorted) collection of unique values. You can define and insert a map with:



```CQL
CREATE TABLE images (
   name text PRIMARY KEY,
   owner text,
   tags set<text> // A set of text values
);

```




    




```CQL
INSERT INTO images (name, owner, tags)
   VALUES ('cat.jpg', 'jsmith', { 'pet', 'cute' });

```




    




```CQL
// Replace the existing set entirely
UPDATE images SET tags = { 'kitten', 'cat', 'lol' } WHERE name = 'cat.jpg';
```




    




```CQL
// Adding one or multiple elements (as this is a set, inserting an already existing element is a no-op):

UPDATE images SET tags = tags + { 'gray', 'cuddly' } WHERE name = 'cat.jpg';
```




    




```CQL
// Removing one or multiple elements (if an element doesn’t exist, removing it is a no-op but no error is thrown):

UPDATE images SET tags = tags - { 'cat' } WHERE name = 'cat.jpg';
```




    



## Lists
- A list is a (sorted) collection of non-unique values where elements are ordered by there position in the list. You can define and insert a list with:


```CQL
CREATE TABLE plays (
    id text PRIMARY KEY,
    game text,
    players int,
    scores list<int> // A list of integers
)
```




    




```CQL
INSERT INTO plays (id, game, players, scores)
           VALUES ('123-afde', 'quake', 3, [17, 4, 2]);
```




    




```CQL
// Replace the existing list entirely
UPDATE plays SET scores = [ 3, 9, 4] WHERE id = '123-afde';
```




    




```CQL
//Appending and prepending values to a list:

UPDATE plays SET players = 5, scores = scores + [ 14, 21 ] WHERE id = '123-afde';
UPDATE plays SET players = 6, scores = [ 3 ] + scores WHERE id = '123-afde';
```




    




```CQL
// Setting the value at a particular position in a list that has a pre-existing element for that position. An error will be thrown if the list does not have the position.:

UPDATE plays SET scores[1] = 7 WHERE id = '123-afde';
```




    




```CQL
// Removing an element by its position in the list that has a pre-existing element for that position. An error will be thrown if the list does not have the position. Further, as the operation removes an element from the list, the list size will decrease by one element, shifting the position of all the following elements one forward:

DELETE scores[1] FROM plays WHERE id = '123-afde';
```




    




```CQL
// Deleting all the occurrences of particular values in the list (if a particular element doesn’t occur at all in the list, it is simply ignored and no error is thrown):

UPDATE plays SET scores = scores - [ 12, 21 ] WHERE id = '123-afde';
```




    



## User-Defined Types (UDTs)
- CQL support the definition of user-defined types (UDTs). Such a type can be created, modified and removed using the create_type_statement, alter_type_statement and drop_type_statement described below. But once created, a UDT is simply referred to by its name:

- A UDT has a name (used to declared columns of that type) and is a set of named and typed fields. Fields name can be any type, including collections or other UDT. For instance:


```CQL
CREATE TYPE phone (
    country_code int,
    number text,
);

CREATE TYPE address (
    street text,
    city text,
    zip text,
    phones map<text, phone>
);

CREATE TABLE user (
    name text PRIMARY KEY,
    addresses map<text, frozen<address>>
);
```




                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   InvalidRequest
    --------
    Error from server: code=2200 [Invalid query] message="A user type with name 'address' already exists"
    AlreadyExists
    --------
    Table 'my_keyspace.user' already exists



- Altering a UDT


```CQL
ALTER TYPE address RENAME zip TO zipcode;
```




                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                InvalidRequest
    --------
    Error from server: code=2200 [Invalid query] message="Unkown field zip in user type my_keyspace"



- Dropping a UDT


```CQL
DROP TYPE IF EXISTS address
```




                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       InvalidRequest
    --------
    Error from server: code=2200 [Invalid query] message="Cannot drop user type 'my_keyspace.address' as it is still used by tables user"


