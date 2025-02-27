import { useNavigate } from 'react-router-dom';
import {useState} from 'react'
// @mui
import { LoadingButton } from '@mui/lab';
// components
// import tr from 'date-fns/locale/tr';
// ----------------------------------------------------------------------

export default function LoginForm() {
  const navigate = useNavigate();
  const [source, setSource] = useState('')

  const handleTeacherClick = () => {
    setSource('Teacher')
    localStorage.setItem("source",'Teacher')
    console.log("hewo",source)
    navigate('/login', { replace: true });
  };
  const handleAdminClick = () => {
    setSource('Admin')
    localStorage.setItem("source",'Admin')
    console.log("ewo",source)
    navigate('/login', { replace: true });
  };

  return (
    <>
     <LoadingButton fullWidth size="large" type="submit" variant="contained" onClick={handleAdminClick}>
        Login as admin
      </LoadingButton>
      <p> </p>
      <p> </p>
      <LoadingButton fullWidth size="large" type="submit" variant="contained" onClick={handleTeacherClick}>
        Login as teacher
      </LoadingButton>
      <p> </p>
      <p> </p>
    </>
  );
}
