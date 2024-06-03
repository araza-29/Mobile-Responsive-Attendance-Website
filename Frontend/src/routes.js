import { Navigate, useRoutes } from 'react-router-dom';
// layouts
import DashboardLayout from './layouts/dashboard';
import SimpleLayout from './layouts/simple';
//
import UserPage from './pages/UserPage';
import LoginPage from './pages/LoginPage';
import ChoicePage from './pages/Choice';
import AdminClassesPage from './pages/AdminclassesPage';
import ClassesPage from './pages/classesPage';
import Page404 from './pages/Page404';
import DashboardAppPage from './pages/DashboardAppPage';
// ----------------------------------------------------------------------

export default function Router() {
  const routes = useRoutes([
    {
      path: '/choice',
      element: <SimpleLayout />,
      children: [
        { element: <Navigate to="/choice/app" />, index: true },
        { path: 'app', element: <ChoicePage /> },
      ],
    },
    {
      path: '/login', // Separate route for login
      element: <SimpleLayout />,
      children: [
        { element: <Navigate to="/login/app" />, index: true },
        { path: 'app', element: <LoginPage /> },
      ],
    },
    {
      path: '/dashboard',
      element: <DashboardLayout />,
      children: [
        { element: <Navigate to="/choice/app" />, index: true },
        // { path: 'app', element: <LoginPage /> },
        { path: 'user', element: <UserPage /> }
      ],
    },
    {
      path: '/classes',
      element: <ClassesPage />,
    },
    {
      path: '/Adminclasses',
      element: <AdminClassesPage />,
    },
    {
      element: <SimpleLayout />,
      children: [
        { element: <Navigate to="/choice/app" />, index: true },
        { path: '404', element: <Page404 /> },
        { path: '*', element: <Navigate to="/404" /> },
      ],
    },
    {
      path: '*',
      element: <Navigate to="/404" replace />,
    },
  ]);

  return routes;
}


// export default function Router() {
//   const routes = useRoutes([
//     {
//       path: '/dashboard',
//       element: <DashboardLayout />,
//       children: [
//         { element: <Navigate to="/dashboard/app" />, index: true },
//         { path: 'app', element: <LoginPage /> },
//         { path: 'user', element: <UserPage /> }
//       ],
//     },
//     {
//       path: '/classes',
//       element: <ClassesPage />,
//     },
//     {
//       element: <SimpleLayout />,
//       children: [
//         { element: <Navigate to="/dashboard/app" />, index: true },
//         { path: '404', element: <Page404 /> },
//         { path: '*', element: <Navigate to="/404" /> },
//       ],
//     },
//     {
//       path: '*',
//       element: <Navigate to="/404" replace />,
//     },
//   ]);

//   return routes;
// }