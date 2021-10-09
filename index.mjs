import axios from 'axios';

axios.get('http://localhost:3000/hotels', {
  headers: {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'Authorization': 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyMiwiZXhwIjoxNjMzNjg4ODg2fQ.Fpq4CYk7Vu_fZtzcEMqkvFrda8gCp7tuwqIFT-ZGD1M' 
  },
    })
.then(data => { console.log(data.data) })
.catch(err => { console.log(err.data) })

// axios.post('http://localhost:3000/sessions', {
//   headers: {
//     'Accept': 'application/json',
//     'Content-Type': 'application/json',

//   },
//       username: 'tracy',
//       password: 'tracy',
//     })
// .then(data => { console.log(data.data) })
// .catch(err => { console.log(err) })

// axios.post('http://localhost:3000/registrations', {
//   headers: {
//     'Accept': 'application/json',
//     'Content-Type': 'application/json',

//   },    
//   user: {
//       username: 'tracy',
//       email: 'tracy@gmail.com',
//       password: 'tracy',
//       password_confirmation: 'tracy',
//     }})
// .then(data => { console.log(data.data) })
// .catch(err => { console.log(err) })