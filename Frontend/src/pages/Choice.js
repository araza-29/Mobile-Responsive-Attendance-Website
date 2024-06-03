import { Helmet } from 'react-helmet-async';
// @mui
import { styled } from '@mui/material/styles';
import {Container, Typography} from '@mui/material';
// hooks
import ChoiceForm from '../sections/auth/login/ChoiceForm';

// ----------------------------------------------------------------------

const StyledRoot = styled('div')(({ theme }) => ({
  [theme.breakpoints.up('md')]: {
    display: 'flex',
  },
}));

const StyledSection = styled('div')(({ theme }) => ({
  width: '100%',
  maxWidth: 700,
  maxHeight: 500,
  margin: 'auto',
  position: 'relative',
  top: 80,  
  left: 5,
  display: 'flex',
  flexDirection: 'column',
  justifyContent: 'center',
  boxShadow: theme.customShadows.card,
  backgroundColor: theme.palette.background.default,
}));

const StyledContent = styled('div')(({ theme }) => ({
  maxWidth: 480,
  margin: 'auto',
  minHeight: '100vh',
  display: 'flex',
  justifyContent: 'center',
  flexDirection: 'column',
  padding: theme.spacing(12, 0),
}));

// ----------------------------------------------------------------------

export default function LoginPage() {

  return (
    <>
      <Helmet>
        <title> Login | CAS </title>
      </Helmet>

      <StyledRoot>

          <StyledSection>
            <Container maxWidth="sm">
          <StyledContent>
            <Typography variant="h4" gutterBottom>
              Sign in
            </Typography>
            <p> </p>
            <ChoiceForm />
          </StyledContent>
        </Container>
          </StyledSection>

      </StyledRoot>
    </>
  );
}
