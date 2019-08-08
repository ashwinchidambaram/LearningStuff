/*########## SQL Bootcamp ####################################################*/
/*############## Section 8: Creating Databases and Tables ####################*/
/*############################################################################*/

/*############################################################################*/
/* Data Types

Notes:
  - PostrgreSQL supports the following data types:
    - Boolean
      - Boolean holds 'true' or 'false'
        - True represented by: 1, yes, y, t, true
        - False represented by: 0, no, n, f, false
        - PSQL will display as 't' for true, 'f' for false, or ' ' (space char)
          for NULL when selecting data from bool column
      - In the case the value is unknown, the 'NULL' value is used
      - Can use the keyword 'boolean' or 'bool' when delcaring this data type

    - Character
      - Three types:
        - Single Character: 'char'

        - Fixed Length Character Strings: 'char(n)'
          - Inserting a string shorter than length of column, PSQL will pad the
            spaces
          - Inserting a string longer than length of column will cause PSQL to
            throw an error
          - NOTE: would be useful in situations where we would want to make sure *********
              that users would not be able to input a string of chars that don't
              belong there.

        - Variable Length Character Strings: 'varchar(n)'
          - Can store up to 'n' characters with variable length character
            strings
          - PSQL will NOT pad the spaces if stored string is shorter than length
            of the column

    - Number
      - Two types:
        - Integers: have three types
          - Small Integer: 'smallint'
            - 2-byte signed int w/range of (-32768, 32767)
          - Integer: 'int'
            - 4-byte int w/range of (-214783648, 214783647)
          - Serial: 'serial'
            - Same as integer, expcet PSQL will populate values into the column
              automatically
            - NOTE: similar to AUTO_INCREMENT attribute in other DB management   *********
                systems

        - Floating Point: have three types
          - Single Precision: 'float(n)'
            - floating point num w/precision n up to max of 8 bytes
          - Double Precision: 'real' or 'float8'
            - 8 byte floating point number
          - Real Number: 'numeric' or 'numeric(p, s)'
            - Real number w/'p' digits & 's' number after decimal point
            - The 'numeric(p,)' is the exact number

    - Temporal (ie: date and time related data types)
      - 'date': stores date data
      - 'time': stores time data
      - 'timestamp': stores date and time
      - 'interval': stores the difference in timestamps
      - 'timestamptz': stores both timestamp and timezone data

    - Special Types

    - Array

Basic syntax of :


EXAMPLE: */



/*############################################################################*/
/* Primary Keys and Foreign Keys

Usage:

Basic syntax of :



Notes:
  -

EXAMPLE: */



/*############################################################################*/
/* Create Table

Usage:

Basic syntax of :



Notes:
  -

EXAMPLE: */



/*############################################################################*/
/* Insert

Usage:

Basic syntax of :



Notes:
  -

EXAMPLE: */



/*############################################################################*/
/* Update

Usage:

Basic syntax of :



Notes:
  -

EXAMPLE: */



/*############################################################################*/
/* Delete

Usage:

Basic syntax of :



Notes:
  -

EXAMPLE: */



/*############################################################################*/
/* Alter Table

Usage:

Basic syntax of :



Notes:
  -

EXAMPLE: */



/*############################################################################*/
/* Drop Table

Usage:

Basic syntax of :



Notes:
  -

EXAMPLE: */



/*############################################################################*/
/* CHECK Constraint

Usage:

Basic syntax of :



Notes:
  -

EXAMPLE: */



/*############################################################################*/
/* NOT NULL Constraint

Usage:

Basic syntax of :



Notes:
  -

EXAMPLE: */



/*############################################################################*/
/* UNIQUE Constraint

Usage:

Basic syntax of :



Notes:
  -

EXAMPLE: */



/*############################################################################*/
/*

Usage:

Basic syntax of :



Notes:
  -

EXAMPLE: */



/*############################################################################*/






/*############################################################################*/
/*######################## EXTRA NOTES #######################################*/
/*############################################################################*/
/*
||1|| - This is a simple subquery
||2|| - How to use a pattern (%)

    You can construct a pattern by combining a string with wildcard characters
    and use the LIKE or NOT LIKE operators to find the matches

      - Use the percent (%) for matching any sequence of characters
      - Use the underscore (_) for matching any single character
