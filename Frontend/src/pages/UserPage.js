import { Helmet } from 'react-helmet-async';
import { filter } from 'lodash';
import { sentenceCase } from 'change-case';
import React, { useEffect, useState } from 'react';
import { useLocation } from 'react-router-dom';

<<<<<<< HEAD
=======

>>>>>>> c8b652e7ed2a725b8b37e0781561e025ec5e5a11
// @mui
import {
  Card,
  Table,
  Stack,
  Paper,
  Button,
  Popover,
  Checkbox,
  TableRow,
  MenuItem,
  TableBody,
  TableCell,
  Container,
  Typography,
  IconButton,
  TableContainer,
  TablePagination,
} from '@mui/material';
import { setDate } from 'date-fns';
<<<<<<< HEAD
import { API_URL } from '../env';
=======
>>>>>>> c8b652e7ed2a725b8b37e0781561e025ec5e5a11
// components
import Label from '../components/label';
import Iconify from '../components/iconify';
import Scrollbar from '../components/scrollbar';
// sections
import { UserListHead, UserListToolbar } from '../sections/@dashboard/user';
// mock
import USERLIST from '../_mock/user';


// ----------------------------------------------------------------------

const TABLE_HEAD = [
  { id: 'Roll No', label: 'Roll No', alignRight: false },
  { id: 'Name', label: 'Name', alignRight: false }
];

// ----------------------------------------------------------------------

function descendingComparator(a, b, orderBy) {
  if (b[orderBy] < a[orderBy]) {
    return -1;
  }
  if (b[orderBy] > a[orderBy]) {
    return 1;
  }
  return 0;
}

function getComparator(order, orderBy) {
  return order === 'desc'
    ? (a, b) => descendingComparator(a, b, orderBy)
    : (a, b) => -descendingComparator(a, b, orderBy);
}

function applySortFilter(array, comparator, query) {
  const stabilizedThis = array.map((el, index) => [el, index]);
  stabilizedThis.sort((a, b) => {
    const order = comparator(a[0], b[0]);
    if (order !== 0) return order;
    return a[1] - b[1];
  });
  if (query) {
    return filter(array, (_user) => _user.name.toLowerCase().indexOf(query.toLowerCase()) !== -1);
  }
  return stabilizedThis.map((el) => el[0]);
}

