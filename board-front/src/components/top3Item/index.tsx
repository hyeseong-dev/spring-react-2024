import React from 'react'
import './style.css';
import defaultProfileImage from 'assets/image/profile-default.svg';
import { BoardListItem } from 'types/interface';
import { useNavigate } from 'react-router-dom';


interface Props{
    top3ListItem: BoardListItem
}

// component: Top 3 List Item 컴포넌트             
export default function Top3Item({top3ListItem} : Props) {

    const { boardNumber, title, content, boardTitleImage } = top3ListItem;
    const {favoriteCount, commentCount, viewCount} = top3ListItem;
    const {writeDatetime, writerNickname, writerProfileImage} = top3ListItem;

    // const navigator = useNavigate();

    // event handler: 게시물 아이템 클릭 이벤트 처리 함수 
    const onClickHandler = () => {
        // navigator(boardNumber);
    }

// render: Top 3 List Item Component 
  return (
    <div className='top-3-list-item' style={{ backgroundImage: `url(${boardTitleImage})`}} onClick={onClickHandler}>
        <div className="top-3-list-item-main-box">
            <div className="top-3-list-item-top">
                <div className="top-3-list-item-profile-box">
                    <div className="top-3-list-item-profile-image" style={{ backgroundImage: `url(${writerProfileImage ? writerProfileImage : defaultProfileImage})`}}></div>
                </div>
                <div className="top-3-list-item-write-box">
                    <div className="top-3-list-item-nickname">{writerNickname}</div>
                    <div className="top-3-list-item-write-date">{writeDatetime}</div>
                </div>
            </div>
            <div className="top-3list-item-middle">
                <div className="top-3-list-item-title">{title}</div>
                <div className="top-3-list-item-content">{content}</div>
            </div>
            <div className="top-3list-item-bottom">
                <div className="top-3-list-item-counts">
                    {`댓글 ${commentCount} 좋아요 ${viewCount} 조회수 ${favoriteCount}`}
                </div>
            </div>
        </div>
    </div>
  )
}
