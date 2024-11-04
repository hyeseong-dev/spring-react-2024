import React, { useState } from 'react';

import './App.css';
import BoardItem from "components/BoardListitem"
import { top3BoardListMock, latestBoardListMock, commentListMock, favoriteListMock } from 'mocks';
import Top3Item from 'components/top3Item';
import CommentItem from 'components/CommentItem';
import FavoriteItem from 'components/FavoriteItem';
import InputBox from 'components/InputBox';


function App() {

  // temp
  const[value, setValue] = useState<string>('');


  return (
    <>
      <InputBox 
        label='이메일' 
        type='text' 
        placeholder='이메일 주소를 입력해주세요' 
        value={value} 
        error={true} 
        setValue={setValue} 
        message="오류가 발생했습니다"
      />
    </>
  );
}

export default App;
