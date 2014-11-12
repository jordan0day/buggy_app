# BuggyApp

Demonstrates a simple Phoenix application with one Ecto Repo and one Phoenix Topic process.

To try it out, update lib/buggy_app/repo.ex to point to a postgres db instance you have access to, then do:

- mix deps.get
- MIX_ENV=test mix etco.create BuggyApp.Repo
- MIX_ENV=test mix ecto.migrate BuggyApp.Repo
- mix test
