import React from 'react';
import './style.css';

// component: 헤더 레이아웃
export default function Header() {

// event handler: 인스타 아이콘 버튼 클릭 이벤트 처리
const onInstaIconButtonClickHandler = () => {
  window.open('https://www.instagram.com')
}
// event handler: 네이버 블로그 아이콘 버튼 클릭 이벤트 처리
const onNaverBlogIconButtonClickHandler = () => {
  window.open('https://www.instagram.com')
}
  
  
// render: 헤더 레이아웃 렌더링
    return (
    <>header</>
  )
}
