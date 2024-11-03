import React from 'react';

import './App.css';
import BoardItem from "components/BoardListitem"
import { top3BoardListMock, latestBoardListMock, commentListMock, favoriteListMock } from 'mocks';
import Top3Item from 'components/top3Item';
import CommentItem from 'components/CommentItem';
import FavoriteItem from 'components/FavoriteItem';
import InputBox from 'components/InputBox';


function App() {
  return (
    <>
      <InputBox />
    </>
  );
}

export default App;
