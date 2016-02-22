# How to reset an auto incrementig id sequence in ActiveRecord

> When a migration file migrated rails automatically creates an `id` column which by default set to `serial` datatype, which increments automatically as your records created.
> But when you destroy that record from that model, `id` field won't reduce its count by one.

`rails g migration CreateUser name:string description:text`
> Creates a model with `name`, `description` along with hidden `id`,`created_at` and `updated-at` columns.

`User.create(name: "dson",description: "A man with ----")`
>Creates an `User` record as `#<AutoComplete id: 1, name: "dson", description: "A man with ----">`

Delete/destroy the created record
`User.first.destroy` and try to create another `User` record 


`User.create(name: "dson",description: "A man with ----")` which creates `#<AutoComplete id: 2, name: "dson", description: "A man with ----">`  


> Even though we destroyed that record auto increment sequence won't decreases its `sequence`


You can reset that value like this 
`ModelName.connection.execute('ALTER SEQUENCE model_name_id_seq RESTART WITH 1')`
example `User.connection.execute('ALTER SEQUENCE users_id_seq RESTART WITH 1')`

This resets the `id` to 1 again.


