
User
---
first_name present
last_name present
email unique present
password_digest (test for bcryp and has_secure_password)

UsersController
---

index
  - return all users
  - status 200

create
  - We create a user with the params
  - that the user is valid
  - if the user isn't valid, we'll check if errors are being sent
  - if the user is valid that status code 201 is sent