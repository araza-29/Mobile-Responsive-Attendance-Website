// component
import SvgColor from '../../../components/svg-color';

// ----------------------------------------------------------------------

const icon = (name) => <SvgColor src={`/assets/icons/navbar/${name}.svg`} sx={{ width: 1, height: 1 }} />;

const source = localStorage.getItem("source");
console.log("Navigation: ",source);
const navConfig = source === "Admin"
  ? [
      {
        title: 'Classes',
        path: '/Adminclasses',
        icon: icon('ic_lock'),
      },
      {
        title: 'Logout',
        path: '/dashboard',
        icon: icon('logout_black_1'),
      }
    ]
  : source === "Teacher"
    ? [
        {
          title: 'Classes',
          path: '/classes',
          icon: icon('ic_lock'),
        },
        {
          title: 'Logout',
          path: '/dashboard',
          icon: icon('logout_black_1'),
        }
      ]
    : [];

export default navConfig;
