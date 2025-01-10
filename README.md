# flightbooker
Simple rails application allowing users to search for flights and book them.

## Data model diagram
![image](https://github.com/user-attachments/assets/e6ccacca-cfca-4e24-bcb4-c47f1db77d32)

## ADMIN USER SETUP & Initial data seed - Setting up ENVIRONMENT VARIABLE before running rails:db seed command
Devise Admin model has disabled :registerable to prevent users from creating admin accounts - admin account will be created during data seed process.
Before running seed command we should set up environment variable called "admin_password".

Admin credentials: admin@flightbooker.app / <<password>>
```
# Export "admin_password" environment variable in linux
export admin_password="<<password>>"
# Seed database data
rails db:seed
```

## Setting up CRONTAB using WHENEVER Gem - deleting expired bookings
Every booking that has payment_verified flag set to false and is older than 10 minutes will be automatically deleted.
```
# Delete current user's crontab
crontab -r
# Write whenever job commands for development environment to crontab
bundle exec whenever --update-crontab --set environment='development'
# Verify current user's crontab
crontab -l
```