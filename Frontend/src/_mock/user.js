import { faker } from '@faker-js/faker';
import { sample } from 'lodash';

// ----------------------------------------------------------------------

// const users = [...Array(24)].map((_, index) => ({
//   id: faker.datatype.uuid(),
//   avatarUrl: `/assets/images/avatars/avatar_${index + 1}.jpg`,
//   name: faker.name.fullName(),
//   company: faker.company.name(),
//   isVerified: faker.datatype.boolean(),
//   status: sample(['active', 'banned']),
//   role: sample([
//     'Leader',
//     'Hr Manager',
//     'UI Designer',
//     'UX Designer',
//     'UI/UX Designer',
//     'Project Manager',
//     'Backend Developer',
//     'Full Stack Designer',
//     'Front End Developer',
//     'Full Stack Developer',
//   ]),
// }));


const users = [
  {
        "id": "ece25eb1-238c-464c-8687-a9f1cefcb081",
        "roll": "1",
        "name": "Mr.sajdain",
        "status": "banned",
  },
  {
        "id": "ece25eb1-238c-464c-8687-a9f1cefcb081",
        "roll": "2",
        "name": "Mr.Ali",
        "status": "banned",
  },
  {
        "id": "ece25eb1-238c-464c-8687-a9f1cefcb081",
        "roll": "3",
        "name": "Mr.Muhammad",
        "status": "banned",
  },
  {
        "id": "ece25eb1-238c-464c-8687-a9f1cefcb081",
        "roll": "4",
        "name": "Mr. Noah Hodkiewicz",
        "status": "banned",
  }    
];




export default users;
