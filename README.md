# flightbooker
Simple rails application allowing users to search for flights and book them.

## Data model diagram
![image](https://github.com/user-attachments/assets/e6ccacca-cfca-4e24-bcb4-c47f1db77d32)

## Setting up CRONTAB using WHENEVER Gem
Every booking that has payment_verified flag set to false and is older than 10 minutes will be automatically deleted.
```
# delete current user's crontab
crontab -r
# write whenever job commands for development environment to crontab
bundle exec whenever --update-crontab --set environment='development'
# verify current user's crontab
crontab -l
```