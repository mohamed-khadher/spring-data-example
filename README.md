# spring-data-example

This is a test App I made using Spring Data and Spring Security.

It is about managing engineering departements (Managing teaching materials, devices, tools, equipement...)

Note: This app doesn't provide a signup method. it rather uses staticly added users (Encode passwords using BCrypt if you intend to manually add users).

Provided managment roles are : User(Can only consult the departement list), Agent(Can't delete equipements), Admin(Can do everything except managing users).
