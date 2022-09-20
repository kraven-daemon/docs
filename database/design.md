## Generic relational databases design recommendation

### Overall assessment

- Divides your information into subject-based tables to reduce redundant data.
- Provides Access with the information it requires to join the information in the tables together as needed.
- Helps support and ensure the accuracy and integrity of your information.
- Accommodates your data processing and reporting needs.

### Steps

1. Determine the purpose of your database

Why, what and who.
Describe what you need to keep track of, the purpose of the data and what/who is going consume it.

2. Find and organize the information required

Identify and list each items, in a non-exhaustive drafted list.
> ... Try thinking like if it were a list given by a form filled by an entity,
>even if there is no form.
Also, consider it regarding the kind of reports you would like to produce from the data.
> ... Try thinking the `requirements` to produce reports.
Repeat this process according to any report you anticipate creating.
This helps avoiding missing fields form for the data records.
Another important point relate to the method of operations on data.
> ... Try thinking if you want to sort, search, calculate, or report based on an item of information,
>then you should put that item in its own field.
Generally, the determinants of the inverse of a question is a good reverse though process.
(meaning: constructing the parameter of the answer to the question)

SO
    * prototype the reports, messages, forms (rendering results)
    * collect the requirements in the form of a list (gather fields/column)
    * refactor/dissect the list according to operations (type of queries)

3. Divide the information into tables

Identify major entities, each becomes a table.
> ... Try thinking facts about this, facts about that, etc... this/that becomes a table reference

4. Turn information items into columns

Decide what information you want to store in each table. Each item becomes a field,
and is displayed as a column in the table.
- Store in smallest possible dissected and query able units
- Don't store results any results, that's the application's jobs, unless some `memoization` records make sense

5. Specify primary keys

Choose each table’s primary key. Keys are unique identifiers.
Keys/ids identify each row.
Primary keys on more than 1 column is called `composite keys`.

6. Set up the table relationships

Look at each table and decide how the data in each table relate to one another.

 - one-to-many
A primary key becomes another table foreign key when you insert a column populated with ids
they are referred to.
```
t1 <-| t2
     | t3
```
 - many-to-many
This is two or more one-to-many relations in something called a junction tables.
Basically, another table's primary key are referred to as the primary key of another table to associate
with others primary keys, from other tables.

```
t3(t1,t2, ...) <-| t1
                 | t2
```

 - one-to-one
This is the isolation of rows from a table based on ressembling fields/column,
but isolated due to a little discongruence of field.
Usually it's used to avoid missing/empty field/column in a table's set of rows that shares commons attributes.

##### Recap
When a one-to-one or one-to-many relationship exists,
the tables involved need to share a common column or columns.
When a many-to-many relationship exists,
a third table is needed to represent the relationship.

7. Refine your design

Tables, fields, and relationships, now populate with sample data and
see what's wrong and refactor.

A good rule is to look for repeating groups and rework them.

8. Apply the normalization rules

Apply the data normalization rules to see if your tables are structured correctly.
Here be dragons.

 - First normal form
one row/column intersection, one data(unit of, not list of)
 - Second normal form
each non-key column must only depend on a single primary key
 - Third normal form
every non-key column must be dependent on only one primary key,
and those non-key columns be independent of each other.
meaning: the relation of dependance of a non-key value must not,
never, be dependent of an other non-key value.
Or, another formulation:
Column independence means that you should be able to change
any non-key column without affecting any other column.


### Further crazy
One key principle is to record facts(columns) only once, and use references to them.
For massive https://www.categoricaldata.net/
