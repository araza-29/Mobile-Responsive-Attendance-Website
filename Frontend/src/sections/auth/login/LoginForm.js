import { useState } from 'react';
import { useNavigate } from 'react-router-dom';
// @mui
import { Stack, IconButton, InputAdornment, TextField} from '@mui/material';
import { LoadingButton } from '@mui/lab';
import { API_URL } from '../../../env';
// components
import Iconify from '../../../components/iconify';
// import tr from 'date-fns/locale/tr';
// ----------------------------------------------------------------------

export default function LoginForm() {
  const navigate = useNavigate();

  const [showPassword, setShowPassword] = useState(false);
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [passwordflag, setpasswordFlag] = useState(true)
  const [emailflag, setemailFlag] = useState(true)
  const [bothflag, setbothflag] = useState(true)
  const [existflag, setexistflag] = useState(true)
  const handleEmailChange = (e) => {
    setEmail(e.target.value);
  };


  const handlePasswordChange = (e) => {
    setPassword(e.target.value);
  };

  const handleClick = () => {
    // Perform API request using fetch
    const source = localStorage.getItem('source')
    if(source === "Teacher") {
      const roleId = "4"
    fetch(`${API_URL}/Attendance/login`, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({ email, password, roleId}),
    })
      .then(response => response.json())
      .then(data => {

        const userinfo=data.data;
        const code=data.code;

        localStorage.setItem("UserId", userinfo.id);
        localStorage.setItem("UserName", userinfo.name);
        localStorage.setItem("centerId",userinfo.center_id)
        console.log("Hewo",userinfo)
        if(code === 100) {
          setbothflag(false)
          setexistflag(true)
        }
        else if(code === 400){
          setemailFlag(false)
          setbothflag(true)
          setpasswordFlag(true)
          setexistflag(true)
        }
        else if(code === 300){
          setpasswordFlag(false)
          setemailFlag(true)
          setbothflag(true)
          setexistflag(true)
        }
        else if(code === 500){
          setexistflag(false)
          setpasswordFlag(true)
          setemailFlag(true)
          setbothflag(true)
        }
        else if(data){
          
            navigate('/classes', { replace: true });

        }


        // You can handle the success response here
      })
      .catch(error => {
        console.error('Error:', error);
        // You can handle the error response here
      });
    }
    else if(source === "Admin") {
      const roleId = "1"
      fetch(`${API_URL}/Attendance/login`, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({ email, password, roleId}),
      })
        .then(response => response.json())
        .then(data => {
  
          const userinfo=data.data;
          const code=data.code;
  
          localStorage.setItem("UserId", userinfo.id);
          localStorage.setItem("UserName", userinfo.name);
          localStorage.setItem("centerId",userinfo.center_id)
          console.log("Hewo",userinfo)
          if(code === 100) {
            setbothflag(false)
            setexistflag(true)
          }
          else if(code === 400){
            setemailFlag(false)
            setbothflag(true)
            setpasswordFlag(true)
            setexistflag(true)
          }
          else if(code === 300){
            setpasswordFlag(false)
            setemailFlag(true)
            setbothflag(true)
            setexistflag(true)
          }
          else if(code === 500){
            setexistflag(false)
            setpasswordFlag(true)
            setemailFlag(true)
            setbothflag(true)
          }
          else if(data){
            
              navigate('/Adminclasses', { replace: true });
  
          }
  
  
  
          // You can handle the success response here
        })
        .catch(error => {
          console.error('Error:', error);
          // You can handle the error response here
        });
      }
    
  };

  return (
    <>
      <Stack spacing={3}>
      {bothflag === false && (
        <div style={{ border: '2px solid red', padding: '10px', backgroundColor: 'lightpink', borderRadius: '8px' }}>
          <p style={{ color: 'red', margin: 0 }}>Invalid Password and email</p>
        </div>
      )}
      {passwordflag === false && bothflag ===true && (
        <div style={{ border: '2px solid red', padding: '10px', backgroundColor: 'lightpink', borderRadius: '8px' }}>
          <p style={{ color: 'red', margin: 0 }}>Invalid Password</p>
        </div>
      )}
      {emailflag === false && bothflag === true && (
        <div style={{ border: '2px solid red', padding: '10px', backgroundColor: 'lightpyink', borderRadius: '8px' }}>
          <p style={{ color: 'red', margin: 0 }}>Invalid Email</p>
        </div>
      )}
      {existflag === false && (
        <div style={{ border: '2px solid red', padding: '10px', backgroundColor: 'lightpink', borderRadius: '8px' }}>
          <p style={{ color: 'red', margin: 0 }}>User doesn't exist</p>
        </div>
      )}
        <TextField required name="Email" value={email}
        error={emailflag === false}
        onChange={handleEmailChange} label="Email Address" />
        <p> </p>
        <TextField 
          name="Password"
          label="Password"
          error={passwordflag === false}
          type={showPassword ? 'text' : 'password'}
          value={password}
          onChange={handlePasswordChange}
          required
          InputProps={{
            endAdornment: (
              <InputAdornment position="end">
                <IconButton onClick={() => setShowPassword(!showPassword)} edge="end">
                  <Iconify icon={showPassword ? 'eva:eye-fill' : 'eva:eye-off-fill'} />
                </IconButton>
              </InputAdornment>
            ),
          }}
        />
      </Stack>
      <p> </p>
      <LoadingButton fullWidth size="large" type="submit" variant="contained" onClick={handleClick}>
        Login
      </LoadingButton>
      <p> </p>
      <p> </p>
    </>
  );
}
