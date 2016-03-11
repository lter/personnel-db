# personnel-db

Information and schema documentation for the LTER personnel database, which
was originally implemented in MS SQL Server. This database operated at the LTER
Network Office in Albuquerque, and served as the main mechanism for synchronizing
information about people in the LTER network.

There are an associated set of PHP files on the dbadmin2 server which provide
a web-based interface for making changes and updates to the the data in this system.

## Original development
- James Brunt (LNO)
- Troy Maddux (LNO)

__N.B.__: This is the original LTER personnel database.  A newer version has also
been started, but was never completed.  
See the [personnelDB source code](https://github.com/lter/personnelDB/) on GitHub.

## Schema diagram
The following illustrates the personnel-db schema.
![Schema diagram.](schema/personnel-db-schema.png?raw=true)
