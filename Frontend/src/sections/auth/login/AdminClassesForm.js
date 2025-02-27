import { useNavigate } from 'react-router-dom';
// @mui
import { Stack, Select} from '@mui/material';
import { LoadingButton, getCalendarPickerSkeletonUtilityClass } from '@mui/lab';
import FormControl from '@mui/material/FormControl';
import InputLabel from '@mui/material/InputLabel';
import MenuItem from '@mui/material/MenuItem';
import FormHelperText from '@mui/material/FormHelperText';
import React, { useEffect, useState } from 'react';
import { API_URL } from '../../../env';

// ----------------------------------------------------------------------

export default function LoginForm() {
  const navigate = useNavigate();

  const handleClick = () => {

    const nextState = {
      yourclasses: classes,
    };
    console.log(classes,"hewo")
    if(!classes) {
      setclassflag(false)
    }
    else {
      navigate('/dashboard/user', { replace: true, state: nextState });
    }
  };

  const [classes, setClasses] = React.useState('');

  const [classData, setClassData] = React.useState([]);

  const [classflag,setclassflag] = React.useState(true)

  useEffect(() => {

    getClassData()
   
  }, []);

  const getClassData = () => {


      const centerId = localStorage.getItem("centerId");
      // Perform API request using fetch
      fetch(`${API_URL}/Attendance/getAdminClass`, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({ center_id: centerId }),
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

  return (
    <>
      <Stack spacing={3}>
      {classflag === false && (
        <div style={{ border: '2px solid red', padding: '10px', backgroundColor: 'lightpink', borderRadius: '8px' }}>
          <p style={{ color: 'red', margin: 0 }}>Invalid class</p>
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
      <LoadingButton fullWidth size="large" type="submit" variant="contained" onClick={handleClick}>
        Submit
      </LoadingButton>
      <p> </p>
      <p> </p>
    </>
  );
}
