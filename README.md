# Mobile Responsive Attendance Website
## Languages and Frameworks
- Frontend: JavaScript (React.js)
- Backend: JavaScript (Node.js)
- Database: SQL (Sequelize ORM)
- UI Framework: Material-UI (React components)
- Server Framework: Express.js (Node.js framework)

## Overview
This project was solely built by me for attendance marking for Hassan Academy, designed to manage student attendance efficiently. The system includes both frontend and backend components. The frontend is built using React with Material-UI for the user interface. The backend is developed with Node.js and Express.js, utilizing Sequelize as the ORM for interacting with the database. This README provides an overview of the project structure, dependencies, and functionalities.

## Project Functionality
The project enables the following functionalities:

- User authentication (login/logout) with role-based access control.
- Marking attendance for students by teachers and administrators. Teachers can mark attendance of the specific subject they're teaching while administrators can mark class's subject's attendance, and the attendance of a subject can only be marked once in a day.
- Fetching classes, subjects, and students based on user roles.

## Getting Started
To get a local copy up and running, follow these simple example steps.

## Prerequisites
This is the list of things you need to use the software and how to install them.

### Node
- Download the latest version of Node.js from Node.js official website.
- Run the installer and follow the prompts. npm will be installed along with Node.js.
- Verify the installation by opening a command prompt and running the following commands:
#### Windows
```
node -v
npm -v
```
### Express
#### Global Installation:
- Open your terminal or command prompt.
- Run the following command to install Express.js globally:
#### Windows
```
npm install -g express
```
## Installation
- Clone the repositary
```
git clone 
``` 
- Install dependencies, go into the frontend and backend folders and in both run following command:
```
npm install
```
- Import the database in whatever software you're using and put the password and other details in config file in backend.

- Download and open Xamp and run sql and apache.

- Run backend and after that frontend by using the following command:
#### Backend
```
npm test
```
#### Frontend
```
npm start
```
- Use the following credntials to login inside website:
#### Teacher
```
Email: raza1234@gmail.com
Password: raza123
```
#### Admin
```
Email: ali1234@gmail.com
Password: ali123
```
