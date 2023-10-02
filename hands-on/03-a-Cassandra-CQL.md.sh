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




    