export default function UserPage() {

  const [studentData, setStudentData] = React.useState([]);
  const [adminData, setAdminData] = React.useState({});
  const [teacherData, setTeacherData] = React.useState({});
  const [Dateflag, setDateflag] = React.useState(false);
useEffect(()=>{
  console.log("Heyo from admin");
  if(adminData.code === 300) {
    const inputArray = selected;
    const attendanceArray = inputArray.map(id => ({ id }));
    
    const a=attendanceArray;
    const b=studentData;
    // Initialize array c
    const c = b.map(item => ({ "id": item.id, "attendance": "0" }));

    // Update attendance values based on array a
    a.forEach(idObj => {
        const matchingIndex = c.findIndex(item => item.id === idObj.id);
        if (matchingIndex !== -1) {
            c[matchingIndex].attendance = "1";
        }
    });
  const userId = localStorage.getItem("UserId");
  const res = c.map(item => (
<<<<<<< HEAD
  fetch(`${API_URL}/Attendance/AdminMarkAttendance`,{
=======
  fetch(`${process.env.REACT_APP_API_URL}/Attendance/AdminMarkAttendance`,{
>>>>>>> c8b652e7ed2a725b8b37e0781561e025ec5e5a11
    method: 'POST',
    headers:{
      'Content-Type': 'application/json',
    }, 
    body: JSON.stringify({student_id: item.id, center_id:centerId , class_id:classes, admin_id:userId, subject_id:null, status: item.attendance})
  })
    .then(response => response.json())
    .then(data=> {
      console.log('Success',data.data);
      setflag(true)
      setDateflag(false)
    })
    .catch(error => {
      console.error('Error:',error);
      })
    ))
  }
  else if (adminData.code === 200){
  setDateflag(true)
  setflag(false)
  }
},[adminData])
useEffect(()=>{
  if(teacherData.code === 300){
    const inputArray = selected;
    const attendanceArray = inputArray.map(id => ({ id }));
    
    const a=attendanceArray;
    const b=studentData;
    // Initialize array c
    const c = b.map(item => ({ "id": item.id, "attendance": "0" }));

    // Update attendance values based on array a
    a.forEach(idObj => {
        const matchingIndex = c.findIndex(item => item.id === idObj.id);
        if (matchingIndex !== -1) {
            c[matchingIndex].attendance = "1";
        }
    });
    const userId = localStorage.getItem("UserId");
    const res = c.map(item => (
<<<<<<< HEAD
    fetch(`${API_URL}/Attendance/MarkAttendance`,{
=======
    fetch(`${process.env.REACT_APP_API_URL}/Attendance/MarkAttendance`,{
>>>>>>> c8b652e7ed2a725b8b37e0781561e025ec5e5a11
      method: 'POST',
      headers:{
        'Content-Type': 'application/json',
      }, 
      body: JSON.stringify({student_id: item.id, center_id:centerId , class_id:classes, user_id:userId, subject_id:subject, status: item.attendance})
    })
    .then(response => response.json())
    .then(data=> {
      console.log('Success',data);
      setflag(true)
      setDateflag(false)
    })
    .catch(error => {
      console.error('Error:',error);
      setErrorflag(true)
      setErrors(error)
    })
    ))
  } 
  else if (teacherData.code === 200){
    setDateflag(true)
    setflag(false)
  } 
  },[teacherData])
  const location = useLocation();
  const classes = location.state?.yourclasses;
  const subject = location.state?.yoursubject;

  useEffect(() => {
    // Access classes and subject here
    console.log('Classes:', classes);
    console.log('Subject:', subject);

    getStudentData(classes,subject)

  }, []);

  const centerId = localStorage.getItem("centerId");
  const getStudentData = (classes, subject) => {

    console.log(classes,"classesss")
    console.log(subject,"subjectsss")
<<<<<<< HEAD
    fetch(`${API_URL}/Attendance/getStudent/`, {
=======
    fetch(`${process.env.REACT_APP_API_URL}/Attendance/getStudent/`, {
>>>>>>> c8b652e7ed2a725b8b37e0781561e025ec5e5a11
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({class_id:classes, center_id: centerId}),
    })
      .then(response => response.json())
      .then(data => {
        console.log('Success:', data.data);

        setStudentData(data.data)

  
        // You can handle the success response here
      })
      .catch(error => {
        console.error('Error:', error);
        // You can handle the error response here
      });


  };
  

  const [open, setOpen] = useState(null);

  const [page, setPage] = useState(0);

  const [order, setOrder] = useState('asc');

  const [selected, setSelected] = useState([]);

  const [orderBy, setOrderBy] = useState('name');

  const [filterName, setFilterName] = useState('');

  const [rowsPerPage, setRowsPerPage] = useState(30);

  const handleOpenMenu = (event) => {
    setOpen(event.currentTarget);
  };

  const handleCloseMenu = () => {
    setOpen(null);
  };

  const handleRequestSort = (event, property) => {
    const isAsc = orderBy === property && order === 'asc';
    setOrder(isAsc ? 'desc' : 'asc');
    setOrderBy(property);
  };

  const handleSelectAllClick = (event) => {
    if (event.target.checked) {
      const newSelecteds = studentData.map((n) => n.id);

      console.log(newSelecteds,"ajkjhkhkhkhkh")


      setSelected(newSelecteds);
      return;
    }

    setSelected([]);
  };

  const handleClick = (event, id) => {
    const selectedIndex = selected.indexOf(id);
    let newSelected = [];
    if (selectedIndex === -1) {
      newSelected = newSelected.concat(selected, id);
    } else if (selectedIndex === 0) {
      newSelected = newSelected.concat(selected.slice(1));
    } else if (selectedIndex === selected.length - 1) {
      newSelected = newSelected.concat(selected.slice(0, -1));
    } else if (selectedIndex > 0) {
      newSelected = newSelected.concat(selected.slice(0, selectedIndex), selected.slice(selectedIndex + 1));
    }

    setSelected(newSelected);
  };

  const handleChangePage = (event, newPage) => {
    setPage(newPage);
  };

  const handleChangeRowsPerPage = (event) => {
    setPage(0);
    setRowsPerPage(parseInt(event.target.value, 10));
  };

  const handleFilterByName = (event) => {
    setPage(0);
    setFilterName(event.target.value);
  };
  const [flag,setflag] = useState(false)
  const [errorflag,setErrorflag] = useState(false)
  const [Errors,setErrors] = useState()
  const handleAttendanceMark = () => {

    const source = localStorage.getItem("source");
    console.log("Admin",classes)
    if(source === "Admin") {
<<<<<<< HEAD
      fetch(`${API_URL}/Attendance/getAttendanceDate`,{
=======
      fetch(`${process.env.REACT_APP_API_URL}/Attendance/getAttendanceDate`,{
>>>>>>> c8b652e7ed2a725b8b37e0781561e025ec5e5a11
        method: 'POST',
        headers:{
          'Content-Type': 'application/json',
        }, 
        body: JSON.stringify({center_id:centerId , class_id:classes, role:source})
      })
      .then(response => response.json())
      .then(async data=> {
        console.log('Date Matched',data);
        setAdminData(data);
      })
      .catch(error => {
        console.error('Error:',error);
      })
  }
    else if(source === "Teacher") {
<<<<<<< HEAD
      fetch(`${API_URL}/Attendance/getAttendanceDate`,{
=======
      fetch(`${process.env.REACT_APP_API_URL}/Attendance/getAttendanceDate`,{
>>>>>>> c8b652e7ed2a725b8b37e0781561e025ec5e5a11
        method: 'POST',
        headers:{
          'Content-Type': 'application/json',
        }, 
        body: JSON.stringify({center_id:centerId , class_id:classes, role:source, subject_id: subject})
      })
      .then(response => response.json())
      .then(data=> {
        console.log('Date Matched',data);
        setTeacherData(data)
      })
      .catch(error => {
        console.error('Error:',error);
      })
  }
  };

  const emptyRows = page > 0 ? Math.max(0, (1 + page) * rowsPerPage - studentData.length) : 0;

  const filteredUsers = applySortFilter(studentData, getComparator(order, orderBy), filterName);

  const isNotFound = !filteredUsers.length && !!filterName;

  return (
    <>
      <Helmet>
        <title> Students | CAS</title>
      </Helmet>
      <Container>
        <Stack direction="row" alignItems="center" justifyContent="space-between" mb={5}>
          <Typography variant="h4" gutterBottom>
            Students
          </Typography>
        </Stack>
        {flag === true && (
        <div style={{ border: '2px solid green', padding: '8px', backgroundColor: 'lightgreen', borderRadius: '8px' }}>
          <p style={{ color: 'green', margin: 0 }}>Attendance marked successfully</p>
        </div>
        )}
         {errorflag === true && (
        <div style={{ border: '2px solid green', padding: '8px', backgroundColor: 'lightgreen', borderRadius: '8px' }}>
          <p style={{ color: 'green', margin: 0 }}>{Errors}</p>
        </div>
        )}
        {Dateflag === true && (
        <div style={{ border: '2px solid red', padding: '8px', backgroundColor: '#FFCCCB', borderRadius: '8px' }}>
          <p style={{ color: 'red', margin: 0 }}>Attendance has already been marked</p>
        </div>
        )}
        <p> </p>
        <p> </p>
        <Card>
          <UserListToolbar numSelected={selected.length} filterName={filterName} onFilterName={handleFilterByName} onAttendanceMark={handleAttendanceMark} />

          <Scrollbar>
            <TableContainer sx={{ minWidth: 800 }}>
              <Table>
                <UserListHead
                  order={order}
                  orderBy={orderBy}
                  headLabel={TABLE_HEAD}
                  rowCount={studentData.length}
                  numSelected={selected.length}
                  onRequestSort={handleRequestSort}
                  onSelectAllClick={handleSelectAllClick}
                />
                <TableBody>
                  {filteredUsers.slice(page * rowsPerPage, page * rowsPerPage + rowsPerPage).map((row) => {
                    const { id, roll, name} = row;
                    const selectedUser = selected.indexOf(id) !== -1;

                    return (
                      <TableRow hover key={id} tabIndex={-1} role="checkbox" selected={selectedUser}>
                        <TableCell padding="checkbox">
                          <Checkbox checked={selectedUser} onChange={(event) => handleClick(event, id)} />
                        </TableCell>

                        <TableCell align="left">{roll}</TableCell>

                        <TableCell component="th" scope="row" padding="none"  width="73%">
                          <Stack direction="row" alignItems="center" spacing={2}>
                            <Typography variant="subtitle2" noWrap>
                              {name}
                            </Typography>
                          </Stack>
                        </TableCell>

                       
                      </TableRow>
                    );
                  })}
                  {emptyRows > 0 && (
                    <TableRow style={{ height: 53 * emptyRows }}>
                      <TableCell colSpan={6} />
                    </TableRow>
                  )}
                </TableBody>

                {isNotFound && (
                  <TableBody>
                    <TableRow>
                      <TableCell align="center" colSpan={6} sx={{ py: 3 }}>
                        <Paper
                          sx={{
                            textAlign: 'center',
                          }}
                        >
                          <Typography variant="h6" paragraph>
                            Not found
                          </Typography>

                          <Typography variant="body2">
                            No results found for &nbsp;
                            <strong>&quot;{filterName}&quot;</strong>.
                            <br /> Try checking for typos or using complete words.
                          </Typography>
                        </Paper>
                      </TableCell>
                    </TableRow>
                  </TableBody>
                )}
              </Table>
            </TableContainer>
          </Scrollbar>

          <TablePagination
            rowsPerPageOptions={[30, 40, 50]}
            component="div"
            count={studentData.length}
            rowsPerPage={rowsPerPage}
            page={page}
            onPageChange={handleChangePage}
            onRowsPerPageChange={handleChangeRowsPerPage}
          />
        </Card>
      </Container>

      <Popover
        open={Boolean(open)}
        anchorEl={open}
        onClose={handleCloseMenu}
        anchorOrigin={{ vertical: 'top', horizontal: 'left' }}
        transformOrigin={{ vertical: 'top', horizontal: 'right' }}
        PaperProps={{
          sx: {
            p: 1,
            width: 140,
            '& .MuiMenuItem-root': {
              px: 1,
              typography: 'body2',
              borderRadius: 0.75,
            },
          },
        }}
      >
        <MenuItem>
          <Iconify icon={'eva:edit-fill'} sx={{ mr: 2 }} />
          Edit
        </MenuItem>

        <MenuItem sx={{ color: 'error.main' }}>
          <Iconify icon={'eva:trash-2-outline'} sx={{ mr: 2 }} />
          Delete
        </MenuItem>
      </Popover>
    </>
  );
}
