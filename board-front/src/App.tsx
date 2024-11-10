import { BrowserRouter, Route, Routes } from 'react-router-dom';
import './App.css';
import Footer from 'layouts/Footer';
import Main from 'views/Main';
import Authentication from 'views/Authentication';
import Search from 'views/Search';
import User from 'views/User';
import BoardDetail from 'views/Board/Detail';
import BoardWrite from 'views/Board/Write';
import BoardUpdate from 'views/Board/Update';
import Container from 'layouts/Container';


// component: Application 컴포넌트 
function App() {


// render : Application 컴포넌트 랜더링
/** 
 * description: 메인화면 : '/'                               - Main 
 * description: 로그인 + 회원가입 화면 : '/auth'                - Authentication
 * description: 검색화면 : '/search/:searchWord'             - Search
 * description: 유저 페이지 : '/user/:userEmail'              - User
 * description: 게시물 상세보기: '/board/detail/:boardNumber'  - BoardDetail
 * description: 게시물 작성하기: '/board/write/'               - BoardWrite 
 * description: 게시물 수정하기: '/board/update/:boardNumber'  - BoardUpdate
 */
  return (
    <Routes>
      <Route element={<Container />}>
        <Route path="/" element={<Main />} />
        <Route path="/auth" element={<Authentication />} />
        <Route path="/search" element={<Search />} />
        <Route path="/user" element={<User />} />
        <Route path="/board" >
          <Route path="write" element={<BoardWrite />} />  {/* 상대 경로로 수정 */}
          <Route path="detail/:boardNumber" element={<BoardDetail />} />
          <Route path="update/:boardNumber" element={<BoardUpdate />} />
        </Route>

      </Route>
    </Routes>
  );
}

export default App;
