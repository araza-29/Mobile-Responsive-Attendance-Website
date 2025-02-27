import { useNavigate } from 'react-router-dom';
// @mui
import { Stack, Select} from '@mui/material';
import { LoadingButton, getCalendarPickerSkeletonUtilityClass } from '@mui/lab';
import FormControl from '@mui/material/FormControl';
import InputLabel from '@mui/material/InputLabel';
import MenuItem from '@mui/material/MenuItem';
import FormHelperText from '@mui/material/FormHelperText';
import React, { useEffect, useState } from 'react';
<<<<<<< HEAD
import { API_URL } from '../../../env';
=======
>>>>>>> c8b652e7ed2a725b8b37e0781561e025ec5e5a11

// ----------------------------------------------------------------------

export default function LoginForm() {
  const navigate = useNavigate();

  const handleClick = () => {

    const nextState = {
      yourclasses: classes,
      yoursubject: subject
    };
    console.log(classes,"hewo")
    console.log(subject,"hewo1")
    if(!classes && !subject) {
      setbothflag(false)
    }
    else if(!classes) {
      setclassflag(false)
    }
    else if(!subject) {
      setsubjectflag(false)
      setbothflag(true)
    }
    else {
      navigate('/dashboard/user', { replace: true, state: nextState });
    }
  };

  const [classes, setClasses] = React.useState('');
  const [subject, setSubject] = React.useState('');

  const [subjectData, setSubjectData] = React.useState([]);
  const [classData, setClassData] = React.useState([]);

  const [classflag,setclassflag] = React.useState(true)
  const [subjectflag,setsubjectflag] = React.useState(true)
  const [bothflag,setbothflag] = React.useState(true)

  useEffect(() => {

    getClassData()
   
  }, []);

  useEffect(() => {

    getSubjectData()
   
  }, [classes]);

  const getSubjectData = () => {

    const userId = localStorage.getItem("UserId")
    const classId = classes
    // Perform API request using fetch
<<<<<<< HEAD
    fetch(`${API_URL}/Attendance/getSubject`, {
=======
    fetch(`${process.env.REACT_APP_API_URL}/Attendance/getSubject`, {
>>>>>>> c8b652e7ed2a725b8b37e0781561e025ec5e5a11
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({ user_id: userId, class_id: classId}),
    })
      .then(response => response.json())
      .then(data => {
        console.log('Success:', data.data);

        setSubjectData(data.data)

  
        // You can handle the success response here
      })
      .catch(error => {
        console.error('Error:', error);
        // You can handle the error response here
      });

  }

  const getClassData = () => {


      const userId = localStorage.getItem("UserId");
      // Perform API request using fetch
<<<<<<< HEAD
      fetch(`${API_URL}/Attendance/getClass`, {
=======
      fetch(`${process.env.REACT_APP_API_URL}/Attendance/getClass`, {
>>>>>>> c8b652e7ed2a725b8b37e0781561e025ec5e5a11
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({ user_id:userId }),
      })
        .then(response => response.json())
        .then(data => {
            console.log('Success:', data.data);
            setClassData(data.data)
        })
        .catch(error => {
          console.error('Error:', error);
          // You can handle the error response here
        });
  
  
  };




  const handleClassChange = (event) => {
    setClasses(event.target.value);
  };
  const handleSubjectChange = (event) => {
    setSubject(event.target.value);
  };

  return (
    <>
      <Stack spacing={3}>
      {bothflag === false && (
        <div style={{ border: '2px solid red', padding: '10px', backgroundColor: 'lightpink', borderRadius: '8px' }}>
          <p style={{ color: 'red', margin: 0 }}>Invalid class and subject</p>
        </div>
      )}
      {classflag === false && bothflag ===true && (
        <div style={{ border: '2px solid red', padding: '10px', backgroundColor: 'lightpink', borderRadius: '8px' }}>
          <p style={{ color: 'red', margin: 0 }}>Invalid class</p>
        </div>
      )}
      {subjectflag === false && bothflag === true && (
        <div style={{ border: '2px solid red', padding: '10px', backgroundColor: 'lightpink', borderRadius: '8px' }}>
          <p style={{ color: 'red', margin: 0 }}>Invalid subject</p>
        </div>
      )}
        <FormControl>
          <InputLabel id="Class">Class</InputLabel>
          <Select labelId="Class" id="Class" value={classes} label="Class" onChange={handleClassChange} required>
            {classData.map((classItem) => (
            <MenuItem key={classItem.name} value={classItem.id}>
              {classItem.name}
            </MenuItem>
          ))}
          </Select>
        </FormControl>
      </Stack>
      <p> </p>
      <Stack>
        <FormControl>
          <InputLabel id="Subject">Subject</InputLabel>
          <Select labelId="Subject" id="Subject" value={subject} label="Subject" onChange={handleSubjectChange} required>
            {
              subjectData.map((Subjects)=>(
                <MenuItem key={Subjects.name} value={Subjects.id}>
                  {Subjects.name}
                </MenuItem>
              ))
            }
          </Select>
        </FormControl> 
      </Stack>
      <p> </p>
      <LoadingButton fullWidth size="large" type="submit" variant="contained" onClick={handleClick}>
        Submit
      </LoadingButton>
      <p> </p>
      <p> </p>
    </>
  );
}
