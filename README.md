# flightbooker
Simple rails application allowing users to search for flights and book them.
![Image](https://github.com/user-attachments/assets/5867e3bc-1d43-437f-a4df-665b1e688c5c)
Currently flights are not using "Departure time" date filter - because of lack of data to provide smooth experience.
Departure time can be choosen randomly and available flights will be returned anyway.
![Image](https://github.com/user-attachments/assets/95c76b01-3a6e-40b4-a6a9-76528bfe007c)
![Image](https://github.com/user-attachments/assets/7919c421-0445-4a71-8e81-0fac11be955d)
![Image](https://github.com/user-attachments/assets/b2433bf2-e751-46f2-934f-4d445ccf85f4)
Phone design example:  
![Image](https://github.com/user-attachments/assets/1bb8031f-c771-405b-bff6-286733b0d934)

## Data model diagram
![Image](https://github.com/user-attachments/assets/f236eb7d-a81f-485d-9f0d-98aebe12e054)

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

## ADMIN PANEL - airports management
Admin currently can only manage airports data(CRUD) under /airports endpoint - it requires logging in. 
![Image](https://github.com/user-attachments/assets/9b75cefa-60a2-49f1-9d83-a5e15ad41e35)
![Image](https://github.com/user-attachments/assets/9a9965d6-c008-4ad4-a56f-b0e8647949f8)
![Image](https://github.com/user-attachments/assets/9ba5598a-2503-4970-bc25-6119409c51f9)

## API Example - JSON 
Simple API request:
![Image](https://github.com/user-attachments/assets/8fa9713c-6d86-47b1-b846-5f48b84ff096)
Same request using _flightbooker_session cookie from the browser:
![Image](https://github.com/user-attachments/assets/b739e0e2-a462-4220-b487-f7d9f389cb59)

Devise-JWT gem shoult be configured in the future for better API authorization experience.